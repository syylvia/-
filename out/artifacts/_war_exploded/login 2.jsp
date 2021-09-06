<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-03-06
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登陆</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<div class="box">
    <h2>登陆</h2>
    <form action="loginselect" method="post">
        <div class="inputBox">
            <input type="text" name="username" required>
            <label>用户名</label>
        </div>
        <div class="inputBox">
            <input type="password" name="password" required>
            <label>密码</label>
        </div>
        <div class="input">
            <p>
                登陆类型：<input type="radio" name="type" value="A" checked>用户
                <input type="radio" name="type" value="B" >管理员
            </p>
        </div>
        <input type="submit" value="登陆">
        <input type="reset" value="重置">
        <div class="word">
        <p>如果你还没有账号请<a href="register.jsp">注册</a></p>
        </div>
    </form>
</div>
</body>
</html>

