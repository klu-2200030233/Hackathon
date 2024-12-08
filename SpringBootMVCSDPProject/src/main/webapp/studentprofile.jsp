<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
if(student == null)
{
    response.sendRedirect("studentsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e3f2fd; /* Light blue background */
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        /* Violet color navbar styling */
        .navbar {
            background-color: #4a148c; /* Dark Violet */
            overflow: hidden;
            padding: 10px 0;
            text-align: center;
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 16px;
        }

        .navbar a:hover {
            background-color: #6a1b9a; /* Lighter Violet */
        }

        h3 {
            color: #4a148c; /* Dark Violet for heading */
            margin-bottom: 20px;
        }

        .profile-container {
            background-color: white;
            padding: 20px;
            margin: 0 auto;
            max-width: 500px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
        }

        .profile-container b {
            color: #4a148c; /* Dark Violet for labels */
        }

        .profile-container p {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
        }

        /* Avatar styling */
        .avatar {
            width: 120px; /* Adjusted width */
            height: 120px; /* Adjusted height */
            border-radius: 50%; /* Circular avatar */
            object-fit: cover; /* Ensures the image fits well */
            margin-bottom: 20px; /* Added margin below the avatar */
        }
    </style>
</head>
<body>

    <%@include file="studentnavbar.jsp" %> <!-- Include student navbar -->

    <h3><u>My Profile</u></h3>
    
    <div class="profile-container">
        <!-- Static Avatar Image for All Students -->
        <img class="avatar" src="images/avatar.png" alt="Student Avatar"> <!-- Static avatar image -->
    
        <p><b>ID:</b> <%=student.getId()%></p>
        <p><b>NAME:</b> <%=student.getName()%></p>
        <p><b>GENDER:</b> <%=student.getGender()%></p>
        <p><b>DATE OF BIRTH:</b> <%=student.getDateofbirth()%></p>
        <p><b>DEPARTMENT:</b> <%=student.getDepartment()%></p>
        <p><b>LOCATION:</b> <%=student.getLocation()%></p>
        <p><b>EMAIL:</b> <%=student.getEmail()%></p>
        <p><b>CONTACT:</b> <%=student.getContact()%></p>
        <p><b>STATUS:</b> <%=student.getStatus()%></p>
    </div>

</body>
</html>