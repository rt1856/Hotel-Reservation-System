<%@ page session="true" %>
<%@ page language="java" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url("dashboard-BG_IMG.jpg") no-repeat center center fixed;
            background-size: cover;
            display: flex;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            height: 100vh;
            background-color: rgba(220, 225, 225, 3); /* slight transparency */
            border-right: 1px solid #ddd;
            padding: 20px 10px;
            box-sizing: border-box;
            position: fixed;
            top: 0;
            left: 0;
        }

        .sidebar h2 {
            font-size: 20px;
            color: #5f6368;
            margin-bottom: 20px;
            padding-left: 10px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 10px 15px;
            border-radius: 8px;
            color: #333;
            text-decoration: none;
            margin-bottom: 8px;
            transition: background 0.2s ease;
        }

        .nav-link:hover {
            background-color: #f1f3f4;
        }

        .nav-link i {
            margin-right: 12px;
            font-size: 18px;
            color: #5f6368;
        }

        /* Content area */
        .main-content {
            margin-left: 260px;
            padding: 30px;
            flex: 1;
            color: #fff;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.7); /* better readability on bg */
        }

        .main-content h2 {
            color: #ffffff;
        }

        .main-content p {
            font-size: 18px;
        }
    </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2><i class="fa-solid fa-hotel"></i> Hotel HRS</h2>
        <a href="checkAvailability.jsp" class="nav-link"><i class="fa-solid fa-bed"></i> Check Room Availability</a>
        <a href="bookRoom.jsp" class="nav-link"><i class="fa-solid fa-calendar-check"></i> Book Room</a>
        <a href="viewBookings" class="nav-link"><i class="fa-solid fa-folder-open"></i> View My Bookings</a>
        <a href="logout.jsp" class="nav-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Welcome to the Hotel Reservation Dashboard</h2>
        <p>Select an option from the left menu to get started.</p>
    </div>

</body>
</html>
