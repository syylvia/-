package servlet;

import DB.DBuit;
import sqltable.Comment;
import sqltable.Hero;
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

@WebServlet("/paging")
public class paging extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        // 设置请求编码
        request.setCharacterEncoding("utf-8");
        // 设置响应编码
        response.setContentType("text/html;charset=utf-8");
        String model = request.getParameter("model");//有hero,story,bk等
        String type = request.getParameter("type");//有文章title和评论comment两个可能
        int page=1;
        if(request.getParameter("page")!=null) {
             page = Integer.valueOf(request.getParameter("page"));
        }
        DBuit db = new DBuit();
        String name="";
        try {
            Connection conn = db.getConnection();
            if(type.equals("title")) {
                String selectSql="";
                ArrayList<Title> title=new ArrayList<Title>();
                if(model.equals("hero")){
//                    selectSql = "select * from hero limit "+(page-1)*5+","+5;
                    selectSql = "select * from hero";
                }else if(model.equals("story")){
                    selectSql = "select * from Story";
                }else if(model.equals("inquire")){
                    selectSql = "select * from inquire";
                }else if(model.equals("bk")){
                    selectSql = "select * from bk";
                }else if(model.equals("scene")){
                    selectSql = "select * from scene";
                }
                if(selectSql!="") {
                    PreparedStatement pstmt = conn.prepareStatement(selectSql);
                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) {
                        Title title1=new Title();
                        title1.setName(rs.getString("name"));
                        title1.setNumber(rs.getInt("id"));
                        title.add(title1);
                    }
                    application.setAttribute("titleArrayList", title);
                    //红色英雄留言
                    //request.getRequestDispatcher("/title.jsp").forward(request, response);//请求转发
                    //请求重定向
                    String url = "/Graduation-project/jsp/list.jsp?type="+type+"&model="+model+"&page=1";
                    response.sendRedirect(url);
                }
            }else if(type.equals("comment")) {
                String selectSql="";

                ArrayList<Comment> comm=new ArrayList<Comment>();
                if(model.equals("hero")){
                    selectSql = "select * from comment where titleType='hero'";
                    System.out.println(selectSql);
                }else if(model.equals("story")){
                    selectSql = "select * from comment where titleType='story'";
                }else if(model.equals("inquire")){
                    selectSql = "select * from comment where titleType='inquire'";
                }else if(model.equals("bk")){
                    selectSql = "select * from comment where titleType='bk'";
                }else if(model.equals("scene")){
                    selectSql = "select * from comment where titleType='scene'";
                }
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
                    comm.add(comment);
                }
                application.setAttribute("commentArrayList", comm);
                String url = "/Graduation-project/jsp/list.jsp?type="+type+"&model="+model+"&page=1";
                response.sendRedirect(url);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }

    }
}
