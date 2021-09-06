<%@ page import="sqltable.Administer" %>
<%@ page import="sqltable.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-03
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户评论表</title>
    <link href="../css/admin-index.css" rel="stylesheet">
</head>
<body>
<%@ include file="../jsp/admin-header.jsp"%>
<%
    Administer admin=( Administer)application.getAttribute("administer");
    ArrayList<Comment> k=(ArrayList<Comment>)application.getAttribute("herocommArrayList");
    ArrayList<Comment> k2=(ArrayList<Comment>)application.getAttribute("scenecommArrayList");
    ArrayList<Comment> k3=(ArrayList<Comment>)application.getAttribute("bkcommArrayList");
    ArrayList<Comment> k4=(ArrayList<Comment>)application.getAttribute("storycommArrayList");
    ArrayList<Comment> k5=(ArrayList<Comment>)application.getAttribute("inquirecommArrayList");

%>
<div class="templatemo-content col-1 light-gray-bg">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="../jsp/admin-index.jsp">系统参数</a></li>
                    <li><a href="../adminTitle">文章管理</a></li>
                    <li><a href="../adminUser" >用户管理</a></li>
                    <li><a href="../adminComment" class="active" >留言管理</a></li>
                    <li class="layui-nav-item" style="float: right;height:34px;"> <a href="#" style="border:0">欢迎您,<%=admin.getName()%><span class="layui-nav-more"></span></a>
<%--                        <dl class="layui-nav-child layui-anim layui-anim-upbit">--%>
<%--                            <!-- 二级菜单 -->--%>
<%--                            <dd><a href="javascript:;"  style="font-size: 14px;" onclick="member_show('张三','member-show.html','10001','360','400')">个人信息</a></dd>--%>
<%--                            <dd><a href="" style="font-size: 14px;">切换帐号</a></dd>--%>
<%--                            <dd><a href="javascript:;" style="font-size: 14px;" onclick="logout()">退出</a></dd>--%>
<%--                        </dl>--%>
                    </li>
                    <li class="layui-nav-item" style="float: right"><img src="../img/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                </ul>
            </nav>
        </div>
    </div>

<%--    红色英雄表评论--%>
    <div class="templatemo-content-container">
        <div class="templatemo-flex-row flex-content-row">
            <div class="col-1">
                <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                    <i class="fa fa-times"></i>
                    <div class="panel-heading templatemo-position-relative"><a href="../paging?model=hero&type=comment" style="text-decoration: none;"><h2 class="text-uppercase">红色英雄表评论</h2></a></div>
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
                                    if(k!=null){
                                        Iterator<Comment> it=k.iterator();
                                        int i=0;
                                        while(it.hasNext() && i<10){
                                            Comment comment =it.next();
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=comment.getTitleName()%></td>
                                    <td><%=comment.getUsername()%></td>
                                    <td><%=comment.getContent()%></td>
                                    <td><%=comment.getDate()%></td>
                                    <td style="font-size: 14px;" ><a href="../deleteComment?id=<%=comment.getId()%>" style="margin-right: 5px;">删除</a></td>
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
                    <div class="panel-heading templatemo-position-relative"><a href="../paging?model=scene&type=comment" style="text-decoration: none;"><h2 class="text-uppercase">红色圣地表评论</h2></a></div>
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
                            <td style="font-size: 14px;" ><a href="../deleteComment?id=<%=comment.getId()%>" style="margin-right: 5px;">删除</a></td>
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
                    <div class="panel-heading templatemo-position-relative"><a href="../paging?model=bk&type=comment" style="text-decoration: none;"><h2 class="text-uppercase">党史大百科表评论</h2></a></div>
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
                            if(k3!=null){
                                Iterator<Comment> it3=k3.iterator();
                                int i=0;
                                while(it3.hasNext() && i<10){
                                    Comment comment =it3.next();
                                    i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=comment.getTitleName()%></td>
                            <td><%=comment.getUsername()%></td>
                            <td><%=comment.getContent()%></td>
                            <td><%=comment.getDate()%></td>
                            <td style="font-size: 14px;" ><a href="../deleteComment?id=<%=comment.getId()%>" style="margin-right: 5px;">删除</a></td>
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
                            if(k4!=null){
                                Iterator<Comment> it4=k4.iterator();
                                int i=0;
                                while(it4.hasNext() && i<10){
                                    Comment comment =it4.next();
                                    i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=comment.getTitleName()%></td>
                            <td><%=comment.getUsername()%></td>
                            <td><%=comment.getContent()%></td>
                            <td><%=comment.getDate()%></td>
                            <td style="font-size: 14px;" ><a href="../deleteComment?id=<%=comment.getId()%>" style="margin-right: 5px;">删除</a></td>
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
                <div class="panel-heading templatemo-position-relative"><a href="../paging?model=inquire&type=comment" style="text-decoration: none;"><h2 class="text-uppercase">红色寻访表评论</h2></a></div>
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
                        if(k5!=null){
                            Iterator<Comment> it5=k5.iterator();
                            int i=0;
                            while(it5.hasNext() && i<10){
                                Comment comment =it5.next();
                                i++;
                    %>
                    <tr>
                        <td><%=comment.getId()%></td>
                        <td><%=comment.getTitleName()%></td>
                        <td><%=comment.getUsername()%></td>
                        <td><%=comment.getContent()%></td>
                        <td><%=comment.getDate()%></td>
                        <td style="font-size: 14px;" ><a href="../deleteComment?id=<%=comment.getId()%>" style="margin-right: 5px;">删除</a></td>
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

</body>
</html>
