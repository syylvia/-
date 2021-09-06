<%@ page import="sqltable.Title" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-17
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>红色圣地</title>
    <link rel="icon" type="icon" href="../img/icon.ico">
    <link rel="stylesheet" type="text/css" href="../css/scene.css">
</head>
<body>
<%@ include file="head.jsp"%>
<div id="carousel">
    <div id="carousel-con">
        <div id="photo">
            <div id="photo-title1">
            <p>瑞金--中华苏维埃共和国临时中央政府的诞生地</p>
            </div>
            <div id="photo-title2">
                <p>八一--打响了武装反抗国民党反动派的第一枪</p>
            </div>
            <div id="photo-title3">
                <p>井冈山--中国共产党的第一个农村革命根据地</p>
            </div>
            </div>
        </div>
    </div>
</div>
<%
    ArrayList<Title> k=(ArrayList<Title>)application.getAttribute("sceneArrayList");
%>
<div id="recommend">
    <div id="recommend-con">
        <div id="recommend-title">
        <h2>热门推荐</h2>
            <span></span>
        </div>
        <div id="recommend-photo">
            <%
                if(k!=null && k.size()>2){
//                    System.out.println(k.size());
            %>
            <div class="photo-BY">
                <a href="../title?type=scene&id=1"><img src="<%=k.get(0).getPhotoLink()%>">
                <p><%=k.get(0).getName()%></p>
                </a>
            </div>
            <div class="photo-BY">
                <a href="../title?type=scene&id=2"><img src="<%=k.get(1).getPhotoLink()%>">
                    <p><%=k.get(1).getName()%></p>
                </a>
            </div>
            <%
                }
            %>
            <%
                int i=2;
                while(i<k.size()){
            %>
            <div class="photo-small">
                <a href="../title?type=scene&id=<%=k.get(i).getNumber()%>" class="tp"><img style="width:100%;height:100%" src="<%=k.get(i).getPhotoLink()%>"></a>
                <p><%=k.get(i).getName()%></p>
            </div>
            <%
                    i++;
                }
            %>
<%--            <div class="photo-small">--%>
<%--                <a href="" class="tp"><img src="../img/ShangRao.jpg"></a>--%>
<%--                <p>上饶集中营旧址</p>--%>
<%--            </div>--%>
<%--            <div class="photo-small">--%>
<%--                <a href="" class="tp"><img src="../img/RuiJin.png"></a>--%>
<%--                <p>中华苏维埃共和国临时中央政府</p>--%>
<%--            </div>--%>
<%--            <div class="photo-small">--%>
<%--                <a href="" class="tp"><img src="../img/RuiJin.png"></a>--%>
<%--                <p>中华苏维埃共和国临时中央政府</p>--%>
<%--            </div>--%>
        </div>
        <div id="morescene">
            <a href="">more</a>
        </div>
    </div>
</div>
<%@ include file="foot.jsp"%>
</body>
</html>
