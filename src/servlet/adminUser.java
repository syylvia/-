package servlet;

import DB.DBuit;
import sqltable.Hero;
import sqltable.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/adminUser")
public class adminUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        DBuit db = new DBuit();
        try {
            //用户表
            Connection conn = db.getConnection();
            ArrayList<User> users=new ArrayList<User>();
            String selectSql = "select * from User";
            PreparedStatement pstmt=conn.prepareStatement(selectSql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
                User user=new User();
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setSex(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setState(rs.getInt(5));
                users.add(user);
            }
            application.setAttribute("userArrayList", users);
            response.sendRedirect("/Graduation-project/jsp/admini-user.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        db.closeAll();
    }
    }
}
