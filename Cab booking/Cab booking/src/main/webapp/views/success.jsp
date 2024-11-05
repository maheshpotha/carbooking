<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@page isELIgnored="false" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Success Page</title>
                <!-- Add Bootstrap CSS link -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                    crossorigin="anonymous">
                <style>
                    .card {
                        border: 2px solid #343a40;
                        /* Dark border color */
                        background-color: #f8f9fa;
                        /* Light background color */
                        margin-bottom: 20px;
                    }

                    .bg-clr {
                        background-color: #f1faee;
                    }
                </style>
                <link rel="stylesheet" type="text/css" href="style.css">
            </head>

            <body>

                <nav class="navbar navbar-expand-lg navbar-light bg-clr">
                    <div class="container">
                        <a class="navbar-brand fs-1 fw-medium" href="#">Cab Booking Service</a>
                        <div>
                            <div>
                                <ul class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="login">Login</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="signup">Register</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                </nav>

                <div class="container mt-5">
                    <h2 class="mb-4 text-center font-weight-bold">You have been registered successfully. <br> Continue
                        to login.</h2>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                    crossorigin="anonymous"></script>
            </body>

            </html>