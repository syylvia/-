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

@WebServlet("/addComment")
public class addComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求编码
        request.setCharacterEncoding("utf-8");
//        request.setCharacterEncoding ("gbk");
        HttpSession session = request.getSession();
        // 设置响应编码
        response.setContentType("utf-8");
        String type = request.getParameter("type");
        // 获取文章标题
        String title = (String)session.getAttribute("name9");
        String id = request.getParameter("id");
        System.out.println(id);
        //获取用户名
        String user=request.getParameter("user");
        // 获取textarea内容
        String content = request.getParameter("textarea");
        ServletContext application = request.getServletContext();

        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
                String insertsql = "insert into comment(titleType,titleName,userName,content) values(?,?,?,?);";
                int n = db.executeUpdate(insertsql, new String[]{type,title,user,content});
                if (n != 0) {
                    application.setAttribute("name9",title);
//                     request.getRequestDispatcher("./title?name="+title+"type="+type).forward(request, response);
                    response.sendRedirect("title?id="+id+"&type="+type);
//                    new String(type.getBytes("IOS8859-1"),"gbk");
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
