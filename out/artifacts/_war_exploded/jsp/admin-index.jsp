<%@ page import="DB.DBuit" %>
<%@ page import="sqltable.SystemNum" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="sqltable.Administer" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-01
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link href='../css/fonts.css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>--%>
<%--    <link href="../css/font-awesome.css" rel="stylesheet">--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/admin-header.css" rel="stylesheet">
    <link href="../css/admin-index.css" rel="stylesheet">
</head>
<body>
<%
    DBuit db = new DBuit();
    SystemNum num=new SystemNum();
    try {
        Connection conn = db.getConnection();
        String selectSql = "select * from systemnum";
        PreparedStatement pstmt=conn.prepareStatement(selectSql);
        ResultSet rs=pstmt.executeQuery();
        while(rs.next()) {
           String s=rs.getString(1);
            if(s.equals("hero")) {
            num.setHero(rs.getInt(2));
        }else if(s.equals("story")) {
                num.setStory(rs.getInt(2));
        }else if(s.equals("user")){
                num.setUser(rs.getInt(2));
        }else if(s.equals("scene")){
                num.setScene(rs.getInt(2));
        }else if(s.equals("inquire")){
                num.setInquire(rs.getInt(2));
        }else if(s.equals("bk")){
                num.setBk(rs.getInt(2));
        }else if(s.equals("comment")){
                num.setComment(rs.getInt(2));
        }else if(s.equals("feedback")){
                num.setFeedback(rs.getInt(2));
        }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        db.closeAll();
    }
    Administer admin=( Administer)application.getAttribute("administer");

    Date reDate = new Date(System.currentTimeMillis());
    String ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(reDate);

%>


<!-- Main content -->
<%@ include file="../jsp/admin-header.jsp"%>
<div class="templatemo-content col-1 light-gray-bg">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="../jsp/admin-index.jsp" class="active">系统参数</a></li>
                    <li><a href="../adminTitle">文章管理</a></li>
                    <li><a href="../adminUser">用户管理</a></li>
                    <li><a href="../adminComment">留言管理</a></li>
                    <li class="layui-nav-item" style="float: right;height:34px;"> <a href="#" style="border:0">欢迎您, <%=admin.getName()%><span class="layui-nav-more"></span></a>
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
    <div class="templatemo-content-container">

            <div class="col-1">
                <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                    <i class="fa fa-times"></i>
                    <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">系统参数表</h2></div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>用户总人数:&nbsp&nbsp&nbsp<%=num.getUser()%></td>
                            </tr>
                            <tr>
                               <td>红色英雄文章数量:&nbsp&nbsp&nbsp<%=num.getHero()%></td>
                            </tr>
                            <tr>
                                <td>党史大百科文章数量:&nbsp&nbsp&nbsp<%=num.getBk()%></td>
                            </tr>
                            <tr>
                                <td>红色圣地文章数量:&nbsp&nbsp&nbsp<%=num.getScene()%></td>
                            </tr>
                            <tr>
                                <td>红色寻访文章数量:&nbsp&nbsp&nbsp<%=num.getStory()%></td>
                            </tr>
                            <tr>
                                <td>红色故事文章数量:&nbsp&nbsp&nbsp<%=num.getStory()%></td>
                            </tr>
                            <tr>
                                <td>反馈信息数量:&nbsp&nbsp&nbsp<%=num.getFeedback()%></td>
                            </tr>
                            <%
                                if(admin!=null){

                            %>
                            <tr>
                                <td>当前登陆用户:&nbsp&nbsp&nbsp<%=admin.getName()%></td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td>当前时间:&nbsp&nbsp&nbsp<%=ft%></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div> <!-- Second row ends -->
    </div>
</div>
</div>
</body>
</html>
