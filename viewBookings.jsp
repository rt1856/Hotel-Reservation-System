<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>My Bookings</title>
    <style>
        body {
            font-family: Arial;
            padding: 40px;
            background-color: #f7f7f7;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
    </style>
</head>
<body>
    <h2>Your Bookings</h2>

    <c:if test="${empty bookings}">
        <p style="text-align:center;">No bookings found.</p>
    </c:if>

    <c:if test="${not empty bookings}">
        <table>
            <tr>
                <th>ID</th>
                <th>Room</th>
                <th>Customer</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Check-In</th>
                <th>Check-Out</th>
            </tr>
            <c:forEach var="b" items="${bookings}">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.roomType}</td>
                    <td>${b.customerName}</td>
                    <td>${b.phone}</td>
                    <td>${b.email}</td>
                    <td>${b.checkIn}</td>
                    <td>${b.checkOut}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</body>
</html>
