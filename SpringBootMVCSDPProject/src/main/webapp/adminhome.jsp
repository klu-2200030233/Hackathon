<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
    <style>
        /* CSS Reset and Variables */
        :root {
            --primary-color: #4a148c;
            --secondary-color: #6a1b9a;
            --background-color: #f0f4f8;
            --text-color: #2c3e50;
            --white: #ffffff;
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body and Global Styles */
       body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    background-image: url('images/emplogin.jpg'); /* Replace with your image URL */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-attachment: fixed; /* Keeps the background fixed during scrolling */
    margin: 0;
    padding: 20px;
}
        /* Navigation Styles */
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .navbar a {
            color: var(--white);
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 15px;
            border-radius: 5px;
            transition: 
                background-color var(--transition-speed), 
                transform var(--transition-speed);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: scale(1.05);
        }

        /* Container and Content Styles */
        .container {
            max-width: 1200px;
            width: 90%;
            margin: 50px auto;
            padding: 30px;
            background-color: transparent(--white);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Dashboard Heading Styles */
        .dashboard-heading {
            color: white(--primary-color);
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }

        .dashboard-heading::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background-color: var(--primary-color);
        }

        /* Employee Stats Styles */
        .employee-stats {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            background-color: rgba(106, 27, 154, 0.05);
            padding: 20px;
            border-radius: 10px;
        }

        .employee-count {
            font-size: 24px;
            color: var(--primary-color);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .employee-count i {
            font-size: 32px;
            margin-right: 10px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 10px;
            }

            .navbar a {
                margin: 5px 0;
                width: 100%;
                text-align: center;
                justify-content: center;
            }

            .container {
                margin: 20px 10px;
                padding: 20px;
                width: calc(100% - 20px);
            }

            .employee-count {
                flex-direction: column;
                text-align: center;
            }
        }

        /* Background Pattern */
     body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url('images/lmsp.jpg'); /* Replace with your image file name */
    background-size: cover; /* Ensures the image covers the viewport */
    background-position: center; /* Centers the image */
    background-repeat: no-repeat; /* Avoids tiling */
    z-index: -1;
    pointer-events: none;
}
     
      
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    
    <div class="container">
        <h3 class="dashboard-heading">Welcome to the Admin Dashboard</h3>
        
        <div class="employee-stats">
            <div class="employee-count">
                <i class="fas fa-users"></i>
                Total Employees: <c:out value="${empcount}"/>
            </div>
        </div>
    </div>
</body>
</html>