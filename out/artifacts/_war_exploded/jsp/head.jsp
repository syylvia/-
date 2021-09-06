<%@ page import="sqltable.User" %><%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: yeyuxin--%>
<%--  Date: 2021-03-30--%>
<%--  Time: 12:49--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>江西红色在线</title>--%>
<%--    <style>--%>
<%--        *{margin:0;padding:0}--%>
<%--        body{ width: 100%; font-size: 0;}--%>
<%--        .photo1{width:100%;height:224px;position:relative;background-image: url("img/bg_header.jpg");/*背景图片*/--%>
<%--            display:block;background-attachment: scroll;background-repeat: no-repeat;}--%>
<%--        .word1{ position: absolute;top:140px;font-size: 40px;color:red;left:40px;}/*江西红色在线*/--%>
<%--        .login{font-size: 20px;width:50px;padding-top: 40px;float: right;padding-right: 30px;}/*登陆注册*/--%>
<%--        .search_box{position: absolute;width:345px;height:34px;border: 1px solid #cccccc;border-radius: 20px;right: 15px;top:80px;padding: 10px;}--%>
<%--        .search-button{position: absolute;width:45px;height: 34px; border: none;background:transparent;right: 50px;top:80px;}--%>
<%--        a{text-decoration: none; /*取消a标签的下划线*/color: black;}--%>
<%--        #t{position: absolute; right: 60px;top:90px;}--%>
<%--        .layout{height:40px;background:red;/*width:1439px*/width:100%;}/*栏框，*/--%>
<%--        ul>li{list-style: none;float: left;line-height: 40px;width:200px;text-align: center;font-size: 20px;}--%>
<%--    </style>--%>
<%--    <link rel="stylesheet" type="text/css" href="css/iconfont.css">--%>
<%--</head>--%>
<%--<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>--%>
<%--<script language="javascript">--%>

<%--    function form_ajax_submit(){--%>
<%--        if(document.getElementById("keyword2").value==''){--%>
<%--            alert("搜索内容不能为空")--%>
<%--            return false;--%>
<%--        }else{--%>
<%--            $("#form_ajax").submit();--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<%--<body>--%>
<%--<div class="photo1">--%>
<%--    <a href="http://www.baidu.com" class="word1">江西红色在线</a>--%>
<%--    <a href="login.jsp" class="login">登陆</a>--%>
<%--    <a href="register.jsp" class="login">注册</a>--%>
<%--    <div class="search">--%>
<%--        <form class="form_ajax" id="form_ajax" action="search" method="get">--%>
<%--            <input type="search" class="search_box" name="keyword" id="keyword2" placeholder="请输入你要查询的关键字">--%>
<%--            <i class="iconfont iconRectangleCopy" id="t"></i>--%>
<%--            <button type="button" class="search-button" onclick="form_ajax_submit();"></button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="layout">--%>
<%--    <div class="word2">--%>
<%--        <ul>--%>
<%--            <li><a href="">首页</a></li>--%>
<%--            <li><a href="">江西红色英雄</a></li>--%>
<%--            <li> <a href="">江西红色圣地</a></li>--%>
<%--            <li> <a href="">江西红色艺术</a></li>--%>
<%--            <li><a href="">江西红色故事</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>江西红色在线</title>
    <style>
        *{
            margin:0;
            padding: 0;
        }
        a{
            text-decoration: none;
        }
        ul,li{
            list-style: none;
        }
        #header{
            width:100%;
            min-width:1000px;
            height:172px;
            background: url("../img/4.png") no-repeat 55% 0;
            background-color: #F0F0F1;
        }
        #header-con,#header-con #icon{
            height:172px;
        }
        #header-con{
            width:1171px;
            margin: 0 auto;
            height:172px;
        }
        #header-con #icon{
            width:109px;
            height:120px;
            margin-top: 44px;
            float: left;
        }
        #header-con #icon a{
            max-width: 108px;
            max-height: 89px;
        }
        #word{
            width:400px;
            height: 172px;
            float: left;
        }
        #header-con #word a{
            width:365px;
            float: left;
            font-size: 43px;
            height: 60px;
            color: red;
            margin-top: 60px;
        }
        #header-con #login-register{
           position: absolute;
            width:300px;
            right:80px;

        }
        #header-con #login-register a{
            width:30px;
            height:24px;
            margin-top:45px;
            margin-right:40px;
            float: right;
            font-size: 14px;
            color: black;
        }
        .search{
            width:300px;
            height:60px;
            position: absolute;
            right: 115px;
            top:80px;
        }
        .search_box{
            position: absolute;
            width:300px;height:50px;
            border: 1px solid #cccccc;
            top:2px;
            padding: 10px;
            border-radius: 25px;
            outline: none;
        }
        .search-button{
            position: absolute;
            width:45px;
            height: 30px;
            border: none;
            background:url("../img/search.png") no-repeat;
            right: 50px;
            top:10px;
        }
        .layout{
            width:100%;
            height:62px;
            background-color: red;
        }
        .word2{
            width:1171px;
            height:62px;
            margin: 0 auto;
            text-align: center;
        }
        .word2 ul{
            height:62px;
            text-align: center;
        }
        .word2 li{
            height: 62px;
            float: left;
            width:calc(100% / 7);
        }
        .word2 a:hover{
            background-color: white;
            color: red;
        }
        .word2 li a{
            display: block;
            height: 62px;
            color: white;
            font-size: 16px;
            line-height: 62px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <link rel="icon" type="icon" href="../img/icon.ico">
</head>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script language="javascript">

    function form_ajax_submit(){
        if(document.getElementById("keyword2").value==''){
            alert("搜索内容不能为空")
            return false;
        }else{
            $("#form_ajax").submit();
        }
    }
</script>
<body>
<div id="header">
    <div id="header-con">
        <div id="icon">
            <img src="../img/icon.png" style="width:100%;" >
        </div>
        <div id="word">
            <a href="index.html">江西红色在线</a>
        </div>
        <%
            User user=(User)application.getAttribute("user");
            if(user==null){
        %>
        <div id="login-register">
            <a href="../jsp/login.jsp" class="login">登陆</a>
            <a href="../jsp/register.jsp" class="login">注册</a>
        </div>
        <%
            }else{
        %>
        <div id="login-register">
            <p style="position: absolute;top:30px; width:200px;font-size:15px;text-align: center ">欢迎你，<span id="username"><%=user.getUsername()%></span></p>
            <a href="../exist" style="width:100px;font-size:15px;height:30px;position: absolute;top:30px;left:180px;margin-top:0px;">退出登陆</a>
        </div>
        <%
            }
        %>
        <div class="search">
            <form class="form_ajax" id="form_ajax" action="search" method="get">
                <input type="text" class="search_box" name="keyword" id="keyword2" placeholder="请输入你要查询的关键字">
                <button type="button" class="search-button" onclick="form_ajax_submit();"></button>
            </form>
        </div>
    </div>
</div>
<div class="layout">
    <div class="word2">
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="../search?type=hero">红色英雄</a></li>
            <li><a href="../search?type=bk">党史大百科</a></li>
            <li><a href="../search?type=scene">红色圣地</a></li>
            <li><a href="../search?type=inquire">红色寻访</a></li>
            <li><a href="../search?type=story">红色故事</a></li>
            <%
                if((user==null)){
            %>
            <li><a href="#" onclick="qr()" class="personal">个人中心</a></li>
            <%
                }else{
            %>
            <li><a href='../userComment?username=<%=user.getUsername()%>'>个人中心</a></li>

            <%

                }
            %>
        </ul>
    </div>
</div>
</body>
<script>
    function qr(){
        var user=document.getElementById('#username');
        var per=document.querySelector('.personal');
        if(user&&user){
            alert("请先登陆");
            per.href='login.jsp';
        }
    }
</script>
</html>