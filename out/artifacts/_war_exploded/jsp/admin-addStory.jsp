<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-05
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章管理</title>
    <link rel="stylesheet" type="text/css" href="../css/addtitle.css">
    <link rel="stylesheet" type="text/css" href="../css/admin-index.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="../css/min.css">
    <style type="text/css">
        body{
            padding: 0px 10px 0px 10px;
            color:#333333;
        }
    </style>
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
                    <li class="layui-nav-item" style="float: right;height:34px;"> <a href="#" style="border:0">欢迎您,<span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child layui-anim layui-anim-upbit">
                            <!-- 二级菜单 -->
                            <dd><a href="javascript:;"  style="font-size: 14px;" onclick="member_show('张三','member-show.html','10001','360','400')">个人信息</a></dd>
                            <dd><a href="" style="font-size: 14px;">切换帐号</a></dd>
                            <dd><a href="javascript:;" style="font-size: 14px;" onclick="logout()">退出</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item" style="float: right"><img src="../img/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                </ul>
            </nav>
        </div>
    </div>
    <div style="margin:20px;">
        <form action="addtitle" method="post">
            <br><br><br>
            <label style="font-size: 18px">请输入文章标题：</label><input type="text" name="title" style="height: 40px;border-radius: 10px;width:400px;outline: none">
            <br><br><br>
            <label style="font-size: 18px">&nbsp&nbsp&nbsp&nbsp请输入日期:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><input type="text" name="digest" style="height: 40px;border-radius: 10px;width:400px;outline: none">
            <br><br><br>
            <div id='txtDiv' style='border:1px solid #cccccc; height:240px;'>
                <p>请输入内容...</p>
            </div>
            <textarea  name="content" id='textarea' style='width:100%; height:100px; margin-top:10px;'></textarea>
            <button id='btnHtml' type="submit">提交</button>
        </form>
    </div>
</div>
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src='../js/wangEditor.js'></script>
<script type="text/javascript">
    $(function(){
        $('#spanTime').text((new Date()).toString());

        //一句话，即可把一个div 变为一个富文本框！o(∩_∩)o
        var $editor = $('#txtDiv').wangEditor();

        //显示 html / text
        var $textarea = $('#textarea'),
            $btnHtml = $('#btnHtml'),
            $btnText = $('#btnText'),
            $btnHide = $('#btnHide');
        $textarea.hide();
        $btnHtml.click(function(){
            // $textarea.show();
            $textarea.val( $editor.html() );
        });
        $btnText.click(function(){
            $textarea.val( $editor.text() );
        });
    });
</script>
</body>
</html>
