<%@ page import="sqltable.Title" %><%--
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
<style>

</style>
<body>
<%
    Title title=(Title)application.getAttribute("title");
        if(title!=null){
            title.getContent();
        }
%>
</body>
</html>
