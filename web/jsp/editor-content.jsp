<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-04-20
  Time: 00:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>wangEditor DEMO</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!--引入 fontawesom-4.2.0-->
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">

    <!--引入wangEditor.css-->
    <link rel="stylesheet" type="text/css" href="../css/min.css">

    <style type="text/css">
        body{
            padding: 0px 10px 0px 10px;
            color:#333333;
        }
    </style>
</head>
<body>


<div id='txtDiv' style='border:1px solid #cccccc; height:240px;'>
    <p>请输入内容...</p>
</div>

<div style='margin-top:10px;'>
<%--    查看html--%>
    <button id='btnHtml'>提交</button>
<%--    <button id='btnText'>查看text</button>--%>
<%--    <button id='btnHide'>隐藏</button>--%>
    <textarea id='textarea' style='width:100%; height:100px; margin-top:10px;'></textarea>
</div>

<!--引入 jquery.js-->
<script src="../js/jquery-3.6.0.min.js" type="text/javascript"></script>

<!--引入 wangEditor.js-->
<script type="text/javascript" src='../js/wangEditor.js'></script>
<script type="text/javascript">
    $(function(){
        $('#spanTime').text((new Date()).toString());

        //一句话，即可把一个div 变为一个富文本框！o(∩_∩)o
        var $editor = $('#txtDiv').wangEditor();

        //显示 html / text
        var $textarea = $('#textarea'),
            $btnHtml = $('#btnHtml'),
            $btnText = $('#btnText'),
            $btnHide = $('#btnHide');
        $textarea.hide();
        $btnHtml.click(function(){
            $textarea.show();
            $textarea.val( $editor.html() );
        });
        $btnText.click(function(){
            $textarea.show();
            $textarea.val( $editor.text() );
        });
        $btnHide.click(function(){
            $textarea.hide();
        });
    });
</script>
</body>
</html>