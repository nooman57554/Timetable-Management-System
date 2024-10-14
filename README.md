# Timetable Management System  

A **web-based timetable management system** built using **HTML, CSS, JavaScript, PHP, and MySQL** to efficiently create, manage, display, and delete class schedules, including support for labs and multiple sections. This project streamlines the process of managing educational timetables with features such as real-time updates, error handling, and an auto-generate timetable functionality.

---

## Table of Contents  
- [Features](#features)  
- [Technologies Used](#technologies-used)  
- [System Requirements](#system-requirements)  
  - [Software](#software)  
  - [Hardware](#hardware)  
- [Installation](#installation)   

---

## Features  
- **Login System**: Provides secure access to authorized users for managing timetables.  
- **Class Allotment**:  
  - Dynamic form for assigning classes and labs with batch management.  
  - Validation to prevent conflicts based on teacher availability, class occupancy, and student engagement.  
- **Auto-Generate Timetable**: Automatically creates conflict-free timetables based on constraints like time slots, teacher schedules, and room availability.  
- **Master Timetable Display**: Real-time timetable display with support for multiple sections, batch-wise labs, and merged slots for multi-hour classes.  
- **CRUD Operations**: Add, view, update, and delete schedules from the system seamlessly.  
- **Responsive Design**: User-friendly interface with a narrow input form and wide timetable view for better usability.  

---

## Technologies Used  
- **Frontend**:  
  - HTML, CSS for page structure and styling.  
  - JavaScript for dynamic form handling and real-time updates.  

- **Backend**:  
  - PHP for server-side scripting and database interactions.  
  - MySQL for managing database operations and storing schedules.  

---

## System Requirements  
### Software  
- Web server: Apache or Nginx (e.g., XAMPP, WAMP, or LAMP stack)  
- Database: MySQL or MariaDB  
- Browser: Any modern browser (e.g., Chrome, Firefox, Safari)  

### Hardware  
- Processor: Dual-core or higher  
- RAM: Minimum 4 GB  
- Storage: 1 GB of free space  

---

## Installation  
1. **Clone the repository**:  
   ```bash
   git clone https://github.com/your-username/timetable-management-system.git
   cd timetable-management-system

Here is the Markdown code for the installation guide:

Installation


Step 1: Clone the Repository
 ```bash
   git clone https://github.com/nooman57554/timetable-management-system.git
   cd timetable-management-system
```

Step 2: Setup the Database


Using phpMyAdmin

1. Open phpMyAdmin in your web browser.
2. Click on the Databases tab and create a new database (e.g., timetable_management).
3. Select the newly created database.
4. Click on the Import tab.
5. Choose the database.sql file from your project directory and click Go.

Using the Command Line


```bash
  mysql -u your_username -p timetable_management < database.sql
```

Replace your_username with your MySQL username.

Step 3: Start the Server


Using XAMPP or WAMP

1. Start the Apache server from the control panel.

Using Built-in PHP Server


```bash
  php -S localhost:8000
```

Step 4: Access the System


1. Open your web browser and go to:
```
   http://localhost:8000
```

