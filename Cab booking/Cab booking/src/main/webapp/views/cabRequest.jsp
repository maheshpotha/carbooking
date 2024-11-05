<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page isELIgnored="false" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Cab Requests</title>
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

                    .status-pending {
                        background-color: #ffc107;
                        /* Bootstrap warning color */
                        color: #212529;
                        padding: 5px;
                        border-radius: 5px;
                    }

                    .status-accepted {
                        background-color: #28a745;
                        /* Bootstrap success color */
                        color: white;
                        padding: 5px;
                        border-radius: 5px;
                    }

                    .status-declined {
                        background-color: #dc3545;
                        /* Bootstrap danger color */
                        color: white;
                        padding: 5px;
                        border-radius: 5px;
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
                                <li class="nav-item">
                                    <a class="nav-link" href="customer">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="home">Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container mt-5">
                    <h2 class="mb-4 text-center font-weight-bold">Welcome, ${userFirstName} ${userLastName}</h2>

                    <h2 class="mb-4 text-center font-weight-bold">Cab Requests</h2>

                    <!-- Loop through the list of cab requests and display each one -->
                    <c:forEach var="cab" items="${cabRequests}">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Cab Details</h5>
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <p class="card-text">
                                            <strong>Source:</strong> ${cab.source}<br>
                                            <strong>Destination:</strong> ${cab.destination}<br>
                                            <strong>Vehicle:</strong> ${cab.vehicle}<br>
                                            <strong>Fare:</strong> ${cab.fareAmount}
                                        </p>
                                    </div>
                                    <div class="status">
                                        <strong>Status:</strong>
                                        <c:choose>
                                            <c:when test="${cab.status == 'Pending'}">
                                                <span class="status-pending">Pending</span>
                                            </c:when>
                                            <c:when test="${cab.status == 'Accepted'}">
                                                <span class="status-accepted">Accepted</span>
                                            </c:when>
                                            <c:when test="${cab.status == 'Declined'}">
                                                <span class="status-declined">Declined</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>${cab.status}</span> <!-- Fallback for unexpected statuses -->
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>