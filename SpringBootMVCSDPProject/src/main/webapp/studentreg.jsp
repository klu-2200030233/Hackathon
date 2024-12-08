<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <style>
        /* Global Styles */
       body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    background-image: url('images/lms6.jpg'); /* Replace with your image URL */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-attachment: fixed; /* Keeps the background fixed during scrolling */
    margin: 0;
    padding: 20px;
}

        h3 {
            text-align: center;
            color: #4a148c;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .navbar {
            background-color: #4a148c;
            overflow: hidden;
            padding: 10px 20px;
            display: flex;
            justify-content: center;
        }

        .navbar a {
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #6a1b9a;
        }

        /* Form Container */
        .form-container {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 20px 50px; /* Increased padding */
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 900px; /* Increased width */
            margin: 30px auto;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-10px);
        }

        /* Input Styles */
        input[type="text"],
        input[type="date"],
        input[type="number"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px 16px; /* Adjusted padding for larger inputs */
            border: 2px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            margin: 10px 0 15px;
            font-size: 16px;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            border-color: #4a148c;
            background-color: #f3e6f8;
            outline: none;
        }

        /* Label Styling */
        label {
            font-size: 15px;
            color: #333;
            margin-bottom: 6px;
            display: block;
        }

        /* Radio Buttons and Select Options */
        .gender-options {
            display: flex;
            gap: 15px; /* Increased spacing */
            align-items: center;
        }

        .gender-options input {
            margin-right: 5px;
        }

        .gender-options label {
            font-size: 15px;
            color: #333;
        }

        select {
            padding: 12px 16px;
            font-size: 16px;
            border: 2px solid #ddd;
            background-color: #fff;
        }

        /* Button Styling */
        input[type="submit"],
        input[type="reset"] {
            background-color: #4a148c;
            color: white;
            border: none;
            padding: 14px 20px; /* Increased padding */
            font-size: 17px; /* Larger font size */
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            width: 48%;
            margin-top: 10px;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #6a1b9a;
            transform: scale(1.05);
        }

        input[type="submit"]:active,
        input[type="reset"]:active {
            background-color: #7b3fb2;
            transform: scale(1);
        }

        /* Center Button Container */
        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .form-container {
                max-width: 700px; /* Adjust width for medium screens */
                padding: 20px 40px;
            }
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }

            .button-container {
                flex-direction: column;
                gap: 10px;
            }

            input[type="submit"],
            input[type="reset"] {
                width: 100%;
            }
        }

        /* Map Container */
        #map {
            height: 300px;
            width: 100%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <h3>Student Registration</h3>
    <div class="form-container">
        <form method="post" action="insertstudent" onsubmit="return validateForm()">
            <div>
                <label for="sname">Enter Name</label>
                <input type="text" id="sname" name="sname" required />
            </div>
            <div>
                <label>Select Gender</label>
                <div class="gender-options">
                    <input type="radio" id="male" name="sgender" value="MALE" required />
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="sgender" value="FEMALE" required />
                    <label for="female">Female</label>
                    <input type="radio" id="others" name="sgender" value="OTHERS" required />
                    <label for="others">Others</label>
                </div>
            </div>
            <div>
                <label for="sdob">Enter Date of Birth</label>
                <input type="date" id="sdob" name="sdob" required />
            </div>
            <div>
                <label for="sdept">Select Department</label>
                <select id="sdept" name="sdept" required>
                    <option value="">---Select---</option>
                    <option value="SCIENCE">Science</option>
                    <option value="ARTS">Arts</option>
                    <option value="COMMERCE">Commerce</option>
                </select>
            </div>
           
            <div>
                <label for="slocation">Enter Location</label>
                <input type="text" id="slocation" name="slocation" required />
                <div id="map"></div>
            </div>
            <div>
                <label for="semail">Enter Email ID</label>
                <input type="email" id="semail" name="semail" required />
            </div>
            <div>
                <label for="spwd">Enter Password</label>
                <input type="password" id="spwd" name="spwd" required />
            </div>
            <div>
                <label for="scontact">Enter Contact</label>
                <input type="number" id="scontact" name="scontact" required />
            </div>
            <div class="button-container">
                <input type="submit" value="Register" />
                <input type="reset" value="Clear" />
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            // Email validation
            const email = document.getElementById("semail").value;
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Password validation
            const password = document.getElementById("spwd").value;
            const passwordRegex =
                /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordRegex.test(password)) {
                alert(
                    "Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, one number, and one special character."
                );
                return false;
            }

            // Contact validation
            const contact = document.getElementById("scontact").value;
            const contactRegex = /^[0-9]{10}$/;
            if (!contactRegex.test(contact)) {
                alert("Please enter a valid 10-digit phone number.");
                return false;
            }

            return true; // If all validations pass
        } 

        // Initialize OpenStreetMap using Leaflet
        function initMap() {
            const map = L.map('map').setView([19.0760, 72.8777], 12); // Default location (Mumbai)

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            const locationInput = document.getElementById("slocation");

            // Allow user to click on the map to place a marker and update location
            map.on('click', function (e) {
                const latlng = e.latlng;
                L.marker(latlng).addTo(map);
                locationInput.value = `Lat: ${latlng.lat.toFixed(5)}, Lng: ${latlng.lng.toFixed(5)}`;
            });
        }

        window.onload = initMap; // Initialize map when the page loads
    </script>

    <!-- Leaflet JS & CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
</body>
</html>
