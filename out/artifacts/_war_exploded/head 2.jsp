<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-03-30
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>江西红色在线</title>
    <style>
        body{ width: 100%; font-size: 0;}
        .photo1{width:100%;height:224px;position:relative;background-image: url("img/chinese.png");/*背景图片*/
            display:block;background-attachment: scroll;background-repeat: no-repeat;}
        .word1{ position: absolute;margin-top: 140px;font-size: 40px;color:red;}/*江西红色在线*/
        .login{font-size: 15px;width:30px;padding-top: 10px;float: right;padding-right: 20px;}/*登陆注册*/
        .search{position: absolute;width:250px;height:30px;top:40px;right: -60px;}
        .search button{position: relative;outline: none;margin-left: -23px;border: none;background:transparent;top:1px;}
        a{text-decoration: none; /*取消a标签的下划线*/color: black;}
        .layout{height:40px;background:red;/*width:1439px*/width:100%;}/*栏框，*/
        ul>li{list-style: none;float: left;line-height: 40px;width:200px;text-align: center}
    </style>
</head>
<body>
<div class="photo1">
    <a href="http://www.baidu.com" class="word1">江西红色在线</a>
    <a href="login.jsp" class="login">登陆</a>
    <a href="register.jsp" class="login">注册</a>
    <div class="search">
        <form class="form_ajax" id="form_ajax" action="" method="">
            <input type="search" class="search_box" name="keyword" placeholder="请输入你要查询的关键字">
            <button type="button" class="search-button" onclick=""><i class="iconfont iconRectangleCopy"></i></button>
        </form>
    </div>
</div>
<div class="layout">
    <div class="word2">
        <ul>
            <li><a href="">首页</a></li>
            <li><a href="">江西红色英雄</a></li>
            <li> <a href="">江西红色圣地</a></li>
            <li> <a href="">江西红色艺术</a></li>
            <li><a href="">江西红色故事</a></li>
        </ul>
    </div>
</div>
</body>
</html>
