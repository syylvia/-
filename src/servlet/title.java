package servlet;

import DB.DBuit;
import sqltable.Comment;
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
import java.util.ArrayList;

import org.w3c.dom.Text;

@WebServlet("/title")
public class title extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        // 设置请求编码
        request.setCharacterEncoding("utf-8");
        // 设置响应编码
        response.setContentType("text/html;charset=utf-8");
        String name9 = (String)session.getAttribute("name9");
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        DBuit db = new DBuit();
        String name="";
        try {
            Connection conn = db.getConnection();
            String seleSql="select * from comment where titleName=?";
            if(type.equals("hero")) {
                String selectSql = "select * from hero where id=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{id});
                Title title = new Title();
                if (rs.next()) {
                    title.setNumber(rs.getInt(1));
                    title.setName(rs.getString(2));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    name =title.getName();
                    application.setAttribute("hero", title);
                    session.setAttribute("name9",name);
                    application.setAttribute("id",id);
                }
//                String seleSql="select * from comment where titleName=?";
                ResultSet rs2 = db.executeQuery(seleSql, new String[]{name});
                ArrayList<Comment> comm=new ArrayList<Comment>();
                while (rs2.next()) {
                    Comment comment=new Comment();
                    comment.setUsername(rs2.getString(4));
                    comment.setDate(rs2.getDate(6));
                    Reader reader = rs2.getCharacterStream("content");
                    char buffer[] = new char[1000];
                    while (reader.read(buffer) != -1) {
                        comment.setContent(buffer);
                    }
                    comm.add(comment);
                }
                application.setAttribute("heroComm",comm);
                String url="/Graduation-project/jsp/title2.jsp?type=hero";
                response.sendRedirect(url);

            }else if(type.equals("story")) {
                String selectSql = "select * from Story where id=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{id});
                Story story=new Story();
                if (rs.next()) {
                    story.setId(rs.getInt(1));
                    story.setName(rs.getString(2));
                    story.setDate(rs.getString(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        story.setContent(buffer);
                    }
                    name=story.getName();
                    application.setAttribute("story", story);
                    session.setAttribute("name9",name);
                    //请求重定向
                }
                ResultSet rs2 = db.executeQuery(seleSql, new String[]{name});
                ArrayList<Comment> comm=new ArrayList<Comment>();
                while (rs2.next()) {
                    Comment comment=new Comment();
                    comment.setUsername(rs2.getString(4));
                    comment.setDate(rs2.getDate(6));
                    Reader reader = rs2.getCharacterStream("content");
                    char buffer[] = new char[1000];
                    while (reader.read(buffer) != -1) {
                        comment.setContent(buffer);
                    }
                    comm.add(comment);
                }
                application.setAttribute("storyComm",comm);
                response.sendRedirect("/Graduation-project/jsp/title2.jsp?type=story&id="+id);
            }else if(type.equals("inquire")){
                String selectSql = "select * from inquire where id=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{id});
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
                    name=title.getName();
                    application.setAttribute("inquire", title);
                    session.setAttribute("name9",name);
                }
                ResultSet rs2 = db.executeQuery(seleSql, new String[]{name});
                ArrayList<Comment> comm=new ArrayList<Comment>();
                while (rs2.next()) {
                    Comment comment=new Comment();
                    comment.setUsername(rs2.getString(4));
                    comment.setDate(rs2.getDate(6));
                    Reader reader = rs2.getCharacterStream("content");
                    char buffer[] = new char[1000];
                    while (reader.read(buffer) != -1) {
                        comment.setContent(buffer);
                    }
                    comm.add(comment);
                }
                application.setAttribute("inquireComm",comm);
                response.sendRedirect("/Graduation-project/jsp/title.jsp?type=inquire&id="+id);
            }else if(type.equals("bk")){
                String selectSql = "select * from bk where id=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{id});
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
                    name=title.getName();
                    application.setAttribute("bk", title);
                    session.setAttribute("name9",name);
                }
                ResultSet rs2 = db.executeQuery(seleSql, new String[]{name});
                ArrayList<Comment> comm=new ArrayList<Comment>();
                while (rs2.next()) {
                    Comment comment=new Comment();
                    comment.setUsername(rs2.getString(4));
                    comment.setDate(rs2.getDate(6));
                    Reader reader = rs2.getCharacterStream("content");
                    char buffer[] = new char[1000];
                    while (reader.read(buffer) != -1) {
                        comment.setContent(buffer);
                    }
                    comm.add(comment);
                }
                application.setAttribute("bkComm",comm);
                response.sendRedirect("/Graduation-project/jsp/title.jsp?type=bk&id="+id);
            }else if(type.equals("scene")){
                String selectSql = "select * from scene where id=?";
                ResultSet rs = db.executeQuery(selectSql, new String[]{id});
                Title title=new Title();
                if (rs.next()) {
                    title.setNumber(rs.getInt(1));
                    title.setName(rs.getString(2));
                    title.setVediolink(rs.getString(3));
                    title.setPhotoLink(rs.getString(5));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    name=title.getName();
                    application.setAttribute("scene", title);
                    session.setAttribute("name9",name);
                }
                ResultSet rs2 = db.executeQuery(seleSql, new String[]{name});
                ArrayList<Comment> comm=new ArrayList<Comment>();
                while (rs2.next()) {
                    Comment comment=new Comment();
                    comment.setUsername(rs2.getString(4));
                    comment.setDate(rs2.getDate(6));
                    Reader reader = rs2.getCharacterStream("content");
                    char buffer[] = new char[1000];
                    while (reader.read(buffer) != -1) {
                        comment.setContent(buffer);
                    }
                    comm.add(comment);
                }
                application.setAttribute("sceneComm",comm);
                response.sendRedirect("/Graduation-project/jsp/scene-detail.jsp?id="+id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}
