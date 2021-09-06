<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="sqltable.*" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-19
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>列表</title>
    <link href="../css/admin-index.css" rel="stylesheet">
    <%--    <link href='../css/fonts.css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>--%>
    <%--    <link href="../css/font-awesome.css" rel="stylesheet">--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/admin-header.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/page.css">
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
                <li><a href="../jsp/admin-index.jsp"  class="active"><i class="fa fa-home fa-fw" ></i>首页</a></li>
                <li><a href="../adminModule?type=hero"><i class="fa fa-bar-chart fa-fw"></i>红色英雄</a></li>
                <li><a href="../adminModule?type=scene"><i class="fa fa-database fa-fw"></i>红色圣地</a></li>
                <li><a href="../adminModule?type=bk"><i class="fa fa-map-marker fa-fw"></i>党史大百科</a></li>
                <li><a href="../adminModule?type=inquire"><i class="fa fa-users fa-fw"></i>红色寻访</a></li>
                <li><a href="../adminModule?type=story"><i class="fa fa-sliders fa-fw"></i>红色故事</a></li>
                <li><a href="login.jsp"><i class="fa fa-eject fa-fw"></i>退出登陆</a></li>
            </ul>
        </nav>
    </div>

<%
String type=request.getParameter("type");
String model=request.getParameter("model");
String p=request.getParameter("page");
int pa=1;
if(p!=null){
    pa=Integer.valueOf(p);
}
ArrayList<Title> k=null;
ArrayList<Comment>k2=null;
int s=0;
int num=0;
if(type.equals("title")){
     k=(ArrayList<Title>)application.getAttribute("titleArrayList");
     num=k.size();
//     System.out.println(k.get(2));
}else if(type.equals("comment")){
     k2=(ArrayList<Comment>)application.getAttribute("commentArrayList");
     num=k2.size();
}

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

<div class="templatemo-content-container" style="min-height: 500px;">
    <div class="templatemo-flex-row flex-content-row">
        <div class="col-1">
            <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
<%--                <div class="panel-heading templatemo-position-relative" style="height: 40px">--%>
<%--                    <a style="display: block;margin-top:-10px;color: white;font-size:18px;float: left" href="list.jsp">表</a>--%>
<%--                    <a href="admini-addtitle.jsp?type=story" style="float: left; margin-top: -8px;color: white;margin-left: 30px;">增加文章</a>--%>
<%--                </div>--%>
                <div class="table-responsive"></div>
                <table class="table table-striped table-bordered">
                    <%
                        if(type.equals("title")){
                    %>
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
                           for(int i=5*pa-5;i<5*pa;i++){
                               if(i<num){
                    %>
                    <tr>
                        <td><%=i+1%></td>
                        <td><%=k.get(i).getName()%></td>

                        <td style="font-size: 14px;" >
                            <a href="../adminLook?type=<%=model%>&name=<%=k.get(i).getName()%>" style="margin-right: 5px;">查看</a>
                            <a href="../deleteTitle?type=<%=model%>&name=<%=k.get(i).getName()%>" style="margin-right: 5px;">删除</a>
                            <a href="../changeTitle?type=<%=model%>&name=<%=k.get(i).getName()%>">修改</a></td>
                    </tr>
                    <%
                        }else{
                    %>
                    <tr>
                        <td>&nbsp</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="font-size: 14px;" ></td>
                    </tr>
                    <%
                            }
                    }
                    %>
                    </tbody>

                    <span class="count" style="text-indent: -777777px;z-index: -7777; position: absolute"><%=num%></span>
                    <%
                        }
                        }else if(type.equals("comment")){
                    %>
<%--                    显示评论表--%>
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
                            for(int i=5*pa-5;i<5*pa;i++){
                                if(i<num){
                    %>
                    <tr>
                        <td><%=i+1%></td>
                        <td><%=k2.get(i).getTitleName()%></td>
                        <td><%=k2.get(i).getUsername()%></td>
                        <td><%=k2.get(i).getContent()%></td>
                        <td><%=k2.get(i).getDate()%></td>
                        <td style="font-size: 14px;" ><a href="../deleteComment?id=<%=k2.get(i).getId()%>" style="margin-right: 5px;">删除</a></td>
                    </tr>
                    <%
                            }else{
                    %>
                    <tr>
                        <td>&nbsp</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="font-size: 14px;" ></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                    <%
                        }
                        }
                    %>
                    <span class="count" style="text-indent: -777777px;z-index: -7777; position: absolute"><%=num%></span>
                    <span class="count2" style="text-indent: -777777px;z-index: -7777; position: absolute"><%=type%></span>
                    <span class="count3" style="text-indent: -777777px;z-index: -7777; position: absolute"><%=model%></span>
                    <span class="count4" style="text-indent: -777777px;z-index: -7777; position: absolute"><%=pa%></span>
                </table>
            </div>
        </div>
    </div>
</div>
        <div style="text-align: center;margin-bottom: 30px;">
            <div id="pager" class="pager clearfix">
            </div>
        </div>
</div>

</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/page.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var count=document.querySelector(".count").innerHTML;
    var count2=document.querySelector(".count2").innerHTML;
    var count3=document.querySelector(".count3").innerHTML;
    var count5=null;
    var count4=document.querySelector(".count4").innerHTML;
    // console.log(count4,'222222222')
    $("#pager").zPager({
        totalData: count,               //在调用的时候要显示的条数，决定了分页张数
        htmlBox: $('#wraper'),
        btnShow: true,
        ajaxSetData: false,
        current:count4
    });
    function currentPage(currentPage,states){
        /*
            触发页码数位置： Page/js/jquery.z-pager.js 64行
        */
        console.log("当前页码数：" + currentPage);
         count5=states;
         count4=currentPage;
        // console.log(states,'111111');
        if(count5==true) {
            location.replace("list.jsp?page=" +currentPage+ "&type=" + count2 + "&model=" + count3) ;
            // $.ajaxData("list.jsp?page=" +currentPage+ "&type=" + count2 + "&model=" + count3,count4);
        }
    }



</script>
</html>
