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
import java.sql.Connection;

@WebServlet("/deleteComment")
public class deleteComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        DBuit db = new DBuit();
        String id = request.getParameter("id");
        try {
            Connection conn = db.getConnection();
                String deletesql = "delete from comment where id=?";
                int n = db.executeUpdate(deletesql, new String[]{id});
                if (n != 0) {
                    response.sendRedirect("./adminComment");
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll();
        }
    }
}