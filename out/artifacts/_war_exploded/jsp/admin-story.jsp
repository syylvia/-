<%@ page import="sqltable.Administer" %>
<%@ page import="sqltable.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sqltable.Story" %>
<%@ page import="sqltable.Comment" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-04
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>红色故事模块</title>
    <link href="../css/admin-index.css" rel="stylesheet">
<%--    <link href='../css/fonts.css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>--%>
<%--    <link href="../css/font-awesome.css" rel="stylesheet">--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/admin-header.css" rel="stylesheet">
</head>
<body>

<div class="templatemo-flex-row">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"><img src="../img/icon.png" style="width: 100%"></div>
            <h1>江西红色在线</h1>
        </header>
        <div class="profile-photo-container">
            <img src="../img/4.png" alt="Profile Photo" class="img-responsive">
            <div class="profile-photo-overlay"></div>
        </div>
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
            <div class="input-group">
                <button type="submit" class="fa fa-search"></button>
                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
            </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul>
                <li><a href="../jsp/admin-index.jsp"><i class="fa fa-home fa-fw"></i>首页</a></li>
                <li><a href="../adminModule?type=hero"><i class="fa fa-bar-chart fa-fw"></i>红色英雄</a></li>
                <li><a href="../adminModule?type=scene"><i class="fa fa-database fa-fw"></i>红色圣地</a></li>
                <li><a href="../adminModule?type=bk"><i class="fa fa-map-marker fa-fw"></i>党史大百科</a></li>
                <li><a href="../adminModule?type=inquire"><i class="fa fa-users fa-fw"></i>红色寻访</a></li>
                <li><a href="../adminModule?type=story" class="active"><i class="fa fa-sliders fa-fw"></i>红色故事</a></li>
                <li><a href="login.jsp"><i class="fa fa-eject fa-fw"></i>退出登陆</a></li>
            </ul>
        </nav>
    </div>

    <%
        Administer admin=( Administer)application.getAttribute("administer");
        ArrayList<User> k1=(ArrayList<User>)application.getAttribute("userArrayList");
        ArrayList<Story> k=(ArrayList<Story>)application.getAttribute("story1ArrayList");
        ArrayList<Comment> k2=(ArrayList<Comment>)application.getAttribute("storycomm1ArrayList");

    %>
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

        <div class="templatemo-content-container">
            <div class="templatemo-flex-row flex-content-row">
                <div class="col-1">
                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                        <i class="fa fa-times"></i>
                        <div class="panel-heading templatemo-position-relative" style="height: 40px">
                            <a style="display: block;margin-top:-10px;color: white;font-size:18px;float: left" href="../paging?model=story&type=title">红色故事表</a>
                            <a href="admini-addtitle.jsp?type=story" style="float: left; margin-top: -8px;color: white;margin-left: 30px;">增加文章</a>
                        </div>
                        <div class="table-responsive"></div>
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <td>No.</td>
                                <td>标题</td>
                                <td>日期</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if(k!=null){
                                    Iterator<Story> it=k.iterator();
                                    int i=0;
                                    while(it.hasNext() && i<10){
                                        Story story=it.next();
                                        i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=story.getName()%></td>
                                <td><%=story.getDate()%></td>
                                <td style="font-size: 14px;" >
                                    <a href="../adminLook?type=story&name=<%=story.getName()%>" style="margin-right: 5px;">查看</a>
                                    <a href="../deleteTitle?type=story&name=<%=story.getName()%>" style="margin-right: 5px;">删除</a>
                                    <a href="../changeTitle?type=story&name=<%=story.getName()%>">修改</a></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="templatemo-content-container">
            <div class="templatemo-flex-row flex-content-row">
                <div class="col-1">
                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                        <i class="fa fa-times"></i>
                        <div class="panel-heading templatemo-position-relative"><a href="../paging?model=story&type=comment" style="text-decoration: none;"><h2 class="text-uppercase">红色故事表评论</h2></a></div>
                        <div class="table-responsive"></div>
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <td>No.</td>
                                <td>评论的文章</td>
                                <td>评论的用户</td>
                                <td>评论的内容</td>
                                <td>评论的日期</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if(k2!=null){
                                    Iterator<Comment> it2=k2.iterator();
                                    int i=0;
                                    while(it2.hasNext() && i<10){
                                        Comment comment =it2.next();
                                        i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=comment.getTitleName()%></td>
                                <td><%=comment.getUsername()%></td>
                                <td><%=comment.getContent()%></td>
                                <td><%=comment.getDate()%></td>
                                <td style="font-size: 14px;" ><a href="#" style="margin-right: 5px;">删除</a></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
