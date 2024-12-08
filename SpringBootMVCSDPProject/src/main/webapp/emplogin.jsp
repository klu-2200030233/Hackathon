<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Login</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    background-image: url('images/lms7.jpg'); /* Replace with your image URL */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-attachment: fixed; /* Keeps the background fixed during scrolling */
    margin: 0;
    padding: 20px;
}

        h3 {
            text-align: center;
            color: #4a148c; /* Dark Violet */
            text-decoration: underline;
        }

        h4 {
            text-align: center;
            color: red; /* Red color for error message */
        }

        .navbar {
            display: flex;
            justify-content: center; /* Centering the nav items */
            background-color: #4a148c; /* Dark Violet */
            padding: 10px 0;
            border-radius: 5px;
            margin-bottom: 20px; /* Space below navbar */
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            margin: 0 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .navbar a:hover {
            background-color: #6a1b9a; /* Lighter Violet for hover effect */
        }

        .form-container {
            max-width: 400px; /* Limiting the form width */
            margin: 0 auto; /* Centering the form */
            background-color: #ffffff; /* White background for the form */
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        table {
            width: 100%; /* Full width */
        }

        label {
            display: block; /* Block display for labels */
            margin-bottom: 5px; /* Space below labels */
        }

        input[type="email"],
        input[type="password"] {
            width: 100%; /* Full width for input fields */
            padding: 10px; /* Padding inside input fields */
            margin-bottom: 15px; /* Space below input fields */
            border: 1px solid #ccc; /* Border for input fields */
            border-radius: 4px; /* Rounded corners */
        }

        .button-container {
            display: flex; /* Flexbox for buttons */
            justify-content: space-between; /* Space between buttons */
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #4a148c; /* Dark Violet */
            color: white; /* White text color */
            border: none; /* No border */
            padding: 10px 20px; /* Padding inside buttons */
            border-radius: 4px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Transition for hover effect */
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #6a1b9a; /* Lighter Violet on hover */
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <h3>Employee Login</h3>
    <h4>
        <c:out value="${message}"></c:out>
    </h4>
    <div class="form-container">
        <form method="post" action="checkemplogin">
            <table>
                <tr>
                    <td><label for="eemail">Enter Email ID</label></td>
                    <td><input type="email" id="eemail" name="eemail" required/></td>
                </tr>
                <tr>
                    <td><label for="epwd">Enter Password</label></td>
                    <td><input type="password" id="epwd" name="epwd" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
