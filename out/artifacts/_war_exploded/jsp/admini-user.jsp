<%@ page import="sqltable.Administer" %>
<%@ page import="sqltable.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-03
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link href="../css/admin-user.css" rel="stylesheet">
    <style>
        .off{
            color: #c5c5c5;
            cursor:default;
            pointer-events: none;
        }
        .active{

            color:black;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="../jsp/admin-header.jsp"%>
<%
    Administer admin=( Administer)application.getAttribute("administer");
    ArrayList<User> k=(ArrayList<User>)application.getAttribute("userArrayList");
%>
<div class="templatemo-content col-1 light-gray-bg">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="../jsp/admin-index.jsp">系统参数</a></li>
                    <li><a href="../adminTitle">文章管理</a></li>
                    <li><a href="../adminUser" class="active">用户管理</a></li>
                    <li><a href="../adminComment" >留言管理</a></li>
                    <li class="layui-nav-item" style="float: right;height:34px;"> <a href="#" style="border:0">欢迎您,<%=admin.getName()%></a></li>
                    <li class="layui-nav-item" style="float: right"><img src="../img/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="templatemo-content-container">
        <div class="templatemo-flex-row flex-content-row">
            <div class="col-1">
                <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                    <i class="fa fa-times"></i>
                    <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">红色圣地表</h2></div>
                    <div class="table-responsive">
                        <%--                            红色圣地--%>
                        <table class="table table-striped table-bordered">
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>用户名</td>
                                    <td>密码</td>
                                    <td>邮箱</td>
                                    <td>状态</td>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if(k!=null){
                                        Iterator<User> it=k.iterator();
                                        int i=0;
                                        while(it.hasNext() && i<10){
                                            User user =it.next();
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=user.getUsername()%></td>
                                    <td><%=user.getPassword()%></td>
                                    <td><%=user.getEmail()%></td>
                                    <span class="username" style="text-indent: -777777px;z-index: -7777; position: absolute"><%=user.getUsername()%></span>
                                    <%
                                        if(user.getState()==1){
                                    %>
                                    <td style="font-size: 14px;" >
                                        <a href="../userState?state=1&username=<%=user.getUsername()%>" style="margin-right: 5px;" class="off" onclick="Fn(this)">启用</a>
                                        <a href="../userState?state=2&username=<%=user.getUsername()%>" style="margin-right: 5px;" class="active" onclick="Fn2(this)">禁用</a>
                                    </td>
                                    <%
                                        }else if(user.getState()==2){
                                    %>
                                    <td style="font-size: 14px;" >
                                        <a href="../userState?state=1&username=<%=user.getUsername()%>" style="margin-right: 5px;" class="active" onclick="Fn(this)">启用</a>
                                        <a href="../userState?state=2&username=<%=user.getUsername()%>" style="margin-right: 5px;" class="off" onclick="Fn2(this)">禁用</a>
                                    </td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div> <!-- Second row ends -->

</div>
</body>
<script>
    // function Fn(that){
    //     // var num=that.parentNode.parentNode.firstElementChild.innerHTML-0;
    //     // var res=document.querySelectorAll(".active");
    //     // console.log(res);
    //     // res[num+1].className="off";
    //     // that.className="active";
    //     // window.loaction="../userState?"
    //     var username=document.querySelector(".username").innerHTML;
    //     if(that.className==="off") {
    //         that.className = "active";
    //         var next = that.nextElementSibling.className = "off";
    //
    //     }else if(that.className==="active"){
    //         that.className="off";
    //         var last=that.nextElementSibling.className="active";
    //     }
    //     // window.loaction="../userState?state=1&username="+username;
    //
    // }
    // function Fn2(that){
    //     var username=document.querySelector(".username").innerHTML;
    //     that.className="off";
    //     var last=that.previousElementSibling.className="active";
    //     // window.loaction="../userState?state=2&username="+username;
    // }
</script>
</html>
