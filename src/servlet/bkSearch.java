package servlet;

import DB.DBuit;
import sqltable.Title;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/bkSearch")
public class bkSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBuit db = new DBuit();
        ServletContext application = this.getServletContext();
        String id = request.getParameter("id");
        System.out.println(id);
        try {
            Connection conn = db.getConnection();
            String selectSql = "select * from bk where id=?";
            ResultSet rs= db.executeQuery(selectSql, new String[]{id});
            Title t = new Title();
            while (rs.next()) {
                t.setNumber(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setDate(rs.getDate(3));
                t.setDigest(rs.getString(6));
                t.setLb(rs.getString(5));
                Reader reader = rs.getCharacterStream("content");
                char buffer[] = new char[100000];
                while (reader.read(buffer) != -1) {
                    t.setContent(buffer);
                }
            }
            application.setAttribute("bk", t);
            response.sendRedirect("/Graduation-project/jsp/title2.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }

    }
}
