package servlet;

import DB.DBuit;
import sqltable.Comment;
import sqltable.Hero;
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/adminModule")
public class adminModule extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        String type = request.getParameter("type");
        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
            if(type.equals("hero")) {
                //红色英雄文章
                ArrayList<Hero> hero=new ArrayList<Hero>();
                String selectSql = "select * from hero";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()) {
                    Hero hero2=new Hero();
                    hero2.setNumber(rs.getInt(1));
                    hero2.setName(rs.getString(2));
                    hero2.setContent(rs.getString(3));
                    hero2.setDigest(rs.getString(4));
                    hero.add(hero2);
                }
                application.setAttribute("hero1ArrayList", hero);
                //红色英雄留言

                ArrayList<Comment> herocomm=new ArrayList<Comment>();
                selectSql = "select * from comment where titleType='hero'";
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
                    herocomm.add(comment);
                }
                application.setAttribute("herocomm1ArrayList", herocomm);
                    response.sendRedirect("/Graduation-project/jsp/admin-hero.jsp");
                }else if(type.equals("story")){
                //红色故事文章
                ArrayList<Story> stories=new ArrayList<Story>();
                String selectSql = "select * from Story";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
                    Story story=new Story();
                    story.setId(rs.getInt(1));
                    story.setName(rs.getString(2));
                    story.setDate(rs.getString(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        story.setContent(buffer);
                    }
                    stories.add(story);
                }
                application.setAttribute("story1ArrayList", stories);

                //红色故事评论
                ArrayList<Comment> storycomm=new ArrayList<Comment>();
                selectSql = "select * from comment where titleType='story'";
                pstmt=conn.prepareStatement(selectSql);
                rs=pstmt.executeQuery();
                while(rs.next()) {
                    Comment comment = new Comment();
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
                application.setAttribute("stoty1comm1ArrayList", storycomm);
                response.sendRedirect("/Graduation-project/jsp/admin-story.jsp");

                }else if (type.equals("scene")){
                //红色圣地文章
                ArrayList<Title> scene=new ArrayList<Title>();
                String selectSql = "select * from scene";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()) {
                        Title title =new Title();
                        title.setNumber(rs.getInt(1));
                        title.setName(rs.getString(2));
                        title.setVediolink(rs.getString(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100];
                    while (reader.read(buffer) != -1) {
                        title.setContent(buffer);
                    }
                    scene.add(title);
                }
                application.setAttribute("scene1ArrayList", scene);
                //红色圣地留言

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
                application.setAttribute("scenecomm1ArrayList", scenecomm);
                response.sendRedirect("/Graduation-project/jsp/admin-scene.jsp");

            }else if(type.equals("bk")){
                //红色大百科故事
                ArrayList<Title> bk=new ArrayList<Title>();
                String selectSql = "select * from bk";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
                    Title title1 =new Title();
                    title1.setNumber(rs.getInt(1));
                    title1.setName(rs.getString(2));
                    title1.setDate(rs.getDate(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title1.setContent(buffer);
                    }
                    bk.add(title1);
                }
                application.setAttribute("bk1ArrayList",bk);

                //红色大百科留言
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
                application.setAttribute("bkcomm1ArrayList", bkcomm);
                response.sendRedirect("/Graduation-project/jsp/admin-bk.jsp");


            }else if(type.equals("inquire")){
                //红色寻访文章
                ArrayList<Title> inquire=new ArrayList<Title>();
                String selectSql = "select * from inquire";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
                    Title title2 =new Title();
                    title2.setNumber(rs.getInt(1));
                    title2.setName(rs.getString(2));
                    title2.setDate(rs.getDate(3));
                    Reader reader = rs.getCharacterStream("content");
                    char buffer[] = new char[100000];
                    while (reader.read(buffer) != -1) {
                        title2.setContent(buffer);
                    }
                    inquire.add(title2);
                }
                application.setAttribute("inquire1ArrayList",inquire);

                //红色寻访留言
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
                application.setAttribute("inquirecomm1ArrayList", inquirecomm);
                response.sendRedirect("/Graduation-project/jsp/admin-inquire.jsp");



            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}
