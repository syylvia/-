<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-03-06
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="../css/register.css">
</head>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
    $(function () {
        //为指定的元素绑定事件
        //$("#id")  $(".className")
        $("#telCode").bind('click', show);

        function show() {
            //取到电话号码
            var telNum = document.getElementById("telephone");

            if(checkPhone()) {
                //使用ajax往后台传值
                var ha = $.ajax({
                    type: "POST",
                    url: "../Graduation-project/test",
                    data: "tel=" + telNum,
                    async: false
                }).responseText;
                //将返回的六位随机数验证码 赋到隐藏域
                $("#codeHidden").val(ha);
                //点击了获取验证码按钮之后一定时间内不能再点
                $("#telCode").unbind('click');
                //将获取验证码设置为销毁状态
                $("#telCode").addClass('disabled');
                //每次可以点击的时间间隔为5s 一般来说会设置成60s
                //定时器：每个一定的时间做某事(调用某个方法)
                var count = 60;
                var timer = setInterval(function () {
                    $("#telCode").html(count + "s后重发！");
                    count--;
                    if (count == 0) {
                        //清除定时器
                        clearInterval(timer);
                        //重新将文字内容恢复成获取验证码
                        $("#telCode").html("获取验证码!");
                        //清除销毁状态
                        $("#telCode").removeClass('disabled');
                        // //重新绑定事件处理
                        // $("#telCode").bind('click', show);
                    }
                }, 1000)
            }else{
                trip("tele_trip", "请输入手机号！");
            }
        }
    });
        $("#myForm").submit(function () {
            //比对验证码
            if ($("#inCodes").val() == ""){
                alert("请输入验证码！");
                return false;
            }
            if ($("#inCodes").val()==$("#codeHidden").val()){
                return true;
            }else {
                alert("验证码错误！");
                return false;
            }
        })
        function trip(obj, trip1) {
            document.getElementById(obj).innerHTML = "<p>"+ trip1+"</p>" ;
        }
    function checkPhone() {
        //获取用户名输入项
        var telephone = document.getElementById("telephone");
        var tele = telephone.value;
           var re=/^1[3-9]\d{9}$/;
           if(!re.test(tele)){
               trip("tele_trip", "手机号格式不正确");
            return false;
        }
        else{
            trip("tele_trip", "");
        }
        return true;
    }
    function checkPassword() {
        //密码长度大于6 和确认必须一致
        var password = document.getElementById("password");
        var userPass = password.value;
        if (userPass.length < 6) {
            trip("password_trip", "密码要>6位!!");
            return false;
        }
        else{
            trip("password_trip", "");
        }
        return true;
    }
    function checkSurePassword() {
        //获取确认密码框的值 var
        var password = document.getElementById("password");
        var userPass = password.value;
        var surePassword = document.getElementById("surePassword");
        var surePass = surePassword.value;
        if (userPass != surePass) {
            trip("surePassword_trip", "两次密码不一致!!");
            return false;
        }else{
            trip("surePassword_trip", "");
        }
        return true;
    }
    function checkForm() {
        var inputEmail = document.getElementById("email");
        var uEmail = inputEmail.value;
        if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/.test(uEmail)) {
            trip("emil_trip", "邮箱不合法!!");
            return false;
        }
        else{
            trip("emil_trip", "");
        }
        return true;
    }

    function submitT() {
        if (checkForm()) {
            return true;
        } else {
            return false;
        }
    }
</script>
<body>
<%@ include file="/jsp/head.jsp"%>
<div class="box">
    <form method="post" action="register"id="myForm">
        <input type="hidden" id="codeHidden" value="">
        <h2>注册</h2>
        <div class="inputBox">
            <input type="text" id="telephone" onblur="checkPhone()" name="telephone" required>
            <label class="lable1">用户名</label>
            <label id="tele_trip" class="lable2"></label>
        </div>
        <div class="inputBox">
            <input type="password" id="password" onblur="checkPassword()" name="password" required>
            <label class="lable1">密码</label>
            <label id="password_trip" class="lable2" ></label>
        </div>
        <div class="inputBox">
            <input type="password" id="surePassword"  name="surePassword" onblur="checkSurePassword()" required>
            <label class="lable1">确认密码</label>
            <label id="surePassword_trip" class="lable2" ></label>
        </div>
        <div class="inputBox">
            <input type="email" id="email" required>
            <label class="lable1">电子邮件</label>
            <label id="emil_trip" class="lable2" ></label>
        </div>

        <div class="inputBox">
            <input type="text" id="inCodes" class ="yanzhengma" required style="width: 70%;float: left">
            <label class="lable1">验证码</label>
            <label id="yanzheng_trip" class="lable2" ></label>
<%--            <input type="button" value="发送验证码" style="float: right;width: 30%" id="telCode">--%>
<%--            <div  id="telCode" style="float: right">获取验证码</div>--%>
        </div>
        <div class="submit1">
            <input type="submit" onblur="checkForm()" onclick="submitT()" value="注册">
        </div>
        <div class="word">
            <p>如果你已经有账户，请点击此处<a href="login.jsp">登陆</a></p>
        </div>
    </form>
</div>
<%@ include file="/jsp/foot.jsp"%>
</body>
</html>