<%@page
    language="java"
    import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"
    contentType="text/html"
    pageEncoding="UTF-8"
%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.min.css">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://mysql:3306/mydb?autoReconnect=true","root","root");
        %>

        <div class="header-container">
            <header class="wrapper clearfix">
                <nav>
                    <ul>
                        <li><a href="index.html" class="active">Home</a></li>
                        <li><a href="sample">Sample</a></li>
                    </ul>
                </nav>
            </header>
        </div>

        <div class="main-container">
            <div class="main wrapper clearfix">
                <article>
                    <% if (request.getMethod().equals("POST")) {

                        ResultSet rs;

                        String query = "insert into sample (sample) VALUES (?)";
                        String sample = request.getParameter("sample");

                        PreparedStatement stmt = connection.prepareStatement(query);

                        stmt.setString(1, sample);
                        stmt.executeUpdate();

                    %>
                        <p><%= sample %></p>
                    <% } else {

                        ResultSet rs;
                        Statement stmt = connection.createStatement();

                        String sql = "select id, nome from sample";
                        rs = stmt.executeQuery(sql);

                    %>
                        <p>So much sample</p>

                        <% while (rs.next()) { %>
                            <p> ID: <%= rs.getString(1) %> Sample: <%= rs.getString(2) %></p>
                        <% } %>
                    <% } %>
                </article>

            </div> <!-- #main -->
        </div> <!-- #main-container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/main.js"></script>
    </body>
</html>
