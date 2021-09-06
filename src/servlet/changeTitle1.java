package servlet;

import DB.DBuit;
import sqltable.Hero;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/changeTitle1")
public class changeTitle1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求编码
        request.setCharacterEncoding("utf-8");
        // 设置响应编码
        response.setContentType("utf-8");
        String type = request.getParameter("type");
        // 获取文章标题
        String name = request.getParameter("name");
        // 获取content内容
        String content = request.getParameter("content");
        ServletContext application = request.getServletContext();
        HttpSession session = request.getSession();
        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
            if (type.equals("hero")) {
                //获取摘要
                String insertsql = "update hero set content=? where name=?;";
                int n = db.executeUpdate(insertsql, new String[]{content,name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=hero");
                }
            } else if (type.equals("scene")) {
                String insertsql = "update scene set content=? where name=?;";
                int n = db.executeUpdate(insertsql, new String[]{content,name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=scene");
                }
            }else if (type.equals("story")) {
                String insertsql = "update Story set content=? where name=?;";
                int n = db.executeUpdate(insertsql, new String[]{content,name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=story");
                }
            }else if(type.equals("bk")){
                String insertsql = "update bk set content=? where name=?;";
                int n = db.executeUpdate(insertsql, new String[]{content,name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=bk");
                }
            }else if(type.equals("inquire")){
                String insertsql = "update inquire set content=? where name=?;";
                int n = db.executeUpdate(insertsql, new String[]{content,name});
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
