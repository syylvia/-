<%@ page import="sqltable.Title" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.text.AttributedCharacterIterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-03
  Time: 00:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/bk.css" />
    <script src="../js/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="bg-grey">
    <div class="content">
        <a href="#">
            <h2 class="title">党史大百科</h2></a>
        <p class="subtitle">学习党史，发展红色文化</p>
        <div class="tab-block information-tab">
            <div class="tab-buttons ">
                <h3 class="tab-button cur" data-tab="one">最新头条</h3>
                <h3 class="tab-button" data-tab="two">党史展览</h3>
                <h3 class="tab-button" data-tab="three">党史力量<span class="question-icon"></span></h3>
            </div>
            <div class="tabs">
                <div class="tab-item active" id="tab-one">
                    <div class="information-tab">
                        <%
                            int i=-1;
                            int j=0;
                            ArrayList<Title> d=(ArrayList<Title>)application.getAttribute("bkArrayList");
                            ArrayList<Title> k=new ArrayList<Title>();
                            if(d!=null) {
                                Iterator<Title> it = d.iterator();
                                while (it.hasNext()) {
                                    Title title = it.next();
                                    k.add(title);
//                                    System.out.println(title.getNumber());
                                }
                            }

//                            System.out.println(k.size());
                            i++;
                            Title title=k.get(i);
                        %>
                        <div class="information-left">
<%--                            <a href="../bkSearch?id=<%=title.getNumber()%>">--%>
                                <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>" >
                                <img src="../img/党史动态.jpg" width="500" height="340">
                            </a>
                            <div class="left-bottom">

                                <div class="article-title"><%=title.getName()%></div>
                                <div class="article-time">
                                 <%=title.getDate()%>
                                </div>
                            </div>
                        </div>
                        <div class="information-right">
                            <div class="article-list current">
                                <%
//                                    k.remove(0);
                                    i++;
                                    title=k.get(i);
                                %>
                                <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>" class="article-link">
                                    <div class="article-head">
                                        <span class="article-number"><%=i%></span>
                                        <span class="article-title"><%=title.getName()%></span>
                                        <span class="article-time"><%=title.getDate()%></span>
                                    </div>
                                    <div class="article-content">
                                        <p><%=title.getDigest()%></p>
                                    </div>
                                </a>
                            </div>
                            <%
