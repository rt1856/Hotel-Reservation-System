package com.hrs;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/roomList")
public class RoomListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> rooms = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM rooms WHERE is_available = 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            int columnCount = meta.getColumnCount();

            while (rs.next()) {
                Map<String, Object> room = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    room.put(meta.getColumnName(i), rs.getObject(i));
                }
                rooms.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("rooms", rooms);
        RequestDispatcher dispatcher = request.getRequestDispatcher("selectRoom.jsp");
        dispatcher.forward(request, response);
    }
}
