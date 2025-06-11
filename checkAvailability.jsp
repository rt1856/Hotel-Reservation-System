<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Room Availability</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }

        h2 {
            color: #333;
        }

        form {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        label, select, input {
            display: block;
            width: 100%;
            margin-top: 15px;
        }

        select, input[type="date"], input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 20px;
            font-size: 18px;
        }

        .available {
            color: green;
        }

        .not-available {
            color: red;
        }
    </style>
</head>
<body>

    <h2>Check Room Availability</h2>

    <%
        Boolean available = (Boolean) request.getAttribute("available");
        if (available != null) {
    %>
        <div class="message <%= available ? "available" : "not-available" %>">
            <%= available ? "Room is available! ✅" : "No rooms available for selected dates. ❌" %>
        </div>
    <%
        }
    %>

    <form action="checkAvailability" method="post">
        <label>Room Type:</label>
        <select name="roomType" required>
            <option value="">-- Select Room --</option>
            <option>Single AC</option>
            <option>Single Non-AC</option>
            <option>Family AC</option>
            <option>Family Non-AC</option>
            <option>Deluxe AC</option>
            <option>Deluxe Non-AC</option>
        </select>

        <label>Check-In Date:</label>
        <input type="date" name="checkIn" required>

        <label>Check-Out Date:</label>
        <input type="date" name="checkOut" required>

        <input type="submit" value="Check Availability">
    </form>

</body>
</html>
