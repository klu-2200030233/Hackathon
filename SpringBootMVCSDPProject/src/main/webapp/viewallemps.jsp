<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Employees</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    background-image: url('images/lms3.jpg'); /* Replace with your image URL */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-attachment: fixed; /* Keeps the background fixed during scrolling */
    margin: 0;
    padding: 20px;
}

        /* Side Navigation */
        .side-navbar {
            width: 280px;
            background: linear-gradient(135deg, #1976d2, #42a5f5); /* Blue gradient */
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            transition: width 0.3s ease;
            overflow-x: hidden;
            z-index: 1000;
            box-shadow: 5px 0 15px rgba(0, 0, 0, 0.1);
        }

        .nav-header {
            display: flex;
            align-items: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.1);
            color: white;
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
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            transition: background-color 0.3s ease;
        }

        .nav-link i {
            margin-right: 15px;
            font-size: 20px;
            min-width: 30px;
            text-align: center;
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        /* Main Content Area */
        .main-content {
            flex-grow: 1;
            margin-left: 280px;
            padding: 30px;
            width: calc(100% - 280px);
        }

        h3 {
            color: #1976d2; /* Dark Blue */
            margin-bottom: 20px;
        }

        /* Improved Table Styles */
        table {
            width: 100%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        th {
            background-color: #1976d2; /* Dark Blue */
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Light gray for even rows */
        }

        tr:hover {
            background-color: #e3f2fd; /* Light blue on hover */
        }

        td {
            color: #555;
        }

        .action-btn {
            padding: 8px 15px;
            background-color: #66bb6a; /* Green for Delete */
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
        }

        .action-btn:hover {
            background-color: #388e3c; /* Darker Green */
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(56, 142, 60, 0.3);
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

            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
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
        Total Employees = <c:out value="${empcount}"></c:out>
        <h3 align="center">View All Employees</h3>

        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>GENDER</th>
                <th>DATE OF BIRTH</th>
                <th>DEPARTMENT</th>
                <th>SALARY</th>
                <th>LOCATION</th>
                <th>EMAIL</th>
                <th>CONTACT</th>
                <th>STATUS</th>
                <th>DELETE</th>
            </tr>
            <c:forEach items="${emplist}" var="emp">
                <tr>
                    <td><c:out value="${emp.id}"/></td>
                    <td><c:out value="${emp.name}"/></td>
                    <td><c:out value="${emp.gender}"/></td>
                    <td><c:out value="${emp.dateofbirth}"/></td>
                    <td><c:out value="${emp.department}"/></td>
                    <td><c:out value="${emp.salary}"/></td>
                    <td><c:out value="${emp.location}"/></td>
                    <td><c:out value="${emp.email}"/></td>
                    <td><c:out value="${emp.contact}"/></td>
                    <td><c:out value="${emp.status}"/></td>
                    <td>
                        <a href='<c:url value="/deleteEmployee?id=${emp.id}"></c:url>' class="action-btn">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </main>

</body>
</html>
