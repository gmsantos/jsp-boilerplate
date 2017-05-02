<%@page
    import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"
    contentType="text/html"
    pageEncoding="UTF-8"
%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://mysql:3306/mydb?autoReconnect=true","root","root");

    StringBuilder output = new StringBuilder();
    ResultSet rs;

    if (request.getMethod().equals("POST")) {


        String query = "insert into sample (sample) VALUES (?)";
        String sample = request.getParameter("sample");

        PreparedStatement stmt = connection.prepareStatement(query);

        stmt.setString(1, sample);
        stmt.executeUpdate();

        output.append(String.format("<p>You have inserted: %s</p>", sample));

    } else {

        Statement stmt = connection.createStatement();

        String sql = "select id, sample from sample";
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            output.append(
                String.format(
                    "<p>ID: %s Sample: %s</p>",
                    rs.getString(1),
                    rs.getString(2)
                )
            );
        }
    }

    request.setAttribute("output", output);
%>

<t:master>
    <jsp:body>
        ${output}
    </jsp:body>
</t:master>
