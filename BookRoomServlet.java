package com.hrs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/bookRoom")
public class BookRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomTypeStr = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        String[] parts = roomTypeStr.split(" ");
        String roomType = parts[0];
        boolean isAc = parts[1].equalsIgnoreCase("AC");

        try (Connection conn = DBConnection.getConnection()) {

            // Step 1: Get matching rooms
            String getRoomsSql = "SELECT id FROM rooms WHERE type = ? AND is_ac = ?";
            try (PreparedStatement stmt = conn.prepareStatement(getRoomsSql)) {
                stmt.setString(1, roomType);
                stmt.setBoolean(2, isAc);
                ResultSet rs = stmt.executeQuery();

                List<Integer> roomIds = new ArrayList<>();
                while (rs.next()) {
                    roomIds.add(rs.getInt("id"));
                }
                rs.close();

                if (roomIds.isEmpty()) {
                    request.setAttribute("message", "No rooms of this type found.");
                    request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
                    return;
                }

                // Step 2: Find available room
                String checkSql = "SELECT COUNT(*) FROM reservations WHERE room_id = ? AND NOT (checkout_date <= ? OR checkin_date >= ?)";
                int availableRoomId = -1;

                for (int roomId : roomIds) {
                    try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                        checkStmt.setInt(1, roomId);
                        checkStmt.setString(2, checkIn);
                        checkStmt.setString(3, checkOut);

                        ResultSet checkRs = checkStmt.executeQuery();
                        if (checkRs.next() && checkRs.getInt(1) == 0) {
                            availableRoomId = roomId;
                            checkRs.close();
                            break;
                        }
                        checkRs.close();
                    }
                }

                if (availableRoomId == -1) {
                    request.setAttribute("message", "No rooms available for the selected dates.");
                    request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
                    return;
                }

                // Step 3: Insert booking
                String insertSql = "INSERT INTO reservations (room_id, customer_name, phone, email, checkin_date, checkout_date) VALUES (?, ?, ?, ?, ?, ?)";

                try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                    insertStmt.setInt(1, availableRoomId);
                    insertStmt.setString(2, name);
                    insertStmt.setString(3, phone);
                    insertStmt.setString(4, email);
                    insertStmt.setString(5, checkIn);
                    insertStmt.setString(6, checkOut);

                    int rows = insertStmt.executeUpdate();
                    if (rows > 0) {
                        request.setAttribute("message", "Room booked successfully! Your room ID is: " + availableRoomId);
                    } else {
                        request.setAttribute("message", "Failed to book the room. Please try again.");
                    }
                    request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Booking error: " + e.getMessage());
        }
    }
}
