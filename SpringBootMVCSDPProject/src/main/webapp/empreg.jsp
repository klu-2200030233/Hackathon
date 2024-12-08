<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <style>
         body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    background-image: url('images/lms4.jpg'); /* Replace with your image URL */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-attachment: fixed; /* Keeps the background fixed during scrolling */
    margin: 0;
    padding: 20px;
}

        h3 {
            text-align: center;
            color: #00796b; /* Muted Dark Blue */
            margin-bottom: 30px;
        }

        .navbar {
            background-color:#00796b;
            overflow: hidden;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
        }

        .navbar a {
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 16px;
        }

        .navbar a:hover {
            background-color: #00796b; /* Soft Green */
        }

        .form-container {
            background-color: #ffffff; /* White */
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 550px;
            margin: 30px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        td {
            padding: 12px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333; /* Dark Gray */
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc; /* Light Gray */
            border-radius: 6px;
            margin-bottom: 20px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #3e8e41; /* Muted Dark Blue */
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #5ea95f; /* Soft Green */
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        /* Gender options styling */
        .gender-options {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .gender-options input {
            margin-right: 5px;
        }

        .gender-options label {
            color: #333;
        }

        /* Validation Error Styling */
        .error {
            border-color: #d32f2f; /* Red border */
            background-color: #ffebee; /* Light red background */
        }

        .error-message {
            color: #d32f2f;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        /* Success message for valid fields */
        .success {
            border-color: #388e3c; /* Green border */
            background-color: #e8f5e9; /* Light green background */
        }

    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <h3>Employee Registration</h3>
    <div class="form-container">
        <form method="post" action="insertemp" onsubmit="return validateForm()">
            <table>
                <tr>
                    <td><label for="ename">Enter Name</label></td>
                    <td><input type="text" id="ename" name="ename" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <div class="gender-options">
                            <input type="radio" id="male" name="egender" value="MALE" required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="egender" value="FEMALE" required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="egender" value="OTHERS" required/>
                            <label for="others">Others</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="edob">Enter Date of Birth</label></td>
                    <td><input type="date" id="edob" name="edob" required/></td>
                </tr>
                <tr>
                    <td><label for="edept">Select Department</label></td>
                    <td>
                        <select id="edept" name="edept" required>
                            <option value="">---Select---</option>
                            <option value="TECHNICAL">Technical</option>
                            <option value="MARKETING">Marketing</option>
                            <option value="SALES">Sales</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="esalary">Enter Salary</label></td>
                    <td><input type="number" id="esalary" name="esalary" step="0.01" required/></td>
                </tr>
                <tr>
                    <td><label for="elocation">Enter Location</label></td>
                    <td><input type="text" id="elocation" name="elocation" required/></td>
                </tr>
                <tr>
                    <td><label for="eemail">Enter Email ID</label></td>
                    <td><input type="email" id="eemail" name="eemail" required/></td>
                </tr>
                <tr>
                    <td><label for="epwd">Enter Password</label></td>
                    <td><input type="password" id="epwd" name="epwd" required/></td>
                </tr>
                <tr>
                    <td><label for="econtact">Enter Contact</label></td>
                    <td><input type="number" id="econtact" name="econtact" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script>
    function validateForm() {
        // Email validation
        const email = document.getElementById("eemail");
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        const emailError = document.createElement("div");
        emailError.classList.add("error-message");
        if (!emailPattern.test(email.value)) {
            email.classList.add("error");
            emailError.textContent = "Please enter a valid email address.";
            email.insertAdjacentElement("afterend", emailError);
            return false;
        } else {
            email.classList.remove("error");
            email.classList.add("success");
        }

        // Phone number validation (must start with 6, 7, 8, or 9)
        const phone = document.getElementById("econtact");
        const phonePattern = /^[6789][0-9]{9}$/; // Starts with 6, 7, 8, or 9 and followed by 9 digits
        const phoneError = document.createElement("div");
        phoneError.classList.add("error-message");
        if (!phonePattern.test(phone.value)) {
            phone.classList.add("error");
            phoneError.textContent = "Phone number must start with 6, 7, 8, or 9 and be 10 digits long.";
            phone.insertAdjacentElement("afterend", phoneError);
            return false;
        } else {
            phone.classList.remove("error");
            phone.classList.add("success");
        }

        // Password validation (must be at least 6 characters and include special characters)
        const password = document.getElementById("epwd");
        const passwordError = document.createElement("div");
        passwordError.classList.add("error-message");
        const specialCharacterPattern = /[!@#$%^&*(),.?":{}|<>]/; // Check for special characters
        if (password.value.length < 6 || !specialCharacterPattern.test(password.value)) {
            password.classList.add("error");
            passwordError.textContent = "Password must be at least 6 characters long and contain at least one special character.";
            password.insertAdjacentElement("afterend", passwordError);
            return false;
        } else {
            password.classList.remove("error");
            password.classList.add("success");
        }

        return true;
    }
</script>

</body>
</html>
