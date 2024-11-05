<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Cab Booking Application</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="style1.css">
        <link rel="stylesheet" type="text/css" href="signup.css">
        <style>
            p {
                font-size: 12px;
                margin: 0;
            }

            .bg-clr {
                background-color: #f1faee;
            }
        </style>
    </head>

    <body>


        <nav class="navbar navbar-expand-lg navbar-light bg-clr">
            <div class="container">
                <a class="navbar-brand fs-1 fw-medium " href="home">Cab Booking Service</a>
                <div>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="login">Login</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="signup">Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="signup-container">
            <h2>Register</h2>
            <form id="registrationForm" action="registerForm" method="post">
                <input type="text" id="firstname" name="firstname" placeholder="First Name" required>
                <input type="text" id="lastname" name="lastname" placeholder="Last Name" required>
                <input type="tel" id="mobile" name="mobile" placeholder="Mobile Number" required>
                <input type="email" id="email" name="email" placeholder="Email" required>
                <input type="password" id="password" name="password" placeholder="Password" required>
                <input type="password" id="repassword" name="repassword" placeholder="Re-enter Password" required>
                <button type="submit">Register</button>
                <p id="error-message" class="error">
                    <%= request.getAttribute("errorMessage") !=null ? request.getAttribute("errorMessage") : "" %>
                </p>
            </form>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('registrationForm').addEventListener('submit', function (event) {
                    event.preventDefault();
                    var firstname = document.getElementById('firstname').value;
                    var lastname = document.getElementById('lastname').value;
                    var mobile = document.getElementById('mobile').value;
                    var email = document.getElementById('email').value;
                    var password = document.getElementById('password').value;
                    var repassword = document.getElementById('repassword').value;
                    var errorMessage = document.getElementById('error-message');


                    if (!firstname || !lastname) {
                        errorMessage.textContent = 'Please enter your full name.';
                        return;
                    }

                    if (!validateMobile(mobile)) {
                        errorMessage.textContent = 'Please enter a valid mobile number.';
                        return;
                    }

                    if (!validateEmail(email)) {
                        errorMessage.textContent = 'Please enter a valid email address.';
                        return;
                    }

                    if (password.length < 6) {
                        errorMessage.textContent = 'Password must be at least 6 characters long.';
                        return;
                    }

                    if (password !== repassword) {
                        errorMessage.textContent = 'Passwords do not match.';
                        return;
                    }

                    errorMessage.textContent = 'Registration successful!';
                    // Handle successful registration here
                    this.submit();
                });
            });
            function validateMobile(mobile) {
                var re = /^[0-9]{10}$/;
                return re.test(mobile);
            }

            function validateEmail(email) {
                var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return re.test(email);
            }
        </script>

    </body>

    </html>