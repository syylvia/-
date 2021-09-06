<%@ page import="DB.DBuit" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="sqltable.Hero" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-20
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>管理员界面</title>
    <link rel="stylesheet" type="text/css" href="../css/administor.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
</head>
<%
    DBuit db = new DBuit();
    int i=0;
    ArrayList<Hero> hero=new ArrayList<Hero>();
    try {
        Connection conn = db.getConnection();
        String selectSql = "select * from hero";
        PreparedStatement pstmt=conn.prepareStatement(selectSql);
        ResultSet rs=pstmt.executeQuery();
        while(rs.next()) {
            Hero hero2=new Hero();
            hero2.setNumber(rs.getInt(1));
            hero2.setName(rs.getString(2));
            hero2.setDigest(rs.getString(4));
            hero.add(hero2);
            i++;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        db.closeAll();
    }
%>
<body>
<div id="header">
    <div id="header-con">
            <img src="../img/logo.png">
        <div id="word">
            <a href="index.html">江西红色在线</a>
        </div>
        <div class="search">
            <form class="form_ajax" id="form_ajax" action="search" method="get">
                <input type="search" class="search_box" name="keyword" id="keyword2" placeholder="请输入你要查询的关键字">
                <button type="button" class="search-button" onclick="form_ajax_submit();"></button>
            </form>
        </div>
    </div>
    <div class="layout">
            <ul>
                <li><a href="../jsp/index.jsp">首页</a></li>
                <li><a href="../jsp/index.jsp">红色英雄</a></li>
                <li><a href="http://localhost:8080/Graduation-project/search?type=hero">红色圣地</a></li>
                <li><a href="">红色寻访</a></li>
                <li><a href="">红色故事</a></li>
                <li><a href="http://localhost:8080/Graduation-project/search?type=story">用户与反馈</a></li>
            </ul>
    </div>
    <div id="content">
        <div id="left-pilot">
        <ul>

            <li><a>文章管理<span class="right-arrow "></span></a></li>
            <li><a>用户管理<span class="right-arrow "></span></a></li>
            <li><a>留言管理<span class="right-arrow "></span></a></li>

        </ul>
        </div>
        <div class="row">
            <ul id="breadcrumb">
                <li>
                    <i class="iconfl-jia" id="i2"></i>
                    <a href="hero.jsp" class="a2">首页/</a>
                </li>
                <li>
                <li class="active" class="a2">系统参数
            </ul>
        </div>

        <div id="content-list">
                    <table class="table-1">
                        <thead style="background-color: #e5e5e5;">
                        <tr border: 1px solid #e5e5e5;>
                            <td style="width:446px;height:35px;text-align: center" colspan="2"><p>系统参数</p></td>
<%--                            <td style="width:117px;">--%>
<%--                                <p>操作</p>--%>
<%--                            </td>--%>
                        </tr>

                        </thead>
                        <tbody>
                <%
                        Iterator<Hero> it=hero.iterator();
                        while(it.hasNext()){
                            Hero hero1=it.next();
                %>
                        <tr>
                            <td style="text-align: center"><p><%=hero1.getName()%></p></td>
                            <td style="text-align: center;"><a href="" style="float:right; margin-right:30px">查看</a><a href="" style="float: right;margin-right:30px">删除</a></td>
                        </tr>
                <%
                if(it.hasNext()){
                    Hero hero2=it.next();
                    %>
                        <tr>
                            <td style="text-align: center"><p><%=hero2.getName()%></p></td>
                            <td style="text-align: center"><a href="" style="float:right; margin-right:30px">查看</a>&nbsp&nbsp<a href="" style="float:right; margin-right:30px">删除</a></td>
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
</body>
</html>