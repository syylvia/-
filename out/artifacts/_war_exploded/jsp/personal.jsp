<%@ page import="sqltable.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sqltable.Comment" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-12
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="../css/personal.css">
<%--    <link href="../css/header.css" rel="stylesheet">--%>
</head>
<body>
<%
    User user=(User)application.getAttribute("user");
    ArrayList<Comment> k=(ArrayList<Comment>)application.getAttribute("usercommArrayList");
    if(user!=null){
%>
<jsp:include page="head.jsp"></jsp:include>
<div class="con">
<%--<div id="con-left">--%>
<%--    <a href="#">修改资料</a>--%>
<%--    <a href="#">修改密码</a>--%>
<%--    <a href="#">我的评论</a>--%>
<%--    <a href="#">我的消息</a>--%>
<%--</div>--%>
    <div class="tabs">
        <ul class="nav nav-tabs">
            <li class="active">
                <i class="iconfl-jia" id="i2"></i>
                <a href="index.jsp" class="a2">个人中心</a>
            </li>
        </ul>

        <div class="content">
        <div class="form-grounp">
            <label class="control-label">用户名</label>
            <div class="word"><%=user.getUsername()%></div>

        </div>
        <div class="form-grounp">
            <label class="control-label">性别</label>
            <div class="word"><%=user.getSex()%></div>
        </div>
        <div class="form-grounp">
            <label class="control-label">邮箱</label>
            <div class="word"><%=user.getEmail()%></div>
        </div>
<%--        <div class="form-grounp">--%>
<%--            <label class="control-label">密码</label>--%>
<%--            <div class="word"><a class="a2" href="#">修改密码</a></div>--%>
<%--        </div>--%>
    </div>

<div class="templatemo-content-container">
    <ul class="nav nav-tabs" style="margin-bottom: 50px;">
        <li class="active">
            <a href="index.jsp" class="a2">我的评论</a>
        </li>
    </ul>
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <td>No.</td>
                        <td style="width: 300px;">评论的文章</td>
                        <td style="width: 100px;">评论的用户</td>
                        <td style="width:300px;">评论的内容</td>
                        <td style="width: 100px;">评论的日期</td>
                    </tr>
                    </thead>
                    <%
                        if(k!=null){
                            int i=0;
                            Iterator<Comment> it=k.iterator();
                            while(it.hasNext()){
                                i++;
                                Comment comment=it.next();
                    %>
                    <tbody>
                    <tr>
                        <td><%=i%></td>
                        <td><%=comment.getTitleName()%></td>
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
    </div>
</div>

<%
    }
%>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
