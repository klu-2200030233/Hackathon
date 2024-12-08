<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Expired</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e3f2fd; /* Light blue background */
            margin: 0;
            padding: 20px;
            text-align: center; /* Center align text */
        }

        h2 {
            color: #4a148c; /* Dark Violet color for heading */
            margin-bottom: 20px; /* Space below heading */
        }

        .message {
            font-size: 18px; /* Larger font for message */
            color: #388e3c; /* Green color for success message */
            margin: 20px 0; /* Space above and below message */
        }

        a {
            text-decoration: none; /* Remove underline from links */
            color: #4a148c; /* Dark Violet link color */
            padding: 10px 20px; /* Padding around link */
            border: 2px solid #4a148c; /* Dark Violet border around link */
            border-radius: 5px; /* Rounded corners for link */
            transition: background-color 0.3s, color 0.3s; /* Smooth transitions */
        }

        a:hover {
            background-color: #6a1b9a; /* Lighter Violet background on hover */
            color: white; /* Change text color to white on hover */
        }
    </style>
</head>
<body>
  oops.... session expired
    <br></br>
    <a href="emplogin">Login Again</a>
</body>
</html>
