<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page isELIgnored="false" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Success Page</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <style>
                    .card {
                        border: 2px solid #343a40;
                        background-color: #f8f9fa;
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
                            <ul class="navbar-nav ms-auto">
                                <!-- <li class="nav-item">
                    <a class="nav-link" href="admin">Home</a>
                </li> -->
                                <li class="nav-item">
                                    <a class="nav-link" href="home">Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container mt-5">
                    <h2 class="mb-4 text-center font-weight-bold">Customer Cab requests</h2>

                    <c:forEach var="cab" items="${cabRequests}">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <h5 class="card-title">Cab Details</h5>
                                <p class="card-text">
                                    <strong>Name:</strong> ${cab.user.firstname} ${cab.user.lastname}<br>
                                    <strong>Source:</strong> ${cab.source}<br>
                                    <strong>Destination:</strong> ${cab.destination}<br>
                                    <strong>Vehicle:</strong> ${cab.vehicle}<br>
                                    <strong>Fare:</strong> ${cab.fareAmount}<br>
                                </p>
                                <div>
                                    <!-- Show the buttons only if the status is neither Accepted nor Declined -->
                                    <c:if test="${cab.status != 'Accepted' && cab.status != 'Declined'}">
                                        <form action="acceptRide" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${cab.id}">
                                            <button type="submit" class="btn btn-success">Accept Ride</button>
                                        </form>
                                        <form action="declineRide" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${cab.id}">
                                            <button type="submit" class="btn btn-danger">Decline Ride</button>
                                        </form>
                                    </c:if>

                                    <!-- Display the status as a disabled button if the ride is accepted or declined -->
                                    <c:if test="${cab.status == 'Accepted'}">
                                        <button type="button" class="btn btn-success" disabled>Ride Accepted</button>
                                    </c:if>

                                    <c:if test="${cab.status == 'Declined'}">
                                        <button type="button" class="btn btn-danger" disabled>Ride Declined</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>