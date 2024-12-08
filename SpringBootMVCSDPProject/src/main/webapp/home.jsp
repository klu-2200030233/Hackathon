<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
          body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    background-image: url('images/book-table.jpg'); /* Replace with your image URL */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-attachment: fixed; /* Keeps the background fixed during scrolling */
    margin: 0;
    padding: 20px;
}

        h3 {
            text-align: center;
            color: #4a148c; /* Dark Violet */
        }

        .navbar {
            display: flex; /* Flexbox for horizontal layout */
            justify-content: center; /* Center the navbar */
            background-color: #4a148c; /* Dark Violet */
            padding: 10px 0; /* Vertical padding */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        .navbar a {
            text-decoration: none; /* No underline */
            color: white; /* White text color */
            padding: 10px 20px; /* Padding around links */
            border-radius: 4px; /* Rounded corners for links */
            transition: background-color 0.3s, color 0.3s; /* Transition effects */
        }

        .navbar a:hover {
            background-color: #6a1b9a; /* Lighter Violet on hover */
        }
    </style>
</head>
<body>
    <%@ include file="mainnavbar.jsp" %>
    <h3>Home Page</h3>
</body>
</html>
