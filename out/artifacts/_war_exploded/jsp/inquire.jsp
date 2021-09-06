<%@ page import="sqltable.Title" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-24
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>江西红色寻访</title>
    <link rel="stylesheet" type="text/css" href="../css/inquire.css">
    <link rel="stylesheet" type="text/css" href="../css/page.css">
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="hero_list">
    <div class="row">
        <ul id="breadcrumb">
            <li>
                <i class="iconfl-jia" id="i2"></i>
                <a href="index.jsp" class="a2">首页/</a>
            </li>
            <li>
                <a href="hero.jsp" class="a2">红色寻访/</a>
            </li>
            <li class="active a2">列表
            </li>
        </ul>
        <%
            ArrayList<Title> inquire=(ArrayList<Title>)application.getAttribute("inquireArrayList");
            if(inquire!=null){
                Iterator<Title> it=inquire.iterator();
                while(it.hasNext()){
                    Title title=it.next();
        %>
        <div class="new_items">
        <div class="left-img">
<%--            <img src="img/inquireq.jpeg">--%>
            <img src="<%=title.getPhotoLink()%>">
        </div>
        <div class="middle-word">
            <dl>
            <dt>
                <a href="../title?type=inquire&id=<%=title.getNumber()%>&name=<%=title.getName()%>"><%=title.getName()%></a>
            </dt>
                <dd><%=title.getDigest()%></dd>
            </dl>

        </div>
            <div class="right-word">
                <span class="date"><%=title.getDate().toLocalDate().getDayOfMonth()%></span>
                <span class="year"><%=title.getDate().toLocalDate().getYear()%>.<%=title.getDate().toLocalDate().getMonthValue()%></span>
            </div>
        </div>
        <%
            }
            }
        %>
    </div>
</div>


</body>
</html>