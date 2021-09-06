<%@ page import="sqltable.Title" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="sqltable.Story" %>
<%@ page import="sqltable.Comment" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-22
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章</title>
    <style>
        body.typora-export {
            padding: 0 !important;
        }
    </style>
</head>
<link rel="stylesheet" type="text/css" href="../css/title1.css">

<body>
<%@ include file="head.jsp"%>
<div id="expert">
    <%
        int id=0;
        int i=0;
        User user2=(User)application.getAttribute("user");
        String type = request.getParameter("type");
        ArrayList<Story> k=(ArrayList<Story>)application.getAttribute("storyArrayList");
        ArrayList<Comment>k2=null;
        if(request.getParameter("id")!=null) {
            i = Integer.parseInt(request.getParameter("id"));
        }
        if(type.equals("hero")){
            k2=(ArrayList<Comment>)application.getAttribute("heroComm");
            Title title=(Title)application.getAttribute("hero");
            id=title.getNumber();
    %>
    <%=title.getContent()%>

    <%
        }else if(type.equals("story")){
            Story story=k.get(i);
            k2=(ArrayList<Comment>)application.getAttribute("heroComm");
    %>
    <%=story.getContent()%>
    <%
        }
    %>

    <div class="comment" >
        <form action="../addComment?type=<%=type%>&id=<%=id%>&user=<%=user2.getUsername()%>" method="post">
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
</div>
<%@ include file="../jsp/foot.jsp"%>
</body>
</html>
