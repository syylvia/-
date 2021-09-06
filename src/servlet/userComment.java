package servlet;

import DB.DBuit;
import sqltable.Comment;

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

@WebServlet("/userComment")
public class userComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求编码
        request.setCharacterEncoding("utf-8");
//        request.setCharacterEncoding ("gbk");
        HttpSession session = request.getSession();
        // 设置响应编码
        response.setContentType("utf-8");
        String username = request.getParameter("username");
        ServletContext application = this.getServletContext();

        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
            ArrayList<Comment> usercomm=new ArrayList<Comment>();
            String selectSql = "select * from comment where userName=?";
            ResultSet rs = db.executeQuery(selectSql, new String[]{username});
            while(rs.next()) {
                Comment comment=new Comment();
                comment.setId(rs.getInt(1));
                comment.setTitleType(rs.getString(2));
                comment.setTitleName(rs.getString(3));
                comment.setUsername(rs.getString(4));
                comment.setDate(rs.getDate(6));
                Reader reader = rs.getCharacterStream("content");
                char buffer[] = new char[100000];
                while (reader.read(buffer) != -1) {
                    comment.setContent(buffer);
                }
                usercomm.add(comment);
            }
            application.setAttribute("usercommArrayList", usercomm);
            response.sendRedirect("/Graduation-project/jsp/personal.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }

        }
}
