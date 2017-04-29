package br.ufscar.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;
import org.apache.commons.io.IOUtils;

public class Sample extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringBuilder data = new StringBuilder();

        ClassLoader classLoader = getClass().getClassLoader();
        String html = "";

        data.append("<p>Sample</p>");
        data.append(String.format("<p>Sample from URL %s</p>", req.getParameter("sample")));

        try {
            html = IOUtils.toString(classLoader.getResourceAsStream("templates/inscricao.html"), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }

        html = html.replace("{{{CONTENT}}}", data);

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter responseOutput = resp.getWriter();

        responseOutput.write(html);
    }

}