package br.ufscar.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class Sample extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        StringBuilder output = new StringBuilder();

        try {
            Connection connection = prepareConnection();
            Statement stmt = connection.createStatement();

            ResultSet rs = stmt.executeQuery("select id, sample from sample");
            connection.close();

            while (rs.next()) {
                output.append(
                    String.format(
                        "<p>ID: %s Sample: %s</p>",
                        rs.getString(1),
                        rs.getString(2)
                    )
                );
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }

        request.setAttribute("output", output);

        dispachTo("/WEB-INF/pages/sample.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        StringBuilder output = new StringBuilder();

        try {
            Connection connection = prepareConnection();

            String query = "insert into sample (sample) VALUES (?)";
            String sample = request.getParameter("sample");

            PreparedStatement stmt = connection.prepareStatement(query);

            stmt.setString(1, sample);
            stmt.executeUpdate();

            connection.close();

            output.append(String.format("<p>You have inserted: %s</p>", sample));
        } catch (Exception exception) {
            exception.printStackTrace();
        }

        request.setAttribute("output", output);

        dispachTo("/WEB-INF/pages/sample.jsp", request, response);
    }

    private void dispachTo(String page, HttpServletRequest request, HttpServletResponse response) throws ServletException {
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/pages/sample.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private Connection prepareConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://mysql:3306/mydb?autoReconnect=true","root","root");
    }
}