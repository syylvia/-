<%@ page import="sqltable.Title" %>
<%@ page import="sqltable.Story" %>
<%@ page import="java.text.AttributedCharacterIterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sqltable.Comment" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-01
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章</title>
</head>
<%--<link rel="icon" type="icon" href="../img/icon.ico">--%>
<link rel="stylesheet" type="text/css" href="../css/title1.css">
<body>
<%@ include file="head.jsp"%>
<div id="expert" style="width: 70%;margin: 100px auto">
    <%
        User user2=(User)application.getAttribute("user");
        String type = request.getParameter("type");
        String name=(String)session.getAttribute("name9");
        String id=(String)application.getAttribute("id");
        Title title=null;
        ArrayList<Comment>k2=null;
        if(type.equals("inquire")){
            title=(Title)application.getAttribute("inquire");
            k2=(ArrayList<Comment>)application.getAttribute("inquireComm");
    %>

    <%=title.getContent()%>
    <%
        }else if(type.equals("bk")){
            title=(Title)application.getAttribute("bk");
            k2=(ArrayList<Comment>)application.getAttribute("bkComm");
    %>
    <%=title.getContent()%>
    <%
        }
    %>
    <div class="comment">
        <form action="../addComment?type=<%=type%>&id=<%=title.getNumber()%>&user=<%=user2.getUsername()%>" method="post">
            <h3>评论</h3>
            <div class="icon"><img src="../img/yonghu1.png"></div>
            <textarea class="text-area placeholder" placeholder="&nbsp&nbsp&nbsp发表评论" name="textarea">
            </textarea>
            <%
                if(user2!=null){
            %>
            <input type="submit" value="提交" class="btn">
            <%
            }else{
            %>
            <input type="submit" value="提交" class="btn2">
            <%
                }
            %>
        </form>
    </div>


    <table class="table table-striped table-bordered" style="width:70%; margin: 20px auto">
        <thead>
        <tr>
            <td>No.</td>
            <td style="width: 300px;">评论人</td>
            <td style="width:300px;">评论的内容</td>
            <td style="width: 100px;">评论的日期</td>
        </tr>
        </thead>
        <%
            System.out.println(k2.size());
            if(k2!=null){
                int j=0;
                while(j<k2.size()){
                    j++;
                    Comment comment=k2.get(j-1);
                System.out.println(comment.getContent());
        %>
        <tbody>
        <tr>
            <td><%=j%></td>
            <td><%=comment.getUsername()%></td>
            <td><%=comment.getContent()%></td>
            <td><%=comment.getDate()%></td>
        </tr>
        <%
                }
        %>
        </tbody>
        <%
            }
        %>
    </table>
</div>
<%@ include file="foot.jsp"%>
</body>
</html>
