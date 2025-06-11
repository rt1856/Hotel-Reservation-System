# Hotel Reservation System

A web-based hotel booking application built using **Java Servlets**, **JSP**, and **MySQL**. It allows users to search for available rooms, make reservations, and manage their bookings. Admins can manage room details and view all reservations through an admin dashboard.

## ✨ Features

- User registration and login
- Search and view available rooms
- Book and cancel room reservations
- Admin panel for managing:
  - Room listings
  - Reservations
- MySQL database integration
- Session management and form validation

## 🛠️ Technologies Used

- Java Servlet & JSP (Backend & View)
- HTML, CSS, Bootstrap (Frontend)
- MySQL (Database)
- JDBC (Database connectivity)
- Apache Tomcat (Web Server)

#Folder Structure

Hrs/
├── build/
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── hrs/
│                   ├── Booking.java
│                   ├── BookRoomServlet.java
│                   ├── CheckAvailabilityServlet.java
│                   ├── DBConnection.java
│                   ├── LoginServlet.java
│                   ├── RegisterServlet.java
│                   ├── RoomListServlet.java
│                   └── ViewBookingsServlet.java
├── webapp/
│   ├── META-INF/
│   │   └── MANIFEST.MF
│   ├── WEB-INF/
│   │   └── lib/
│   │       ├── jakarta.servlet.jsp.jstl-3.0.0.jar
│   │       ├── jakarta.servlet.jsp.jstl-api-3.0.0.jar
│   │       ├── jakarta.servlet.jsp-api-2.3.3.jar
│   │       ├── javax.servlet.jsp-api-2.3.3.jar
│   │       ├── jstl-1.2.jar
│   │       └── standard-1.1.2.jar
│   ├── availabilityResult.jsp
│   ├── bookingResult.jsp
│   ├── bookRoom.jsp
│   ├── checkAvailability.jsp
│   ├── dashboard.jsp
│   ├── dashboard-BG_IMG.jpg
│   ├── login.jsp
│   ├── logout.jsp
│   ├── register.jsp
│   └── viewBookings.jsp


## ⚙️ Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/hotel-reservation-system.git
2. Import the project into your IDE (e.g., Eclipse or NetBeans).

3. Create MySQL Database

Create a database (e.g., hotel_db)

Run the provided SQL script (if available) to create tables.

4. Update Database Configuration
Modify DBConnection.java with your database credentials:
String url = "jdbc:mysql://localhost:3306/hotel_db";
String user = "root";
String password = "yourpassword";
5. Deploy the App

Add the project to Apache Tomcat server.

Run the server and access the app at:
http://localhost:8080/hotel-reservation-system



