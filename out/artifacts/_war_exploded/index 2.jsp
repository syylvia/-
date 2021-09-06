<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-02-27
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <link href="//at.alicdn.com/t/font_2450522_oz2lxfhp1ye.css" rel="stylesheet">
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
              document.getElementById("timeShow").innerHTML = "<br><br>"+"&nbsp;&nbsp;"+y+"."+mm+"."+d+"<br><br>"+"&nbsp;&nbsp;"+weekday[day]+"<br><br>"+"&nbsp;&nbsp;"+h+":"+m+":"+s+"";;
              t = setTimeout(time,1000); //设定定时器，循环执行
          }
      </script>
      <link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  <body>

  <%@ include file="/head.jsp"%>
  <div class="background">
      <div id="timeShow" class="time1"></div>
      <div id="container">
          <div id="photo">
              <a href=""><img src="img/yx.jpg"></a>
              <a href=""><img src="img/fj.jpg"></a>
              <a href=""><img src="img/ys.jpg"></a>
              <a href=""><img src="img/gs.jpg"></a>
          </div>
      </div>
  </div>
  <div class="hero">
      <div class="heroWord">
          江西红色英雄</div>
      <ul class="StoryList">
          <li class="cl">
              <div class="imgs">
                  <a href="http://localhost:8080/Graduation-project/title?name=fangzhimin"><img src="img/FangZhiMing2.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="http://localhost:8080/Graduation-project/title?name=fangzhimin">方志敏</a>(1899-1935)
              </div>
              <div class="imgWord2">江西省上饶市弋阳县人</div>
          </li>
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/ZhengTianYu.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">曾天宇</a>(1896-1928)
              </div>
              <div class="imgWord2">江西省万安县人</div>
          </li>
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/YuanYuBing.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">袁玉冰</a>(1897-1927)
              </div>
              <div class="imgWord2">江西省兴国县人</div>
          </li>
      </ul>
  </div>
  <div class="hero">
      <div class="heroWord">
          江西红色圣地</div>
      <ul class="StoryList">
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/JingGangShan.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">烈士墓园</a>
              </div>
              <div class="imgWord2">位于江西井冈山</div>
          </li>
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/RuiJin.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">临时中央政府礼堂旧址</a>
              </div>
              <div class="imgWord2">位于江西瑞金</div>
          </li>
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/BaYi.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">南昌起义总指挥部旧址</a>
              </div>
              <div class="imgWord2">位于江西南昌</div>
          </li>
      </ul>
  </div>
  <div class="hero">
      <div class="heroWord">
          江西红色故事</div>
      <ul class="StoryList">
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/FangZhiMing.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">我把一切交给党--方志敏至死不渝的誓言</a>
              </div>
              <div class="imgWord2">中国江西网 2019-07-08</div>
          </li>
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/ZhangWang.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">红色恋歌——碧血伉俪张朝燮、王经燕烈士的家国情怀</a>
              </div>
              <div class="imgWord2">中国江西网 2019-07-08</div>
          </li>
          <li class="cl">
              <div class="imgWord1">
                  <a href="">八子参军 ——杨荣显老人的荣光和遗憾</a>
              </div>
              <div class="imgWord2">中国江西网 2019-07-08</div>
          </li>
      </ul>
  </div>
  <div class="hero">
      <div class="heroWord">
          江西红色艺术</div>
      <ul class="StoryList">
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/ShuYuan.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">庐山白鹿洞书院</a>
              </div>
              <div class="imgWord2">位于江西庐山</div>
          </li>
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/EHu.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">上饶鹅湖书院</a>
              </div>
              <div class="imgWord2">位于江西上饶</div>
          </li>
          <li class="cl">
              <div class="imgs">
                  <a href=""><img src="img/TaoChi.png"></a>
              </div>
              <div class="imgWord1">
                  <a href="">景德镇陶瓷</a>
              </div>
              <div class="imgWord2">位于江西景德镇</div>
          </li>
      </ul>
  </div>
<!引入尾部标签-->
<%@ include file="/foot.jsp"%>
  </body>
