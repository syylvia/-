package servlet;

import DB.DBuit;
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

@WebServlet("/addtitle")
public class addtitle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置请求编码
        request.setCharacterEncoding("utf-8");
        // 设置响应编码
        response.setContentType("utf-8");
        String type = request.getParameter("type");
        // 获取文章标题
        String title = request.getParameter("title");
        // 获取content内容
        String content = request.getParameter("content");
        ServletContext application = request.getServletContext();
        HttpSession session = request.getSession();
        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
            if (type.equals("hero")) {
                //获取摘要
                String digest = request.getParameter("digest");
                Hero hero = new Hero();
                hero.setName(title);
                hero.setDigest(digest);
                hero.setContent(content);
                String insertsql = "insert into hero(name,content,digest) values(?,?,?);";
                int n = db.executeUpdate(insertsql, new String[]{hero.getName(), hero.getContent(), hero.getDigest()});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=hero");
                }
            } else if (type.equals("scene")) {
                String link = request.getParameter("link");
                String insertsql = "insert into scene(name,photoLink,content) values(?,?,?);";
                int n = db.executeUpdate(insertsql, new String[]{title, link, content});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=scene");
                }
            }else if (type.equals("story")) {
                String date = request.getParameter("date");
                String insertsql = "insert into scene(name,date,content) values(?,?,?);";
                int n = db.executeUpdate(insertsql, new String[]{title, date, content});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=story");
                }
            }else if(type.equals("bk")){
                String date = request.getParameter("date");
                String digest = request.getParameter("digest");
                String []radio = request.getParameterValues("type");
                char lb='1';
                System.out.println(lb);
                if(radio[0].equals("1")){
                    lb='1';
                }else{
                    lb='2';
                }
                String insertsql = "insert into bk(name,date,content,lb,digest) values(?,?,?,?,?);";
                int n = db.executeUpdate(insertsql, new String[]{title, date, content, String.valueOf(lb),digest});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=bk");
                }
            }else if(type.equals("inquire")){
                String date = request.getParameter("date");
                String digest = request.getParameter("digest");
                String link = request.getParameter("link");
                String insertsql = "insert into inquire(name,date,content,link,digest) values(?,?,?,?,?);";
                int n = db.executeUpdate(insertsql, new String[]{title, date, content,link,digest});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=inquire");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