//                                k.remove(0);
                                while(i<4 && j==0){
                                    i++;
//                                    System.out.println(i+"zhidhiehdjkd");
                                    title=k.get(i);
//                                    System.out.println(title.getLb());
                                    if(title.getLb()!='2') {
                            %>
                            <div class="article-list">
                                <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>" class="article-link">
                                    <div class="article-head ">
                                        <span class="article-number"><%=i%></span>
                                        <span class="article-title"><%=title.getName()%></span>
                                        <span class="article-time"><%=title.getDate()%></span>
                                    </div>
                                    <div class="article-content">
                                        <p><%=title.getDigest()%></p>
                                    </div>
                                </a>
                            </div>
                            <%
//                                    k.remove(0);
                                }else
                                    {
                                        j=i;
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>


                <div class="tab-item" id="tab-two">
                    <div class="information-tab ">
                        <div class="information-left">
                            <%
                                int s=0;
                                if(k.size()>0){
                                    if(j==0){
                                        while(k.get(j).getLb()!='2'&&j< k.size()) { j++;s=j;}
                                    }
                                    s=j;
                                    title = k.get(s);
                            %>
                            <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>">
                                <img src="../img/党史展览.jpeg" width="500" height="340">
                            </a>

                            <div class="left-bottom">
                                <div class="article-title"><%=title.getName()%></div>
                                <div class="article-time">
                                  <%=title.getDate()%>
                                </div>
                            </div>
                        </div>

                        <div class="information-right">
                            <div class="article-list current">
                                <%
                                    k.remove(s);
                                    if(s<k.size()){
                                        title=k.get(s);
                                %>
                                <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>" class="article-link">
                                    <div class="article-head ">

                                        <span class="article-number">1</span>
                                        <span class="article-title"><%=title.getName()%></span>
                                        <span class="article-time"><%=title.getDate()%></span>
                                    </div>
                                    <div class="article-content">
                                        <p><%=title.getDigest()%></p>
                                    </div>
                                </a>
                                <%
                                        }
                                    k.remove(s);
                                %>
                            </div>

                            <%
                                int n=0;
                                while(s<k.size()&&n<4){
                                    title=k.get(s);
                                    n++;
                            %>
                            <div class="article-list ">
                                <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>" class="article-link">
                                    <div class="article-head ">

                                        <span class="article-number"><%=n%></span>
                                        <span class="article-title"><%=title.getName()%></span>
                                        <span class="article-time"><%=title.getDate()%></span>
                                    </div>
                                    <div class="article-content">
                                        <p><%=title.getDigest()%></p>
                                    </div>
                                </a>

                            </div>
                            <%
                                    k.remove(s);
                                }
                            %>

                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>

                <div class="tab-item" id="tab-three">
                    <div class="information-tab ">
                        <div class="information-left">
                            <%
                                if(k.size()>0) {
                                    while (i != 0) {
                                        k.remove(0);
                                        i--;
                                    }
                                }
                                if(k.size()>0) {
                                    title=k.get(0);
                            %>
                            <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>">
                                <img src="../img/党史力量.jpeg" width="500" height="340">
                            </a>
<%--                            <%--%>
<%--                                if(k.size()>0) {--%>
<%--                                    while (i != 0) {--%>
<%--                                        k.remove(0);--%>
<%--                                        i--;--%>
<%--                                    }--%>
<%--                                }--%>
<%--                                if(k.size()>0) {--%>
<%--                                    title=k.get(0);--%>
<%--                            %>--%>
                            <div class="left-bottom">
                                <div class="article-title"><%=title.getName()%></div>
                                <div class="article-time">
                                  <%=title.getDate()%>
                                </div>
                                <%
                                        k.remove(0);
                                    }
                                %>
                            </div>
                        </div>

                        <div class="information-right">
                            <div class="article-list current">
                                <%
                                   if(k.size()>0){
                                       title=k.get(0);
                                %>
                                <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>" class="article-link">
                                    <div class="article-head ">
                                        <span class="article-number">1</span>
                                        <span class="article-title"><%=title.getName()%></span>
                                        <span class="article-time"><%=title.getDate()%></span>
                                    </div>
                                    <div class="article-content">
                                        <p><%=title.getDigest()%></p>
                                    </div>
                                </a>
                                <%
                                    }
                                %>
                            </div>
                            <%
                                i=0;
                                k.remove(0);
                                while(k.size()>0 && i<4){
                                    title=k.get(0);
                            %>
                            <div class="article-list ">
                                <a href="../title?type=bk&id=<%=title.getNumber()%>&name=<%=title.getName()%>" class="article-link">
                                    <div class="article-head ">
                                        <span class="article-number"><%=i%></span>
                                        <span class="article-title"><%=title.getName()%>/</span>
                                        <span class="article-time"><%=title.getDate()%></span>
                                    </div>
                                    <div class="article-content">
                                        <p><%=title.getDigest()%></p>
                                    </div>
                                </a>
                            </div>
                            <%
                                k.remove(0);
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript">
    //tab切换
    $('.tab-button').click(function() {
        var tab = $(this).data('tab')
        $(this).addClass('cur').siblings('.tab-button').removeClass('cur');
        $('#tab-' + tab + '').addClass('active').siblings('.tab-item').removeClass('active');
    });
    //新闻列表切换
    $('.information-tab .article-list').hover(function() {
        $(this).addClass('current').siblings('.article-list').removeClass('current');
    }, function() {
        $(this).parent('.information-right').find('.article-list:first-of-type').addClass('current').siblings('.article-list').removeClass('current');
    });
</script>

</body>
</html>
