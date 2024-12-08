<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee Status</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #00796b; /* New primary color */
            --secondary-color: #004d40; /* New secondary color */
            --background-light: #e0f7fa; /* Lighter background */
            --white: #ffffff;
            --text-color: #212121; /* Darker text color for better contrast */
            --border-color: #b2dfdb; /* Soft border color */
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
        }

        /* Side Navigation Styles */
        .side-navbar {
            width: 280px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            transition: width var(--transition-speed) ease;
            overflow-x: hidden;
            z-index: 1000;
            box-shadow: 5px 0 15px rgba(0,0,0,0.1);
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

        .nav-link:hover {
            background-color: rgba(255,255,255,0.1);
        }

        /* Main Content Area */
        .main-content {
            flex-grow: 1;
            margin-left: 280px;
            padding: 30px;
            width: calc(100% - 280px);
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .page-header {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }

        .page-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background-color: var(--primary-color);
        }

        .employee-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: var(--white);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .employee-table thead {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .employee-table th,
        .employee-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            transition: background-color var(--transition-speed);
        }

        .employee-table th {
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 1px;
            font-size: 0.9em;
        }

        .employee-table tr:hover {
            background-color: rgba(0, 121, 107, 0.1);
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .action-btn {
            display: inline-block;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all var(--transition-speed);
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .btn-accept {
            background-color: #43a047; /* Green for accept */
            color: var(--white);
        }

        .btn-reject {
            background-color: #d32f2f; /* Red for reject */
            color: var(--white);
        }

        .btn-accept:hover {
            background-color: #388e3c;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(67, 160, 71, 0.3);
        }

        .btn-reject:hover {
            background-color: #c62828;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(211, 47, 47, 0.3);
        }

        /* Responsive Design */
        @media screen and (max-width: 1024px) {
            .side-navbar {
                width: 250px;
            }

            .main-content {
                margin-left: 250px;
                width: calc(100% - 250px);
            }

            .employee-table {
                font-size: 0.9em;
            }
        }

        @media screen and (max-width: 768px) {
            .side-navbar {
                width: 0;
                position: absolute;
            }

            .main-content {
                margin-left: 0;
                width: 100%;
                padding: 15px;
            }

            .employee-table {
                border-radius: 0;
            }

            .employee-table thead {
                display: none;
            }

            .employee-table tr {
                display: block;
                margin-bottom: 20px;
                border: 1px solid var(--border-color);
                border-radius: 10px;
            }

            .employee-table td {
                display: block;
                text-align: right;
                border-bottom: 1px solid var(--border-color);
            }

            .employee-table td::before {
                content: attr(data-label);
                float: left;
                font-weight: bold;
                text-transform: uppercase;
            }

            .action-buttons {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Side Navigation -->
    <nav class="side-navbar">
        <div class="nav-header">
            <i class="fas fa-university"></i>
            <h2>Employee Management</h2>
        </div>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="<c:url value='/adminhome' />" class="nav-link">
                    <i class="fas fa-home"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/viewallemps' />" class="nav-link">
                    <i class="fas fa-users"></i>
                    <span>Employees</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/empreg' />" class="nav-link">
                    <i class="fas fa-user-plus"></i>
                    <span>Add Employee</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-user-check"></i>
                    <span>Employee Status</span>
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

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container">
            <h3 class="page-header">Update Employee Status</h3>

            <table class="employee-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Date of Birth</th>
                        <th>Department</th>
                        <th>Salary</th>
                        <th>Location</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-label="ID">1</td>
                        <td data-label="Name">John Doe</td>
                        <td data-label="Gender">Male</td>
                        <td data-label="DOB">1990-04-15</td>
                        <td data-label="Department">IT</td>
                        <td data-label="Salary">$5000</td>
                        <td data-label="Location">New York</td>
                        <td class="action-buttons" data-label="Action">
                            <a href="#" class="action-btn btn-accept">
                                <i class="fas fa-check"></i> Accept
                            </a>
                            <a href="#" class="action-btn btn-reject">
                                <i class="fas fa-times"></i> Reject
                            </a>
                        </td>
                    </tr>
                    <!-- More rows can be added similarly -->
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
