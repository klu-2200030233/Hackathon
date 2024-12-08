<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #6a1b9a;
            --secondary-color: #4a148c;
            --background-light: #f0f4f8;
            --text-color: #333;
            --white: #ffffff;
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-light);
            line-height: 1.6;
            color: var(--text-color);
            display: flex;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Advanced Side Navigation */
        .side-navbar {
            width: 280px;
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            transition: width var(--transition-speed) ease;
            overflow-x: hidden;
            z-index: 1000;
            box-shadow: 5px 0 15px rgba(0,0,0,0.1);
        }

        .side-navbar-mini {
            width: 80px;
        }

        .nav-header {
            display: flex;
            align-items: center;
            padding: 20px;
            background: rgba(0,0,0,0.1);
            color: var(--white);
        }

        .nav-header i {
            font-size: 24px;
            margin-right: 15px;
        }

        .nav-header h2 {
            font-weight: 300;
            opacity: 1;
            transition: opacity var(--transition-speed) ease;
        }

        .side-navbar-mini .nav-header h2 {
            opacity: 0;
            width: 0;
        }

        .navbar-nav {
            list-style: none;
            padding: 20px 0;
        }

        .nav-item {
            position: relative;
        }

        .nav-link {
            display: flex;
            align-items: center;
            color: var(--white);
            text-decoration: none;
            padding: 15px 20px;
            transition: background-color var(--transition-speed) ease;
        }

        .nav-link i {
            margin-right: 15px;
            font-size: 20px;
            min-width: 30px;
            text-align: center;
        }

        .nav-link span {
            opacity: 1;
            transition: opacity var(--transition-speed) ease;
        }

        .side-navbar-mini .nav-link span {
            opacity: 0;
            width: 0;
        }

        .nav-link:hover {
            background-color: rgba(255,255,255,0.1);
        }

        /* Main Content Area */
        .main-content {
            flex-grow: 1;
            margin-left: 280px;
            padding: 30px;
            background-color: var(--background-light);
            transition: margin-left var(--transition-speed) ease;
        }

        .side-navbar-mini + .main-content {
            margin-left: 80px;
        }

        .form-container {
            background: var(--white);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
            animation: fade-in 0.5s ease;
        }

        @keyframes fade-in {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-color);
            font-weight: 600;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: border-color var(--transition-speed) ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(106, 27, 154, 0.1);
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all var(--transition-speed) ease;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .btn-secondary {
            background-color: #f0f0f0;
            color: var(--text-color);
        }

        .btn-secondary:hover {
            background-color: #e0e0e0;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .side-navbar {
                width: 0;
                position: absolute;
            }

            .main-content {
                margin-left: 0;
                padding: 15px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Side Navigation -->
    <nav class="side-navbar">
        <div class="nav-header">
            <i class="fas fa-university"></i>
            <h2>Course Management</h2>
        </div>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-home"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-book"></i>
                    <span>Courses</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-users"></i>
                    <span>Students</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <span>Instructors</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <div class="form-container">
            <h2 style="text-align: center; color: var(--secondary-color); margin-bottom: 20px;">Add New Course</h2>
            <form:form modelAttribute="course" method="post" action="insertcourse">
                <div class="form-grid">
                    <div class="form-group">
                        <label>Course Name</label>
                        <form:input path="courseName" required="required" />
                    </div>
                    <div class="form-group">
                        <label>Duration (Months)</label>
                        <form:input path="duration" required="required" type="number" min="1" max="48"/>
                    </div>
                    <div class="form-group">
                        <label>Start Date</label>
                        <form:input path="startDate" required="required" type="date"/>
                    </div>
                    <div class="form-group">
                        <label>End Date</label>
                        <form:input path="endDate" required="required" type="date"/>
                    </div>
                    <div class="form-group">
                        <label>Instructor</label>
                        <form:input path="instructor" required="required"/>
                    </div>
                    <div class="form-group">
                        <label>Credits</label>
                        <form:input path="credits" required="required" type="number" min="1" max="10"/>
                    </div>
                </div>
                <div class="button-container">
                    <input type="submit" value="Add Course" class="btn btn-primary"/>
                    <input type="reset" value="Clear" class="btn btn-secondary"/>
                </div>
            </form:form>
        </div>
    </main>

    <script>
        // Optional JavaScript for side navbar toggle
        document.addEventListener('DOMContentLoaded', () => {
            const sideNavbar = document.querySelector('.side-navbar');
            const mainContent = document.querySelector('.main-content');
            
            // Toggle side navbar (you can add a button in the header to trigger this)
            function toggleNavbar() {
                sideNavbar.classList.toggle('side-navbar-mini');
                mainContent.classList.toggle('main-content-full');
            }
        });
    </script>
</body>
</html>