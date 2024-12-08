<%@page import="com.klef.jfsd.springboot.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Employee emp = (Employee) session.getAttribute("employee");
if(emp==null)
{
    response.sendRedirect("empsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Home</title>
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
            background-color: #4a148c; 
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
            background-color: green;
        }

        h3 {
            color: #4a148c;
            margin-bottom: 20px;
        }

        /* Profile container */
        .profile-container {
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px;
            margin: 0 auto;
            max-width: 500px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Center the content */
        }

        /* Avatar styling */
        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .profile-container b {
            color: #4a148c;
        }

        .profile-container p {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>

    <%@include file="empnavbar.jsp" %> <!-- Include employee navbar -->

    <h3><u>My Profile</u></h3>

    <div class="profile-container">
        <!-- Static Avatar Image for All Employees -->
        <img class="avatar" src="images/avatar.png" alt="Employee Avatar"> <!-- Static avatar image -->

        <p><b>ID:</b> <%=emp.getId()%></p>
        <p><b>NAME:</b> <%=emp.getName()%></p>
        <p><b>GENDER:</b> <%=emp.getGender()%></p>
        <p><b>DATE OF BIRTH:</b> <%=emp.getDateofbirth()%></p>
        <p><b>DEPARTMENT:</b> <%=emp.getDepartment()%></p>
        <p><b>SALARY:</b> <%=emp.getSalary()%></p>
        <p><b>LOCATION:</b> <%=emp.getLocation()%></p>
        <p><b>EMAIL:</b> <%=emp.getEmail()%></p>
        <p><b>CONTACT:</b> <%=emp.getContact()%></p>
        <p><b>STATUS:</b> <%=emp.getStatus()%></p>
    </div>

</body>
</html>