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

@WebServlet("/search")
public class search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        String type = request.getParameter("type");

        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
            if(type.equals("hero")){
                ArrayList<Hero> hero=new ArrayList<Hero>();
                String selectSql = "select * from hero";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                //ResultSet rs = db.executeQuery(selectSql, new String[]{});
                while(rs.next()) {
                    Hero hero2=new Hero();
                    hero2.setNumber(rs.getInt(1));
                    hero2.setName(rs.getString(2));
                    hero2.setContent(rs.getString(3));
                    hero2.setDigest(rs.getString(4));
                    hero.add(hero2);
                }
                application.setAttribute("heroArrayList", hero);
                response.sendRedirect("/Graduation-project/jsp/hero.jsp?page=1");
            }else if(type.equals("story")){
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
                application.setAttribute("storyArrayList", stories);
                response.sendRedirect("/Graduation-project/jsp/story.jsp");
            }else if(type.equals("bk")){
                    ArrayList<Title> title=new ArrayList<Title>();
                    String selectSql = "select * from bk order by lb asc";
                    PreparedStatement pstmt=conn.prepareStatement(selectSql);
                    ResultSet rs=pstmt.executeQuery();
                    while(rs.next()){
                        Title t=new Title();
                        t.setNumber(rs.getInt(1));
                        t.setName(rs.getString(2));
                        t.setDate(rs.getDate(3));
                        t.setDigest(rs.getString(6));
                        t.setLb(rs.getString(5));
                        title.add(t);
                    }
                    application.setAttribute("bkArrayList",title);
                    response.sendRedirect("/Graduation-project/jsp/bk.jsp");
                }else if(type.equals("inquire")){
                ArrayList<Title> title=new ArrayList<Title>();
                String selectSql = "select * from inquire";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
                    Title t=new Title();
                    t.setNumber(rs.getInt(1));
                    t.setName(rs.getString(2));
                    t.setDate(rs.getDate(3));
                    t.setPhotoLink(rs.getString(5));
                    t.setDigest(rs.getString(6));
                    title.add(t);
                }
                application.setAttribute("inquireArrayList",title);
                response.sendRedirect("/Graduation-project/jsp/inquire.jsp");
            }else if(type.equals("scene")){
                ArrayList<Title> title=new ArrayList<Title>();
                String selectSql = "select * from scene";
                PreparedStatement pstmt=conn.prepareStatement(selectSql);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()){
                    Title t=new Title();
                    t.setNumber(rs.getInt(1));
                    t.setName(rs.getString(2));
                    t.setVediolink(rs.getString(3));
                    t.setPhotoLink(rs.getString(5));
                    title.add(t);
                }
                application.setAttribute("sceneArrayList",title);
                response.sendRedirect("/Graduation-project/jsp/scene.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}
