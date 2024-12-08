<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        h1 {
            color: #d32f2f; /* Red for error message */
        }

        p {
            color: #333; /* Dark Gray */
            font-size: 18px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #4a148c; /* Dark Violet */
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #6a1b9a; /* Lighter Violet */
        }
    </style>
</head>
<body>
    <p><c:out value="${message}"></c:out></p>
    <a href="adminlogin">Try Again</a>
</body>
</html>
