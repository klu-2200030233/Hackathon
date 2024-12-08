<!DOCTYPE html>
<html>
<head>
    <title>Spring Boot</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Basic styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            flex-direction: column;
            background-color: #f4f4f9; /* Light background color */
        }

        /* Title styling */
        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333; /* Dark color for the title */
        }

        /* Sidebar styles */
        .sidebar {
            height: 100%;
            width: 220px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50; /* Dark blue color for sidebar */
            padding-top: 20px;
        }

        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: flex;
            align-items: center;
        }

        .sidebar a:hover {
            background-color: #34495e; /* Lighter shade of blue on hover */
        }

        /* Icons styling */
        .sidebar a i {
            margin-right: 10px; /* Space between icon and text */
        }

        /* Content area */
        .content {
            margin-left: 220px;
            padding: 20px;
            width: 100%;
        }

        /* Customize link icon colors */
        .sidebar a i {
            font-size: 20px;
            color: white;
        }

        .sidebar a:hover i {
            color: #f4f4f9; /* Change icon color on hover */
        }
    </style>
</head>
<body>
    <h2>Spring Boot MVC SDP Project</h2>
    
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="/"><i class="fas fa-home"></i>Home</a>
        <a href="empreg"><i class="fas fa-user-plus"></i>Employee Registration</a>
        <a href="studentreg"><i class="fas fa-user-graduate"></i>Student Registration</a>
        <a href="emplogin"><i class="fas fa-sign-in-alt"></i>Employee Login</a>
        <a href="adminlogin"><i class="fas fa-cogs"></i>Admin Login</a>
        <a href="studentlogin"><i class="fas fa-sign-in-alt"></i>Student Login</a>
    </div>

    <div class="content">
        <!-- Content goes here -->
    </div>
</body>
</html>
