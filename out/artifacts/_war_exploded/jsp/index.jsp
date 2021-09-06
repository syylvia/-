<%@ page import="DB.DBuit" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="sqltable.Hero" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="sqltable.User" %><%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: yeyuxin--%>
<%--  Date: 2021-02-27--%>
<%--  Time: 15:51--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>江西红色在线</title>
    <link rel="icon" type="icon" href="../img/icon.ico">
    <link rel="stylesheet" type="text/css" href="../css/index1.css">
    <script language="javascript">
        var t = null;
        t = setTimeout(time,1000);//开始执行
        function time()
        {
            clearTimeout(t);//清除定时器
            dt = new Date();
            var y=dt.getYear()+1900;
            var mm=dt.getMonth()+1;
            var d=dt.getDate();
            var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
            var day=dt.getDay();
            var h=dt.getHours();
            var m=dt.getMinutes();
            var s=dt.getSeconds();
            if(h<10){h="0"+h;}
            if(m<10){m="0"+m;}
            if(s<10){s="0"+s;}
            document.getElementById("timeShow").innerHTML = "&nbsp;&nbsp;"+y+"."+mm+"."+d+"<br><br>"+"&nbsp;&nbsp;"+weekday[day]+"<br><br>"+"&nbsp;&nbsp;"+h+":"+m+":"+s+"";
            t = setTimeout(time,1000); //设定定时器，循环执行
        }
    </script>
</head>
<%
//    application.removeAttribute("user");
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
<%@ include file="head.jsp"%>
<div id="second">
<%--    <div class="timeShow" class="time1"></div>--%>
        <div id="container">
            <div id="photo">
                <a href="../search?type=hero"><img src="../img/yx.jpg"></a>
                <a href="../search?type=scene"><img src="../img/fj.jpg"></a>
                <a href="../search?type=inquire"><img src="../img/ys.jpg"></a>
                <a href="../search?type=story"><img src="../img/gs.jpg"></a>
            </div>
        </div>
</div>
<div id="hero">
    <div id="hero-con">
        <div id="hero-hero">
            <p>红色英雄</p>
        </div>
        <%
                if(i!=0&&i<4){
                    Iterator<Hero> it=hero.iterator();
                    while(it.hasNext()){
                        Hero hero1=it.next();
        %>
        <div class="hero1">
            <p class="title"><a href="http://localhost:8080/Graduation-project/title?type=hero&id=<%=hero1.getNumber()%>"><%=hero1.getName()%></a></p>
            <p class="introduce"><%=hero1.getDigest()%></p>
            <div class=more>
                <a href="http://localhost:8080/Graduation-project/title?type=hero&id=<%=hero1.getNumber()%>">more</a>
            </div>
        </div>
        <%
            }
            }else if(i>4||i==4){
                Iterator<Hero> it=hero.iterator();
                    for(int j=0;j<4;j++){
                        Hero hero1=it.next();
        %>
        <div class="hero1">
            <p class="title"><a href="http://localhost:8080/Graduation-project/title?type=hero&id=<%=hero1.getNumber()%>"><%=hero1.getName()%></a></p>
            <p class="introduce"><%=hero1.getDigest()%></p>
            <div class=more>
                <a href="http://localhost:8080/Graduation-project/title?type=hero&id=<%=hero1.getNumber()%>">more</a>
            </div>
        </div>
        <%
            }
            }
        %>
    </div>
</div>
<div id="scene">
    <div id="scene-con">
        <div id="scene-title">
            <p>红色圣地</p>
        </div>
        <div id="timeShow" class="time1"></div>
        <div id="scene-photo">
        </div>
        <div id="scene-word">
            <h4>第一个农村革命根据地</h4>
            <p>井冈山革命根据地是土地革命战争时期，中国共产党在湖南、江西两省边界罗霄山脉中段创建的第一个农村革命根据地。
            </p>
            <p>1927年10月，毛泽东率领湘赣边秋收起义的工农革命军到达罗霄山脉中段的井冈山地区，开展游击战争，进行土地革命，恢复和建立共产党的组织，建立革命政权和赤卫队。</p>
            <div id=scene-more>
                <a href="../search?type=scene">more</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="foot.jsp"%>
</body>
</html>

