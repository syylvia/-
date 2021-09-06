<%@ page import="sqltable.Administer" %>
<%@ page import="sqltable.Hero" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="sqltable.Story" %>
<%@ page import="sqltable.Title" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-02
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章管理</title>
    <link href="../css/admin-title.css" rel="stylesheet">
</head>
<body>
<%@ include file="../jsp/admin-header.jsp"%>
<%
    Administer admin=( Administer)application.getAttribute("administer");
    ArrayList<Hero> k=(ArrayList<Hero>)application.getAttribute("heroArrayList");
    ArrayList<Story> k2=(ArrayList<Story>)application.getAttribute("storyArrayList");
    ArrayList<Title> k3=(ArrayList<Title>)application.getAttribute("sceneArrayList");
    ArrayList<Title> k4=(ArrayList<Title>)application.getAttribute("bkArrayList");
    ArrayList<Title> k5=(ArrayList<Title>)application.getAttribute("inquireArrayList");

%>
<div class="templatemo-content col-1 light-gray-bg">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="../jsp/admin-index.jsp">系统参数</a></li>
                    <li><a href="../adminTitle" class="active">文章管理</a></li>
                    <li><a href="../adminUser" >用户管理</a></li>
                    <li><a href="../adminComment" >留言管理</a></li>
                    <li class="layui-nav-item" style="float: right;height:34px;"> <a href="#" style="border:0">欢迎您,<%=admin.getName()%></a></li>
                    <li class="layui-nav-item" style="float: right"><img src="../img/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                </ul>
            </nav>
        </div>
    </div>
        <div class="templatemo-content-container">
            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="panel-heading templatemo-position-relative" style="width:500px;float: left">
                        <a href="../adminModule?type=story" style="float: left">红色故事表</a>
                        <a href="admini-addtitle.jsp?type=story" style="float: left">增加文章</a>
                    </div>
<%--                    红色故事--%>
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <td>No.</td>
                            <td>标题</td>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(k2!=null){
                                Iterator<Story> it2=k2.iterator();
                                int j=0;
                                while(it2.hasNext() && j<5){
                                    Story story=it2.next();
                                    j++;
                        %>
                        <tr>
                            <td><%=j%></td>
                            <td><%=story.getName()%></td>
                            <td style="font-size: 12px;">
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
<%--                红色英雄--%>
                <div class="templatemo-content-widget white-bg col-1 text-center" style="width:400px">
                    <i class="fa fa-times"></i>
                    <div class="panel-heading templatemo-position-relative" style="width:500px;float: left">
                        <a href="../adminModule?type=hero">红色英雄表</a>
                        <a href="admini-addtitle.jsp?type=hero" style="float: left">增加</a>
                    </div>
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <td>No.</td>
                            <td>标题</td>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(k!=null){
                                Iterator<Hero> it=k.iterator();
                                int i=0;
                                while(it.hasNext() && i<5){
                                    Hero hero=it.next();
                                    i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=hero.getName()%></td>
                            <td style="font-size: 12px;" >
                                <a href="../adminLook?type=hero&name=<%=hero.getName()%>" style="margin-right: 5px;">查看</a>
                                <a href="../deleteTitle?type=hero&name=<%=hero.getName()%>" style="margin-right: 5px;">删除</a>
                                <a href="../changeTitle?type=hero&name=<%=hero.getName()%>">修改</a></td>
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
            <div class="templatemo-flex-row flex-content-row">
                <div class="col-1">
                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                        <i class="fa fa-times"></i>
                        <div class="panel-heading templatemo-position-relative" style="height: 40px;">
                           <a href="../adminModule?type=scene" style="display: block;margin-top:-10px;color: white;font-size:18px;">红色圣地表</a>
<%--                            <a href="#"></a>--%>
                            <a href="admini-addtitle.jsp?type=scene" style="float: left; margin-top: -8px;color: white">增加文章</a>
                        </div>
                        <div class="table-responsive">
<%--                            红色圣地--%>
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <td>No.</td>
                                        <td>标题</td>
                                        <td>视频链接</td>
                                        <td>操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if(k3!=null){
                                            Iterator<Title> it3=k3.iterator();
                                            int i=0;
                                            while(it3.hasNext() && i<5){
                                                Title title =it3.next();
                                                i++;
                                    %>
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=title.getName()%></td>
                                        <td><%=title.getVediolink()%></td>
                                        <td style="font-size: 14px;" >
                                            <a href="../adminLook?type=scene&name=<%=title.getName()%>" style="margin-right: 5px;">查看</a>
                                            <a href="../deleteTitle?type=scene&name=<%=title.getName()%>" style="margin-right: 5px;">删除</a>
                                            <a href="../changeTitle?type=scene&name=<%=title.getName()%>">修改</a></td>
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
        </div> <!-- Second row ends -->
            <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->
                <div class="col-1 templatemo-overflow-hidden" style="margin-left: 30px;">
                    <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">
                        <i class="fa fa-times"></i>
                        <div class="templatemo-flex-row flex-content-row">
<%--                            党史大百科--%>
                            <div class="col-1 col-lg-6 col-md-12">
                                <a href="../adminModule?type=bk"><h2 class="text-center" style="color: red">党史大百科<span class="badge">new</span></h2></a>
                                <a href="admini-addtitle.jsp?type=bk" style="float: left">增加文章</a>
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <td style="width:10px">No.</td>
                                        <td style="width:270px">标题</td>
                                        <td>操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if(k4!=null){
                                            Iterator<Title> it4=k4.iterator();
                                            int i=0;
                                            while(it4.hasNext() && i<5){
                                                Title title4 =it4.next();
                                                i++;
                                    %>
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=title4.getName()%></td>
                                        <td style="font-size: 14px;" >
                                            <a href="../adminLook?type=bk&name=<%=title4.getName()%>" style="margin-right: 5px;">查看</a>
                                            <a href="../deleteTitle?type=bk&name=<%=title4.getName()%>" style="margin-right: 5px;">删除</a>
                                            <a href="../changeTitle?type=bk&name=<%=title4.getName()%>">修改</a></td>
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
                            <div class="col-1 col-lg-6 col-md-12">
                                <a href="../adminModule?type=inquire"><h2 class="text-center" style="color: red">红色寻访<span class="badge">new</span></h2></a>
                                <a href="admini-addtitle.jsp?type=inquire" style="float: left">增加文章</a>
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <td>No.</td>
                                        <td>标题</td>
                                        <td>操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if(k5!=null){
                                            Iterator<Title> it5=k5.iterator();
                                            int i=0;
                                            while(it5.hasNext() && i<5){
                                                Title title5 =it5.next();
                                                i++;
                                    %>
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=title5.getName()%></td>
                                        <td style="font-size: 14px;" >
                                            <a href="../adminLook?type=inquire&name=<%=title5.getName()%>" style="margin-right: 5px;">查看</a>
                                            <a href="../deleteTitle?type=inquire&name=<%=title5.getName()%>" style="margin-right: 5px;">删除</a>
                                            <a href="../changeTitle?type=inquire&name=<%=title5.getName()%>">修改</a></td>
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
</div>

</body>
</html>
