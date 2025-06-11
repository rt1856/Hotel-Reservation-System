<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book a Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
        }
        form {
            max-width: 400px;
            margin: auto;
            padding: 25px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 10px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Hotel Room Booking</h2>
    <form action="bookRoom" method="post">
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

        <label>Your Name:</label>
        <input type="text" name="name" required>

        <label>Phone:</label>
        <input type="text" name="phone" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Check-in Date:</label>
        <input type="date" name="checkIn" required>

        <label>Check-out Date:</label>
        <input type="date" name="checkOut" required>

        <input type="submit" value="Book Room">
    </form>
</body>
</html>
