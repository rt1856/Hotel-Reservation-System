<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Availability Result</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f9;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .message {
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            background-color: white;
            text-align: center;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="message">
    <%
        Boolean available = (Boolean) request.getAttribute("available");
        if (available != null && available) {
    %>
        <h2 class="success">✅ Room is available!</h2>
        <a href="bookRoom.jsp">Go for Booking</a>
    <%
        } else {
    %>
        <h2 class="error">❌ No room available for selected dates.</h2>
        <a href="dashboard.jsp">Back to Home</a>
    <%
        }
    %>
</div>

</body>
</html>
