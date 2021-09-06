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

@WebServlet("/deleteTitle")
public class deleteTitle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();
        DBuit db = new DBuit();
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        try {
            Connection conn = db.getConnection();
            if(type.equals("hero")) {
                String deletesql = "delete from hero where name=?";
                int n = db.executeUpdate(deletesql, new String[]{name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=hero");
                }
            }else if(type.equals("story")){
                String deletesql = "delete from Story where name=?";
                int n = db.executeUpdate(deletesql, new String[]{name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=story");
                }
            }else if(type.equals("scene")){
                String deletesql = "delete from scene where name=?";
                int n = db.executeUpdate(deletesql, new String[]{name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=scene");
                }
            }else if(type.equals("bk")){
                String deletesql = "delete from bk where name=?";
                int n = db.executeUpdate(deletesql, new String[]{name});
                if (n != 0) {
                    response.sendRedirect("./adminModule?type=bk");
                }
            }else if(type.equals("inquire")){
                String deletesql = "delete from inquire where name=?";
                int n = db.executeUpdate(deletesql, new String[]{name});
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
}