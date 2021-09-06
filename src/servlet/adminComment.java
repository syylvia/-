package servlet;

import DB.DBuit;
import sqltable.Comment;
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

@WebServlet("/adminComment")
public class adminComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        DBuit db = new DBuit();
        try {
            //红色英雄
            Connection conn = db.getConnection();
            ArrayList<Comment> herocomm=new ArrayList<Comment>();
            String selectSql = "select * from comment where titleType='hero'";
            PreparedStatement pstmt=conn.prepareStatement(selectSql);
            ResultSet rs=pstmt.executeQuery();
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
                herocomm.add(comment);
            }
            application.setAttribute("herocommArrayList", herocomm);
            //红色故事评论
            ArrayList<Comment> storycomm=new ArrayList<Comment>();
            selectSql = "select * from comment where titleType='story'";
            pstmt=conn.prepareStatement(selectSql);
            rs=pstmt.executeQuery();
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
                storycomm.add(comment);
            }
            application.setAttribute("storycommArrayList", storycomm);

            //党史大百科
            ArrayList<Comment> bkcomm=new ArrayList<Comment>();
            selectSql = "select * from comment where titleType='bk'";
            pstmt=conn.prepareStatement(selectSql);
            rs=pstmt.executeQuery();
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
                bkcomm.add(comment);
            }
            application.setAttribute("bkcommArrayList", bkcomm);

            //红色圣地评论

            ArrayList<Comment> scenecomm=new ArrayList<Comment>();
            selectSql = "select * from comment where titleType='scene'";
            pstmt=conn.prepareStatement(selectSql);
            rs=pstmt.executeQuery();
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
                scenecomm.add(comment);
            }
            application.setAttribute("scenecommArrayList", scenecomm);

            //红色寻访
            ArrayList<Comment> inquirecomm=new ArrayList<Comment>();
            selectSql = "select * from comment where titleType='inquire'";
            pstmt=conn.prepareStatement(selectSql);
            rs=pstmt.executeQuery();
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
                inquirecomm.add(comment);
            }
            application.setAttribute("inquirecommArrayList", inquirecomm);

            response.sendRedirect("/Graduation-project/jsp/admini-comment.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}
