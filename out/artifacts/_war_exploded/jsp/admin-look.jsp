<%@ page import="sqltable.Title" %>
<%@ page import="sqltable.Story" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-05
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章详情</title>
    <link rel="stylesheet" type="text/css" href="../css/admin-index.css">
</head>
<body>
<jsp:include page="admin-header.jsp"></jsp:include>
<div class="templatemo-content col-1 light-gray-bg">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="../jsp/admin-index.jsp" class="active">系统参数</a></li>
                    <li><a href="../adminTitle">文章管理</a></li>
                    <li><a href="../adminUser">用户管理</a></li>
                    <li><a href="../adminComment">留言管理</a></li>
                    <li class="layui-nav-item" style="float: right;height:34px;"> <a href="#" style="border:0">欢迎您,</a></li>
                    <li class="layui-nav-item" style="float: right"><img src="../img/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                </ul>
            </nav>
        </div>
    </div>

    <div style="margin:50px;">

    <%
        String type = request.getParameter("type");
        if(type.equals("hero")){
            Title title=(Title)application.getAttribute("hero");
    %>
            <%=title.getContent()%>
        <%
         }else if(type.equals("story")){
        Story story=(Story)application.getAttribute("story");
        %>
        <%=story.getContent()%>
        <%
        }else if(type.equals("scene")){
            Title title=(Title)application.getAttribute("scene");
        %>
        <%=title.getContent()%>
        <%
        }else if(type.equals("bk")){
            Title title=(Title)application.getAttribute("bk");
        %>
        <%=title.getContent()%>
        <%
        }else if(type.equals("inquire")){
            Title title=(Title)application.getAttribute("inquire");
        %>
        <%=title.getContent()%>
        <%
        }
    %>
    </div>
</div>
</body>
</html>
