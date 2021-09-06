package servlet;

import DB.DBuit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/userState")
public class userState extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String state = request.getParameter("state");
        DBuit db = new DBuit();
        try {
            Connection conn = db.getConnection();
            String insertsql=null;
            if(state.equals("1")) {
                insertsql = "update User set state=1 where username=?;";
            }else {
                insertsql = "update User set state=2 where username=?;";
            }
            int n = db.executeUpdate(insertsql, new String[]{username});
            if (n != 0) {
                response.sendRedirect("./adminUser");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}