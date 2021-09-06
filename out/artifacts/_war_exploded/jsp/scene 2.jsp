<%--
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
<%@ include file="/jsp/head.jsp"%>
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
<div id="recommend">
    <div id="recommend-con">
        <div id="recommend-title">
        <h2>热门推荐</h2>
            <span></span>
        </div>
        <div id="recommend-photo">
            <div class="photo-BY">
                <a href=""><img src="../img/BaYi2.jpeg">
                <p>南昌八一广场</p>
                </a>
            </div>
            <div class="photo-BY">
                <a href=""><img src="../img/RuiJin.jpeg">
                    <p>中华苏维埃共和国临时中央政府</p>
                </a>
            </div>
            <div class="photo-small">
                <a href="scene-jgsh.jsp" class="tp"><img src="../img/JingGangShan.png"></a>
                <p>井冈山革命根据地</p>
            </div>
            <div class="photo-small">
                <a href="" class="tp"><img src="../img/ShangRao.jpg"></a>
                <p>上饶集中营旧址</p>
            </div>
            <div class="photo-small">
                <a href="" class="tp"><img src="../img/RuiJin.png"></a>
                <p>中华苏维埃共和国临时中央政府</p>
            </div>
            <div class="photo-small">
                <a href="" class="tp"><img src="../img/RuiJin.png"></a>
                <p>中华苏维埃共和国临时中央政府</p>
            </div>
        </div>
        <div id="morescene">
            <a href="">more</a>
        </div>
    </div>
</div>
<%@ include file="/jsp/foot.jsp"%>
</body>
</html>
