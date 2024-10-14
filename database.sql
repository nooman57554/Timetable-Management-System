-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2024 at 06:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timetable_manage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_username`, `admin_password`) VALUES
(1, 'admin1', 'password1'),
(2, 'admin2', 'password2');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`) VALUES
(1, 'LH20'),
(2, 'LH21'),
(3, 'LH22'),
(4, 'LH23'),
(5, 'LH24'),
(6, 'LH25');

-- --------------------------------------------------------

--
-- Table structure for table `lab_assistants`
--

CREATE TABLE `lab_assistants` (
  `assistant_id` int(11) NOT NULL,
  `assistant_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lab_assistants`
--

INSERT INTO `lab_assistants` (`assistant_id`, `assistant_name`) VALUES
(1, 'Assistant A'),
(2, 'Assistant B'),
(3, 'Assistant C');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `slot` varchar(20) NOT NULL,
  `subject_id` varchar(20) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `assistant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `day`, `slot`, `subject_id`, `teacher_id`, `class_id`, `section`, `batch`, `assistant_id`) VALUES
(1, 'Monday', '9AM - 10AM', 'CSE801', 1, 1, '8A', NULL, NULL),
(2, 'Monday', '10AM - 11AM', 'CSE802', 2, 1, '8A', NULL, NULL),
(3, 'Monday', '11AM - 12PM', 'CSE803', 3, 1, '8A', NULL, NULL),
(4, 'Monday', '12PM - 1PM', 'CSE804', 4, 1, '8A', NULL, NULL),
(5, 'Monday', '1PM - 2PM', 'CSE805', 1, 1, '8A', NULL, NULL),
(6, 'Monday', '2PM - 3PM', 'CSE806', 2, 1, '8A', NULL, NULL),
(7, 'Tuesday', '9AM - 10AM', 'CSE801', 1, 1, '8A', NULL, NULL),
(8, 'Tuesday', '10AM - 11AM', 'CSE802', 2, 1, '8A', NULL, NULL),
(9, 'Tuesday', '11AM - 12PM', 'CSE803', 3, 1, '8A', NULL, NULL),
(10, 'Tuesday', '12PM - 1PM', 'CSE804', 4, 1, '8A', NULL, NULL),
(11, 'Tuesday', '1PM - 2PM', 'CSE805', 1, 1, '8A', NULL, NULL),
(12, 'Tuesday', '2PM - 3PM', 'CSE806', 2, 1, '8A', NULL, NULL),
(13, 'Wednesday', '9AM - 10AM', 'CSE801', 1, 1, '8A', NULL, NULL),
(14, 'Wednesday', '10AM - 11AM', 'CSE802', 2, 1, '8A', NULL, NULL),
(15, 'Wednesday', '11AM - 12PM', 'CSE803', 3, 1, '8A', NULL, NULL),
(16, 'Wednesday', '12PM - 1PM', 'CSE804', 4, 1, '8A', NULL, NULL),
(17, 'Wednesday', '1PM - 2PM', 'CSE805', 1, 1, '8A', NULL, NULL),
(18, 'Wednesday', '2PM - 3PM', 'CSE806', 2, 1, '8A', NULL, NULL),
(19, 'Thursday', '9AM - 10AM', 'CSE801', 1, 1, '8A', NULL, NULL),
(20, 'Monday', '10AM - 11AM', 'CSE801', 1, 2, '8B', NULL, NULL),
(21, 'Monday', '9AM - 10AM', 'CSE802', 2, 2, '8B', NULL, NULL),
(22, 'Monday', '12PM - 1PM', 'CSE803', 3, 2, '8B', NULL, NULL),
(23, 'Monday', '11AM - 12PM', 'CSE804', 4, 2, '8B', NULL, NULL),
(24, 'Monday', '2PM - 3PM', 'CSE805', 1, 2, '8B', NULL, NULL),
(25, 'Monday', '1PM - 2PM', 'CSE806', 2, 2, '8B', NULL, NULL),
(26, 'Tuesday', '10AM - 11AM', 'CSE801', 1, 2, '8B', NULL, NULL),
(27, 'Tuesday', '9AM - 10AM', 'CSE802', 2, 2, '8B', NULL, NULL),
(28, 'Tuesday', '12PM - 1PM', 'CSE803', 3, 2, '8B', NULL, NULL),
(29, 'Tuesday', '11AM - 12PM', 'CSE804', 4, 2, '8B', NULL, NULL),
(30, 'Tuesday', '2PM - 3PM', 'CSE805', 1, 2, '8B', NULL, NULL),
(31, 'Tuesday', '1PM - 2PM', 'CSE806', 2, 2, '8B', NULL, NULL),
(32, 'Wednesday', '10AM - 11AM', 'CSE801', 1, 2, '8B', NULL, NULL),
(33, 'Wednesday', '9AM - 10AM', 'CSE802', 2, 2, '8B', NULL, NULL),
(34, 'Wednesday', '12PM - 1PM', 'CSE803', 3, 2, '8B', NULL, NULL),
(35, 'Wednesday', '11AM - 12PM', 'CSE804', 4, 2, '8B', NULL, NULL),
(36, 'Wednesday', '2PM - 3PM', 'CSE805', 1, 2, '8B', NULL, NULL),
(37, 'Wednesday', '1PM - 2PM', 'CSE806', 2, 2, '8B', NULL, NULL),
(38, 'Thursday', '10AM - 11AM', 'CSE801', 1, 1, '8B', NULL, NULL),
(39, 'Monday', '11AM - 12PM', 'CSE701', 1, 3, '7A', NULL, NULL),
(40, 'Monday', '12PM - 1PM', 'CSE702', 2, 3, '7A', NULL, NULL),
(41, 'Monday', '9AM - 10AM', 'CSE703', 3, 3, '7A', NULL, NULL),
(42, 'Monday', '10AM - 11AM', 'CSE704', 4, 3, '7A', NULL, NULL),
(43, 'Monday', '3PM - 4PM', 'CSE705', 1, 1, '7A', NULL, NULL),
(44, 'Tuesday', '11AM - 12PM', 'CSE701', 1, 3, '7A', NULL, NULL),
(45, 'Tuesday', '12PM - 1PM', 'CSE702', 2, 3, '7A', NULL, NULL),
(46, 'Tuesday', '9AM - 10AM', 'CSE703', 3, 3, '7A', NULL, NULL),
(47, 'Tuesday', '10AM - 11AM', 'CSE704', 4, 3, '7A', NULL, NULL),
(48, 'Tuesday', '3PM - 4PM', 'CSE705', 1, 1, '7A', NULL, NULL),
(49, 'Wednesday', '11AM - 12PM', 'CSE701', 1, 3, '7A', NULL, NULL),
(50, 'Wednesday', '12PM - 1PM', 'CSE702', 2, 3, '7A', NULL, NULL),
(51, 'Wednesday', '9AM - 10AM', 'CSE703', 3, 3, '7A', NULL, NULL),
(52, 'Wednesday', '10AM - 11AM', 'CSE704', 4, 3, '7A', NULL, NULL),
(53, 'Wednesday', '3PM - 4PM', 'CSE705', 1, 1, '7A', NULL, NULL),
(54, 'Thursday', '11AM - 12PM', 'CSE701', 1, 1, '7A', NULL, NULL),
(55, 'Thursday', '9AM - 10AM', 'CSE706', 2, 2, '7A', NULL, NULL),
(56, 'Friday', '9AM - 10AM', 'CSE706', 2, 1, '7A', NULL, NULL),
(57, 'Saturday', '9AM - 10AM', 'CSE706', 2, 1, '7A', NULL, NULL),
(58, 'Monday', '12PM - 1PM', 'CSE701', 1, 4, '7B', NULL, NULL),
(59, 'Monday', '11AM - 12PM', 'CSE702', 2, 4, '7B', NULL, NULL),
(60, 'Monday', '10AM - 11AM', 'CSE703', 3, 4, '7B', NULL, NULL),
(61, 'Monday', '9AM - 10AM', 'CSE704', 4, 4, '7B', NULL, NULL),
(62, 'Monday', '3PM - 4PM', 'CSE706', 2, 2, '7B', NULL, NULL),
(63, 'Tuesday', '12PM - 1PM', 'CSE701', 1, 4, '7B', NULL, NULL),
(64, 'Tuesday', '11AM - 12PM', 'CSE702', 2, 4, '7B', NULL, NULL),
(65, 'Tuesday', '10AM - 11AM', 'CSE703', 3, 4, '7B', NULL, NULL),
(66, 'Tuesday', '9AM - 10AM', 'CSE704', 4, 4, '7B', NULL, NULL),
(67, 'Tuesday', '3PM - 4PM', 'CSE706', 2, 2, '7B', NULL, NULL),
(68, 'Wednesday', '12PM - 1PM', 'CSE701', 1, 4, '7B', NULL, NULL),
(69, 'Wednesday', '11AM - 12PM', 'CSE702', 2, 4, '7B', NULL, NULL),
(70, 'Wednesday', '10AM - 11AM', 'CSE703', 3, 4, '7B', NULL, NULL),
(71, 'Wednesday', '9AM - 10AM', 'CSE704', 4, 4, '7B', NULL, NULL),
(72, 'Wednesday', '3PM - 4PM', 'CSE706', 2, 2, '7B', NULL, NULL),
(73, 'Thursday', '12PM - 1PM', 'CSE701', 1, 1, '7B', NULL, NULL),
(74, 'Thursday', '1PM - 2PM', 'CSE705', 1, 1, '7B', NULL, NULL),
(75, 'Friday', '9AM - 10AM', 'CSE705', 1, 2, '7B', NULL, NULL),
(76, 'Saturday', '9AM - 10AM', 'CSE705', 1, 2, '7B', NULL, NULL),
(77, 'Thursday', '2PM - 3PM', 'CSE101', 1, 1, '1A', NULL, NULL),
(78, 'Thursday', '10AM - 11AM', 'CSE102', 2, 2, '1A', NULL, NULL),
(79, 'Thursday', '3PM - 4PM', 'CSE105', 1, 1, '1A', NULL, NULL),
(80, 'Thursday', '11AM - 12PM', 'CSE106', 2, 2, '1A', NULL, NULL),
(81, 'Friday', '10AM - 11AM', 'CSE101', 1, 1, '1A', NULL, NULL),
(82, 'Friday', '11AM - 12PM', 'CSE102', 2, 1, '1A', NULL, NULL),
(83, 'Friday', '12PM - 1PM', 'CSE105', 1, 1, '1A', NULL, NULL),
(84, 'Friday', '1PM - 2PM', 'CSE106', 2, 1, '1A', NULL, NULL),
(85, 'Saturday', '10AM - 11AM', 'CSE101', 1, 1, '1A', NULL, NULL),
(86, 'Saturday', '11AM - 12PM', 'CSE102', 2, 1, '1A', NULL, NULL),
(87, 'Monday', '1PM - 2PM', 'CSE103', 3, 3, '1A', NULL, NULL),
(88, 'Monday', '2PM - 3PM', 'CSE104', 4, 3, '1A', NULL, NULL),
(89, 'Tuesday', '1PM - 2PM', 'CSE103', 3, 3, '1A', NULL, NULL),
(90, 'Tuesday', '2PM - 3PM', 'CSE104', 4, 3, '1A', NULL, NULL),
(91, 'Wednesday', '1PM - 2PM', 'CSE103', 3, 3, '1A', NULL, NULL),
(92, 'Wednesday', '2PM - 3PM', 'CSE104', 4, 3, '1A', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `SectionName` varchar(10) NOT NULL,
  `Sem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`SectionName`, `Sem`) VALUES
