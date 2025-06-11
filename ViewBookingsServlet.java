package com.hrs;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewBookings")
public class ViewBookingsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Booking> bookings = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = """
                SELECT r.id, r.room_id, rm.type, rm.is_ac, r.customer_name, r.phone, r.email, r.checkin_date, r.checkout_date
                FROM reservations r
                JOIN rooms rm ON r.room_id = rm.id
                ORDER BY r.checkin_date DESC
            """;

            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Booking b = new Booking();
                    b.setId(rs.getInt("id"));
                    b.setRoomId(rs.getInt("room_id"));
                    b.setRoomType(rs.getString("type") + (rs.getBoolean("is_ac") ? " AC" : " Non-AC"));
                    b.setCustomerName(rs.getString("customer_name"));
                    b.setPhone(rs.getString("phone"));
                    b.setEmail(rs.getString("email"));
                    b.setCheckIn(rs.getDate("checkin_date").toString());
                    b.setCheckOut(rs.getDate("checkout_date").toString());
                    bookings.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}
