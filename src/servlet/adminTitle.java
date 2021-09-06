package servlet;

import DB.DBuit;
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

@WebServlet("/adminTitle")
public class adminTitle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
//        String name = request.getParameter("name");
//        String type = request.getParameter("type");
        DBuit db = new DBuit();
        try {
            //红色英雄表
            Connection conn = db.getConnection();
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
            application.setAttribute("heroArrayList", hero);

            //红色故事表
            ArrayList<Story> stories=new ArrayList<Story>();
            selectSql = "select * from Story";
            pstmt=conn.prepareStatement(selectSql);
            ResultSet rs2=pstmt.executeQuery();
            while(rs2.next()){
                Story story=new Story();
                story.setId(rs2.getInt(1));
                story.setName(rs2.getString(2));
                story.setDate(rs2.getString(3));
                Reader reader = rs2.getCharacterStream("content");
                char buffer[] = new char[100000];
                while (reader.read(buffer) != -1) {
                    story.setContent(buffer);
                }
                stories.add(story);
            }
            application.setAttribute("storyArrayList", stories);

            //红色圣地表
            ArrayList<Title> scene=new ArrayList<Title>();
            selectSql = "select * from scene";
            pstmt=conn.prepareStatement(selectSql);
            ResultSet rs3=pstmt.executeQuery();
            while(rs3.next()){
                Title title =new Title();
                title.setNumber(rs3.getInt(1));
                title.setName(rs3.getString(2));
                title.setVediolink(rs3.getString(3));
                Reader reader = rs3.getCharacterStream("content");
                char buffer[] = new char[100000];
                while (reader.read(buffer) != -1) {
                    title.setContent(buffer);
                }
                scene.add(title);
            }
            application.setAttribute("sceneArrayList",scene);

            //党史大百科
            ArrayList<Title> bk=new ArrayList<Title>();
            selectSql = "select * from bk";
            pstmt=conn.prepareStatement(selectSql);
            ResultSet rs4=pstmt.executeQuery();
            while(rs4.next()){
                Title title1 =new Title();
                title1.setNumber(rs4.getInt(1));
                title1.setName(rs4.getString(2));
                title1.setDate(rs4.getDate(3));
                Reader reader = rs4.getCharacterStream("content");
                char buffer[] = new char[100000];
                while (reader.read(buffer) != -1) {
                   title1.setContent(buffer);
                }
                bk.add(title1);
                title1.setDigest(rs4.getString(6));
            }
            application.setAttribute("bkArrayList",bk);


            //红色寻访表
            ArrayList<Title> inquire=new ArrayList<Title>();
            selectSql = "select * from inquire";
            pstmt=conn.prepareStatement(selectSql);
            ResultSet rs5=pstmt.executeQuery();
            while(rs5.next()){
                Title title2 =new Title();
                title2.setNumber(rs5.getInt(1));
                title2.setName(rs5.getString(2));
                title2.setDate(rs5.getDate(3));
                Reader reader = rs5.getCharacterStream("content");
                char buffer[] = new char[100000];
                while (reader.read(buffer) != -1) {
                    title2.setContent(buffer);
                }
                inquire.add(title2);
            }
            application.setAttribute("inquireArrayList",inquire);


            response.sendRedirect("/Graduation-project/jsp/admini-title.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}
