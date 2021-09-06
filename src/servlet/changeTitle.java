package servlet;

import DB.DBuit;
import sqltable.Story;
import sqltable.Title;

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
import java.sql.ResultSet;

@WebServlet("/changeTitle")
public class changeTitle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
            if(type.equals("hero")) {
                String selectSql = "select * from hero where name=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{name});
                Title title = new Title();
                if (rs.next()) {
                    title.setNumber(rs.getInt(1));
                    title.setName(rs.getString(2));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    application.setAttribute("title1", title);
                    //request.getRequestDispatcher("/title.jsp").forward(request, response);//请求转发
                    //请求重定向
                    response.sendRedirect("/Graduation-project/jsp/admin-change.jsp?type=hero");
                }
            }else if(type.equals("story")) {
                String selectSql = "select * from Story where name=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{name});
                Story story=new Story();
                Title title=new Title();
                if (rs.next()) {
                    title.setNumber(rs.getInt(1));
                    title.setName(rs.getString(2));
                    title.setDate(rs.getDate(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    application.setAttribute("title1",title);
                    //request.getRequestDispatcher("/title.jsp").forward(request, response);//请求转发
                    //请求重定向
                    response.sendRedirect("/Graduation-project/jsp/admin-change.jsp?type=story");
                }
            }else if(type.equals("scene")){
                String selectSql = "select * from scene where name=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{name});
                Title title=new Title();
                if (rs.next()) {
                    title.setNumber(rs.getInt(1));
                    title.setName(rs.getString(2));
                    title.setVediolink(rs.getString(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    application.setAttribute("title1", title);
                    //request.getRequestDispatcher("/title.jsp").forward(request, response);//请求转发
                    //请求重定向
                    response.sendRedirect("/Graduation-project/jsp/admin-change.jsp?type=scene");
                }
            }else if(type.equals("bk")) {
                String selectSql = "select * from bk where name=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{name});
                Title title = new Title();
                if (rs.next()) {
                    title.setNumber(rs.getInt(1));
                    title.setName(rs.getString(2));
                    title.setDate(rs.getDate(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    application.setAttribute("title1", title);
                    //request.getRequestDispatcher("/title.jsp").forward(request, response);//请求转发
                    //请求重定向
                    response.sendRedirect("/Graduation-project/jsp/admin-change.jsp?type=bk");
                }
            }else if(type.equals("inquire")) {
                String selectSql = "select * from inquire where name=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{name});
                Title title = new Title();
                if (rs.next()) {
                    title.setNumber(rs.getInt(1));
                    title.setName(rs.getString(2));
                    title.setDate(rs.getDate(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    application.setAttribute("title1", title);
                    //request.getRequestDispatcher("/title.jsp").forward(request, response);//请求转发
                    //请求重定向
                    response.sendRedirect("/Graduation-project/jsp/admin-change.jsp?type=inquire");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}
