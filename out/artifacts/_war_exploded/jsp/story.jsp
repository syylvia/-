<%@ page import="sqltable.Story" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-17
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>红色故事</title>
    <link rel="icon" type="icon" href="../img/icon.ico">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../css/story.css">
</head>

<body>
<%@ include file="head.jsp"%>
<div id="storyHeader">
    <div id="storyHeader-con">
    </div>
</div>
<div id="stories">
    <div id="stories-con">
        <div class="row">
        <ul id="breadcrumb">
            <li>
                <i class="iconfl-jia" id="i2"></i>
                <a href="index.jsp" class="a2">首页/</a>
            </li>
            <li>
                <a href="story.jsp" class="a2">红色故事/</a>
            </li>
            <li class="active" class="a2">列表
            </li>
        </ul>
        </div>
        <div id="title-con">
            <table id="table1">
                <thead style="background-color: #e5e5e5;">
                <tr border: 1px solid #e5e5e5;>
                    <td style="width:446px;height:35px;"><p>标题</p></td>
                    <td style="width:117px;">
                        <p>发布时间</p>
                    </td>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Story> k=(ArrayList<Story>)application.getAttribute("storyArrayList");
//                    if(k!=null){
//                        Iterator<Story> it=k.iterator();
//                        while(it.hasNext()){
//                            Story story=it.next();
                    int i=0;
                    while(k.size()>0&&i<k.size()){
                        Story story=k.get(i);

                %>
                <tr>
<%--                    <td><a href="../title?type=story&id=<%=story.getId()%>"><p><%=story.getName()%></p></a></td>--%>
                        <td><a href="../jsp/title2.jsp?type=story&id=<%=i%>"><p><%=story.getName()%></p></a></td>
                        <td><p><%=story.getDate()%></p> </td>
                </tr>
                <%
                        i++;
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="foot.jsp"%>
</body>
</html>
