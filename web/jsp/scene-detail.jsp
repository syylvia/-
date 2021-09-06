<%@ page import="sqltable.Title" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="servlet.title" %>
<%@ page import="sqltable.Comment" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-21
  Time: 01:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>风景简介</title>
    <link rel="stylesheet" type="text/css" href="../css/vedio.css">
    <link rel="stylesheet" type="text/css" href="../css/title1.css">
</head>

<body>
<%@ include file="head.jsp"%>
<%
    User user2=(User)application.getAttribute("user");
    int id = Integer.parseInt(request.getParameter("id"));
    Title title=(Title)application.getAttribute("scene");
    ArrayList<Comment>k2=(ArrayList<Comment>)application.getAttribute("Comm");
    if (title!= null&& title.getVediolink()!=null){
%>
<div id="video">
<video src="<%=title.getVediolink()%>" controls></video>
</div>
<%
    }
%>
<%=title.getContent()%>
<div class="comment">
    <form action="../addComment?type=scene&id=<%=title.getNumber()%>&user=<%=user2.getUsername()%>" method="post">
        <h3>评论</h3>
        <div class="icon" style="width: 100px;
height: 100px;"><img src="../img/yonghu1.png"></div>
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
        if(k2!=null){
            int j=0;
            while(j<k2.size()){
                j++;
                Comment comment=k2.get(j);
//                System.out.println(comment.getContent());
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
        }
    %>
    </tbody>
</table>
<%@ include file="foot.jsp"%>
</body>
</html>
