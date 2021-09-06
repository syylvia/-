package servlet;

import DB.sendMessageUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/test")
public class test extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //向手机发送六位数的随机码已经将随机码响应到页面
        //1.从前台获取电话号码
        String tel = request.getParameter("telephone");
        //2.通过调用工具类的方法生成六位数的随机验证码
        String code = sendMessageUtil.getRandomCode(6);
        //3.通过sendMessageUtil的send方法给手机发送信息
       Integer sendCode = sendMessageUtil.send("zgycsmb"
                , "d41d8cd98f00b204e98011"
                , tel, code);

        //4.通过getMessage出入发送信息的状态码来获取密钥状态
        String message = sendMessageUtil.getMessage(sendCode);
        //5.将随机码返回到前台页面
        PrintWriter writer = response.getWriter();
        writer.print(code);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
