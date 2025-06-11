package com.hrs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/checkAvailability")

public class CheckAvailabilityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomTypeStr = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        String[] parts = roomTypeStr.split(" ");
        String roomType = parts[0];
        boolean isAc = parts[1].equalsIgnoreCase("AC");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        boolean available = false;

        try {
            conn = DBConnection.getConnection(); // Use external class

            // Step 1: Get all room IDs of that type
            String getRoomsSql = "SELECT id FROM rooms WHERE type = ? AND is_ac = ?";

            stmt = conn.prepareStatement(getRoomsSql);
            stmt.setString(1, roomType);
            stmt.setBoolean(2, isAc);
            rs = stmt.executeQuery();

            List<Integer> roomIds = new ArrayList<>();
            while (rs.next()) {
                roomIds.add(rs.getInt("id"));
            }
            rs.close();
            stmt.close();

            if (roomIds.isEmpty()) {
                request.setAttribute("available", false);
                request.getRequestDispatcher("availabilityResult.jsp").forward(request, response);
                return;
            }

            // Step 2: Check if any room is not booked in given range
            String checkSql = "SELECT COUNT(*) FROM reservations WHERE room_id = ? AND NOT (checkout_date <= ? OR checkin_date >= ?)";

            PreparedStatement checkStmt = conn.prepareStatement(checkSql);

            for (int roomId : roomIds) {
                checkStmt.setInt(1, roomId);
                checkStmt.setString(2, checkIn);
                checkStmt.setString(3, checkOut);

                ResultSet checkRs = checkStmt.executeQuery();
                if (checkRs.next() && checkRs.getInt(1) == 0) {
                    available = true;
                    break;
                }
                checkRs.close();
            }
            checkStmt.close();

            request.setAttribute("available", available);
            request.getRequestDispatcher("availabilityResult.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
