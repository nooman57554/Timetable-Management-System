<?php
header('Content-Type: application/json');

// Ensure admin is logged in
session_start();
$admin_id = $_SESSION['user_id'] ?? null;
if (!$admin_id) {
    echo json_encode(['status' => 'error', 'message' => 'Unauthorized access']);
    exit();
}

// Check if the form data is set
if (!isset($_POST['section']) || !isset($_POST['assignments'])) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid form submission.']);
    exit();
}

// Initialize an array to store messages
$messages = [];

// Extract data from the POST request
$section = $_POST['section'];
$assignments = $_POST['assignments']; // This contains an array of serialized data

// Process serialized data into structured format
$teacherAssignments = [];

foreach ($assignments as $item) {
    if (strpos($item['name'], 'teachers') === 0) {
        $subject_id = str_replace(['teachers[', ']'], '', $item['name']);
        $teacherAssignments[$subject_id] = $item['value'];
    }
}

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "timetable_manage";

$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    echo json_encode(['status' => 'error', 'message' => 'Database connection failed.']);
    exit();
}

// Fetch all classrooms
$classroom_query = "SELECT class_id FROM classes";
$classroom_result = $conn->query($classroom_query);
$classrooms = [];
while ($row = $classroom_result->fetch_assoc()) {
    $classrooms[] = $row['class_id'];
}

// Fetch the existing timetable for conflict checking
$existing_timetable_query = "SELECT * FROM schedule";
$existing_timetable_result = $conn->query($existing_timetable_query);
$existing_timetable = [];
while ($row = $existing_timetable_result->fetch_assoc()) {
    $existing_timetable[$row['day']][$row['slot']][] = [
        'teacher_id' => $row['teacher_id'],
        'class_id' => $row['class_id'],
        'subject_id' => $row['subject_id'],
        'section' => $row['section']
    ];
}

// Define the days and time slots
$days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
$time_slots = ['9AM - 10AM', '10AM - 11AM', '11AM - 12PM', '12PM - 1PM', '1PM - 2PM', '2PM - 3PM', '3PM - 4PM'];
$timetable = [];

// Helper function to check availability
function isAvailable($day, $slot, $teacher_id, $classroom_id, $section, $existing_timetable, $timetable) {
    // Check if the teacher is available
    if (isset($existing_timetable[$day][$slot])) {
        foreach ($existing_timetable[$day][$slot] as $entry) {
            if ($entry['teacher_id'] == $teacher_id) {
                return false;
            }
        }
    }
    if (isset($timetable[$day][$slot])) {
        foreach ($timetable[$day][$slot] as $entry) {
            if ($entry['teacher_id'] == $teacher_id) {
                return false;
            }
        }
    }

    // Check if the section is free (students available)
    if (isset($existing_timetable[$day][$slot])) {
        foreach ($existing_timetable[$day][$slot] as $entry) {
            if ($entry['section'] == $section) {
                return false;
            }
        }
    }
    if (isset($timetable[$day][$slot])) {
        foreach ($timetable[$day][$slot] as $entry) {
            if ($entry['section'] == $section) {
                return false;
            }
        }
    }

    // Check if the classroom is available
    if (isset($existing_timetable[$day][$slot])) {
        foreach ($existing_timetable[$day][$slot] as $entry) {
            if ($entry['class_id'] == $classroom_id) {
                return false;
            }
        }
    }
    if (isset($timetable[$day][$slot])) {
        foreach ($timetable[$day][$slot] as $entry) {
            if ($entry['class_id'] == $classroom_id) {
                return false;
            }
        }
    }

    return true;
}

// Fetch the number of hours per week for each subject
$subjectHours = [];
foreach ($teacherAssignments as $subject_id => $teacher_id) {
    $subject_query = "SELECT no_hours_per_week FROM subjects WHERE subject_id = ?";
    $subject_stmt = $conn->prepare($subject_query);
    $subject_stmt->bind_param("s", $subject_id);
    $subject_stmt->execute();
    $subject_stmt->bind_result($no_hours_per_week);
    $subject_stmt->fetch();
    $subjectHours[$subject_id] = $no_hours_per_week;
    $subject_stmt->close();
}

// Iterate over subjects to allocate classes
foreach ($teacherAssignments as $subject_id => $teacher_id) {
    $no_hours_per_week = $subjectHours[$subject_id];
    $hours_allocated = 0;
    $days_allocated = [];

    while ($hours_allocated < $no_hours_per_week) {
        $day_allocated = false;

        foreach ($days as $day) {
            if (in_array($day, $days_allocated)) {
                continue; // Skip if this day is already allocated for this subject
            }

            foreach ($time_slots as $slot) {
                $available_classroom = null;
                foreach ($classrooms as $classroom_id) {
                    if (isAvailable($day, $slot, $teacher_id, $classroom_id, $section, $existing_timetable, $timetable)) {
                        $available_classroom = $classroom_id;
                        break;
                    }
                }

                if ($available_classroom !== null) {
                    // Assign subject to the timetable
                    $timetable[$day][$slot][] = [
                        'subject_id' => $subject_id,
                        'teacher_id' => $teacher_id,
                        'class_id' => $available_classroom,
                        'section' => $section
                    ];

                    $hours_allocated++;
                    $days_allocated[] = $day;
                    $day_allocated = true;
                    break;
                }
            }

            if ($day_allocated) {
                break;
            }
        }

        // If no slot was allocated for the current subject, break to avoid an infinite loop
        if (!$day_allocated) {
            break;
        }
    }

    // Check if the subject was not fully scheduled
    if ($hours_allocated < $no_hours_per_week) {
        $messages[] = "Warning: Could not schedule all required hours for subject ID: {$subject_id}.";
    }
}

// Insert the generated timetable into the database
$insert_query = "
    INSERT INTO schedule (day, slot, subject_id, teacher_id, class_id, section)
    VALUES (?, ?, ?, ?, ?, ?)";
$insert_stmt = $conn->prepare($insert_query);

foreach ($timetable as $day => $slots) {
    foreach ($slots as $slot => $details_list) {
        foreach ($details_list as $details) {
            $insert_stmt->bind_param(
                "ssssss",
                $day,
                $slot,
                $details['subject_id'],
                $details['teacher_id'],
                $details['class_id'],
                $details['section']
            );
            $insert_stmt->execute();
        }
    }
}

// Add success message to array
$messages[] = "Timetable generated successfully!";

// Close the database connection
$conn->close();

// Return JSON response
echo json_encode(['status' => 'success', 'messages' => $messages]);
?>
