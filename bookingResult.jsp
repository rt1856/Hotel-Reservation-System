<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Booking Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            text-align: center;
        }
        .message {
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="message">${message}</div>
    <a href="bookRoom.jsp">Make Another Booking</a>
    <a href="dashboard.jsp">BAck To Home</a>
</body>
</html>
