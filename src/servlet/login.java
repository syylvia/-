package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import DB.DBuit;
import sqltable.Administer;
import sqltable.User;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;

@WebServlet("/login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String []radio = request.getParameterValues("type");
        request.setCharacterEncoding("utf-8");
        // 设置响应编码
        response.setContentType("utf-8");
        DBuit db=new DBuit();
        try{
            Connection conn=db.getConnection();
            if(radio[0].equals("A")){
                String selsctSql="select *from user where username=?";
                ResultSet rs=db.executeQuery(selsctSql,new String[]{username});
                User user = new User();
                String res="";
                if(rs.next()) {
                    user.setUsername(rs.getString(1));
                    user.setPassword(rs.getString(2));
                    user.setEmail(rs.getString(4));
                    user.setSex(rs.getString(3));
                    user.setState(rs.getInt(5));
                    if(user.getState()==2){
                        res="account is not available";
                        response.sendRedirect("/Graduation-project/jsp/login.jsp?res="+res);
                    }else if(!password.equals(user.getPassword())) {
                        res="password error";
                        response.sendRedirect("/Graduation-project/jsp/login.jsp?res="+res);
                    }else {
                        session.setAttribute("user", user);
                        application.setAttribute("user", user);
                        response.sendRedirect("/Graduation-project/jsp/index.jsp");
                    }
                } else{
                    res="the account does not exist";
                    response.sendRedirect("/Graduation-project/jsp/login.jsp?res="+res);
                }

            }else if(radio[0].equals("B")){
                String selsctSql="select *from administer where username=?";
                ResultSet rs=db.executeQuery(selsctSql,new String[]{username});
                Administer administer=new Administer();
                if(rs.next()){
                    administer.setName(rs.getString(1));
                    administer.setPassword(rs.getString(2));
                    administer.setEmail(rs.getString(3));
                    administer.setSex(rs.getString(4));
                    if(!password.equals(administer.getPassword())) {
                        application.setAttribute("error", "密码错误，登陆失败");
                        request.getRequestDispatcher("/failure.jsp").forward(request,response);
                    }else {
                        session.setAttribute("administer", administer);
                        application.setAttribute("administer", administer);
                        //request.getRequestDispatcher("admin-index.jsp").forward(request,response);
                        response.sendRedirect("/Graduation-project/jsp/admin-index.jsp");
                    }
                }
                else{
                    application.setAttribute("error","该用户员不存在，登陆失败");
                    request.getRequestDispatcher("/failure.jsp").forward(request,response);
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            db.closeAll();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
