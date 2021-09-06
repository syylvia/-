package servlet;

import DB.DBuit;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        String telephone=request.getParameter("telephone");
        String password=request.getParameter("password");
        String []sex = request.getParameterValues("sex");
        DBuit db=new DBuit();
        try{

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            db.closeAll();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
