<%@ page import="sqltable.Hero" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-14
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>红色英雄</title>
    <link rel="icon" type="icon" href="../img/icon.ico">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../css/hero.css">
    <link rel="stylesheet" type="text/css" href="../css/page.css">
</head>

<body>
<%@ include file="/jsp/head.jsp"%>
<div class="hero_list">
    <div class="row">
        <ul id="breadcrumb">
        <li>
            <i class="iconfl-jia" id="i2"></i>
            <a href="index.jsp" class="a2">首页/</a>
        </li>
        <li>
            <a href="hero.jsp" class="a2">红色英雄/</a>
        </li>
        <li class="active" class="a2">列表
        </li>
        </ul>
    </div>
    <div id="title">
        <div id="title-con">
            <%
                ArrayList<Hero> k=(ArrayList<Hero>)application.getAttribute("heroArrayList");
                if(k!=null){
                    Iterator<Hero> it=k.iterator();
                    while(it.hasNext()){
                    Hero hero=it.next();
            %>
            <ul>
                <li style="float: left">
                    <div class="border-red">
                        <a href="../title?type=hero&id=<%=hero.getNumber()%>&name=<%=hero.getName()%>"><%=hero.getName()%></a>
                    </div>
                    <p>
                        <%=hero.getDigest()%>
                    </p>
                </li>
                <li style="float:left">
                    <%
                        if(it.hasNext()) {
                            Hero hero2 = it.next();
                    %>
<%--                    <span>|</span>--%>
                    <div class="border-red"><a href="../title?type=hero&id=<%=hero2.getNumber()%>&name=<%=hero2.getName()%>"><%=hero2.getName()%></a></div>
                    <p>
                        <%=hero2.getDigest()%>
                    </p>
                    <%
                        }
                    %>
                </li
                    <%
                        }
                    %>
            </ul>
           <%
               }
           %>
        </div>
    </div>
</div>
<%--<div class="text-center clear">--%>
<%--    <ul class="pagination">--%>
<%--        <li class="page-item disabled"><span class="page-link">上一页</span></li>--%>
<%--        <li class="active page-item disabled" ><span class="page-link">1</span></li>--%>
<%--        <li class="page-item"><a class="page-link" href="/list/4.html?page=2">2</a></li>--%>
<%--        <li class="page-item disabled"><span class="page-link">...</span></li>--%>
<%--        <li class="page-item"><a class="page-link" href="/list/4.html?page=">9</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="/list/4.html?page=10">10</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="/list/4.html?page=2">下一页</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>

<div style="text-align: center;margin-bottom: 30px;">
    <div id="pager" class="pager clearfix">
    </div>
</div>

<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/page.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $("#pager").zPager({
        totalData: 30,               //在调用的时候要显示的条数，决定了分页张数
        htmlBox: $('#wraper'),
        btnShow: true,
        ajaxSetData: false
    });

    function currentPage(currentPage){
        /*
            触发页码数位置： Page/js/jquery.z-pager.js 64行
        */
        console.log("当前页码数：" + currentPage);
    }

</script>

<%@ include file="foot.jsp"%>
</body>
</html>