('1A', 1),
('1B', 1),
('2A', 2),
('2B', 2),
('3A', 3),
('3B', 3),
('4A', 4),
('4B', 4),
('5A', 5),
('5B', 5),
('6A', 6),
('6B', 6),
('7A', 7),
('7B', 7),
('8A', 8),
('8B', 8);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_username` varchar(255) NOT NULL,
  `student_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_username`, `student_password`) VALUES
(1, 'student1', 'password1'),
(2, 'student2', 'password2'),
(3, 'student3', 'password3'),
(4, 'student4', 'password4');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` varchar(20) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `no_hours_per_week` int(11) NOT NULL,
  `Sem_id` int(11) NOT NULL CHECK (`Sem_id` between 1 and 8)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `no_hours_per_week`, `Sem_id`) VALUES
('CSE101', 'Introduction to Programming', 4, 1),
('CSE102', 'Mathematics I', 3, 1),
('CSE103', 'Physics', 3, 1),
('CSE104', 'Basic Electronics', 3, 1),
('CSE105', 'Engineering Graphics', 2, 1),
('CSE106', 'Communication Skills', 2, 1),
('CSE201', 'Data Structures', 4, 2),
('CSE202', 'Mathematics II', 3, 2),
('CSE203', 'Chemistry', 3, 2),
('CSE204', 'Digital Logic', 3, 2),
('CSE205', 'Environmental Science', 2, 2),
('CSE206', 'Workshop Practice', 2, 2),
('CSE301', 'Algorithms', 4, 3),
('CSE302', 'Computer Architecture', 3, 3),
('CSE303', 'Database Systems', 3, 3),
('CSE304', 'Operating Systems', 3, 3),
('CSE305', 'Discrete Mathematics', 3, 3),
('CSE306', 'Object-Oriented Programming', 3, 3),
('CSE401', 'Computer Networks', 4, 4),
('CSE402', 'Software Engineering', 3, 4),
('CSE403', 'Theory of Computation', 3, 4),
('CSE404', 'Microprocessors', 3, 4),
('CSE405', 'Probability and Statistics', 3, 4),
('CSE406', 'Web Technologies', 3, 4),
('CSE501', 'Machine Learning', 4, 5),
('CSE502', 'Artificial Intelligence', 3, 5),
('CSE503', 'Compiler Design', 3, 5),
('CSE504', 'Data Mining', 3, 5),
('CSE505', 'Computer Graphics', 3, 5),
('CSE506', 'Cryptography', 3, 5),
('CSE601', 'Cloud Computing', 4, 6),
('CSE602', 'Big Data Analytics', 3, 6),
('CSE603', 'Internet of Things', 3, 6),
('CSE604', 'Distributed Systems', 3, 6),
('CSE605', 'Human-Computer Interaction', 3, 6),
('CSE606', 'Computer Vision', 3, 6),
('CSE701', 'Natural Language Processing', 4, 7),
('CSE702', 'Software Testing', 3, 7),
('CSE703', 'Mobile Computing', 3, 7),
('CSE704', 'Cyber Security', 3, 7),
('CSE705', 'Game Development', 3, 7),
('CSE706', 'Ethical Hacking', 3, 7),
('CSE801', 'Blockchain Technology', 4, 8),
('CSE802', 'Advanced Databases', 3, 8),
('CSE803', 'Parallel Computing', 3, 8),
('CSE804', 'Advanced Algorithms', 3, 8),
('CSE805', 'Data Science', 3, 8),
('CSE806', 'Project Management', 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `teacher_name`) VALUES
(1, 'John Smith'),
(2, 'Jane Doe'),
(3, 'Alice Johnson'),
(4, 'Bob Brown');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_username` (`admin_username`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `lab_assistants`
--
ALTER TABLE `lab_assistants`
  ADD PRIMARY KEY (`assistant_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `assistant_id` (`assistant_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_username` (`student_username`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_name` (`subject_name`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lab_assistants`
--
ALTER TABLE `lab_assistants`
  MODIFY `assistant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`assistant_id`) REFERENCES `lab_assistants` (`assistant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
