<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Booking Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="style1.css">
    <link rel="stylesheet" type="text/css" href="customer.css">
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
            <a class="navbar-brand fs-1 fw-medium " href="#">Cab Booking Service</a>
            <div>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="customer">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cabRequest">My bookings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="home">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="customer-container">
        <h2>Select Areas</h2>
        <form id="cabRequest" action="cabRequest" method="post">
            <label for="source" class="text-color">source:</label>
            <select id="source" name="source" required>
                <option value="">Select area</option>
                <option value="Miyapur">Miyapur</option>
                <option value="JBS">JBS</option>
                <option value="Nagole">Nagole</option>
                <option value="Secunderabad">Secunderabad</option>
                <option value="Kukatpally">Kukatpally</option>

            </select>
            <label for="destination" class="text-color">destination:</label>
            <select id="destination" name="destination" required>
                <option value="">Select area</option>
                <option value="HITEC City">HITEC City</option>
                <option value="Ameerpet">Ameerpet</option>
                <option value="Paradise">Paradise</option>
                <option value="Begumpet">Begumpet</option>
                <option value="LB Nagar">LB Nagar</option>
            </select>
            <label for="vehicle" class="text-color">Vehicle type:</label>
            <select id="vehicle" name="vehicle" required>
                <option value="">Select vehicle type</option>
                <option value="Bike">Bike</option>
                <option value="Car">Car</option>
            </select>
            <p id="fare" class="mt-3"></p>
            <input type="hidden" id="fareAmount" name="fareAmount" value="0">
            <button type="submit">Submit</button>
            <p id="result"></p>
        </form>
    </div>

    <script>
        // Fare calculation logic
        function calculateFare(source, destination, vehicle) {
            let fare = 0;

            // Simple fare logic: different flat fares for different vehicle types
            if (vehicle === 'Bike') {
                fare = 50;  // Flat fare for Bike
            } else if (vehicle === 'Car') {
                fare = 100; // Flat fare for Car
            }

            return fare;
        }

        // Event listeners to calculate fare when source, destination, or vehicle changes
        document.getElementById('source').addEventListener('change', updateFare);
        document.getElementById('destination').addEventListener('change', updateFare);
        document.getElementById('vehicle').addEventListener('change', updateFare);

        function updateFare() {
            var source = document.getElementById('source').value;
            var destination = document.getElementById('destination').value;
            var vehicle = document.getElementById('vehicle').value;
            var fareText = document.getElementById('fare');
            var fareAmount = document.getElementById('fareAmount'); // Hidden input

            if (source && destination && vehicle) {
                var estimatedFare = calculateFare(source, destination, vehicle);
                fareText.textContent = 'Estimated Fare: ' + estimatedFare + 'rs';
                fareText.style.color = 'green';
                fareAmount.value = estimatedFare; // Set fare in hidden input
            } else {
                fareText.textContent = ''; // Clear if any field is missing
                fareAmount.value = 0; // Reset fare in hidden input
            }
        }
        document.getElementById('cabRequest').addEventListener('submit', function (event) {
            event.preventDefault();
            var source = document.getElementById('source').value;
            var destination = document.getElementById('destination').value;
            var result = document.getElementById('result');

            if (source === destination) {
                result.textContent = 'Please select different areas for source and destination.';
                result.style.color = 'red';
                event.preventDefault(); // Prevent submission if validation fails
            } else {
                result.textContent = 'Cab booked successfully!';
                result.style.color = 'green';
            }
            this.submit();
        });
    </script>
</body>

</html>