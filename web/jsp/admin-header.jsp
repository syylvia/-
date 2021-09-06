<%--
  Created by IntelliJ IDEA.
  User: yeyuxin
  Date: 2021-05-01
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员界面</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

<%--    <link href='../css/fonts.css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>--%>
    <link href="../css/font-awesome.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/admin-header.css" rel="stylesheet">

</head>
<body>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"><img src="../img/icon.png" style="width: 100%"></div>
          <h1>江西红色在线</h1>
        </header>
        <div class="profile-photo-container">
          <img src="../img/4.png" alt="Profile Photo" class="img-responsive">
          <div class="profile-photo-overlay"></div>
        </div>
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
          <ul>
            <li><a href="#" class="active"><i class="fa fa-home fa-fw"></i>首页</a></li>
            <li><a href="../adminModule?type=hero"><i class="fa fa-bar-chart fa-fw"></i>红色英雄</a></li>
            <li><a href="../adminModule?type=scene"><i class="fa fa-database fa-fw"></i>红色圣地</a></li>
            <li><a href="../adminModule?type=bk"><i class="fa fa-map-marker fa-fw"></i>党史大百科</a></li>
            <li><a href="../adminModule?type=inquire"><i class="fa fa-users fa-fw"></i>红色寻访</a></li>
            <li><a href="../adminModule?type=story"><i class="fa fa-sliders fa-fw"></i>红色故事</a></li>
              <li><a href="../jsp/login.jsp"><i class="fa fa-eject fa-fw"></i>退出登陆</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
<%--      <div class="templatemo-content col-1 light-gray-bg">--%>
<%--        <div class="templatemo-top-nav-container">--%>
<%--          <div class="row">--%>
<%--            <nav class="templatemo-top-nav col-lg-12 col-md-12">--%>
<%--              <ul class="text-uppercase">--%>
<%--                <li><a href="" class="active">系统参数</a></li>--%>
<%--                <li><a href="">文章管理</a></li>--%>
<%--                <li><a href="">用户管理</a></li>--%>
<%--                <li><a href="反馈管理">留言管理</a></li>--%>
<%--              </ul>--%>
<%--            </nav>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="templatemo-content-container">--%>
<%--          <div class="templatemo-flex-row flex-content-row">--%>
<%--            <div class="templatemo-content-widget white-bg col-2">--%>
<%--              <i class="fa fa-times"></i>--%>
<%--              <div class="square"></div>--%>
<%--              <h2 class="templatemo-inline-block">Visual Admin Template</h2><hr>--%>
<%--              <p>Works on all major browsers. IE 10+. Visual Admin is <a href="#">free responsive admin template</a> for everyone. Feel free to use this template for your backend user interfaces. Please tell your friends about <a >templatemo.com</a> website. You may <a>contact us</a> if you have anything to say.</p>--%>
<%--              <p>Nunc placerat purus eu tincidunt consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur. Fusce mi lacus, semper sit amet mattis eu.</p>--%>
<%--            </div>--%>
<%--            <div class="templatemo-content-widget white-bg col-1 text-center">--%>
<%--              <i class="fa fa-times"></i>--%>
<%--              <h2 class="text-uppercase">Maris</h2>--%>
<%--              <h3 class="text-uppercase margin-bottom-10">Design Project</h3>--%>
<%--              <img src="images/bicycle.jpg" alt="Bicycle" class="img-circle img-thumbnail">--%>
<%--            </div>--%>
<%--            <div class="templatemo-content-widget white-bg col-1">--%>
<%--              <i class="fa fa-times"></i>--%>
<%--              <h2 class="text-uppercase">Dictum</h2>--%>
<%--              <h3 class="text-uppercase">Sedvel Erat Non</h3><hr>--%>
<%--              <div class="progress">--%>
<%--                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>--%>
<%--              </div>--%>
<%--              <div class="progress">--%>
<%--                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>--%>
<%--              </div>--%>
<%--              <div class="progress">--%>
<%--                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="templatemo-flex-row flex-content-row">--%>
<%--            <div class="col-1">--%>
<%--              <div class="templatemo-content-widget orange-bg">--%>
<%--                <i class="fa fa-times"></i>--%>
<%--                <div class="media">--%>
<%--                  <div class="media-left">--%>
<%--                    <a href="#">--%>
<%--                      <img class="media-object img-circle" src="images/sunset.jpg" alt="Sunset">--%>
<%--                    </a>--%>
<%--                  </div>--%>
<%--                  <div class="media-body">--%>
<%--                    <h2 class="media-heading text-uppercase">Consectur Fusce Enim</h2>--%>
<%--                    <p>Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur.</p>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <div class="templatemo-content-widget white-bg">--%>
<%--                <i class="fa fa-times"></i>--%>
<%--                <div class="media">--%>
<%--                  <div class="media-left">--%>
<%--                    <a href="#">--%>
<%--                      <img class="media-object img-circle" src="images/sunset.jpg" alt="Sunset">--%>
<%--                    </a>--%>
<%--                  </div>--%>
<%--                  <div class="media-body">--%>
<%--                    <h2 class="media-heading text-uppercase">Consectur Fusce Enim</h2>--%>
<%--                    <p>Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur.</p>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            <div class="col-1">--%>
<%--              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">--%>
<%--                <i class="fa fa-times"></i>--%>
<%--                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">User Table</h2></div>--%>
<%--                <div class="table-responsive">--%>
<%--                  <table class="table table-striped table-bordered">--%>
<%--                    <thead>--%>
<%--                      <tr>--%>
<%--                        <td>No.</td>--%>
<%--                        <td>First Name</td>--%>
<%--                        <td>Last Name</td>--%>
<%--                        <td>Username</td>--%>
<%--                      </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                      <tr>--%>
<%--                        <td>1.</td>--%>
<%--                        <td>John</td>--%>
<%--                        <td>Smith</td>--%>
<%--                        <td>@jS</td>--%>
<%--                      </tr>--%>
<%--                      <tr>--%>
<%--                        <td>2.</td>--%>
<%--                        <td>Bill</td>--%>
<%--                        <td>Jones</td>--%>
<%--                        <td>@bJ</td>--%>
<%--                      </tr>--%>
<%--                      <tr>--%>
<%--                        <td>3.</td>--%>
<%--                        <td>Mary</td>--%>
<%--                        <td>James</td>--%>
<%--                        <td>@mJ</td>--%>
<%--                      </tr>--%>
<%--                      <tr>--%>
<%--                        <td>4.</td>--%>
<%--                        <td>Steve</td>--%>
<%--                        <td>Bride</td>--%>
<%--                        <td>@sB</td>--%>
<%--                      </tr>--%>
<%--                      <tr>--%>
<%--                        <td>5.</td>--%>
<%--                        <td>Paul</td>--%>
<%--                        <td>Richard</td>--%>
<%--                        <td>@pR</td>--%>
<%--                      </tr>--%>
<%--                    </tbody>--%>
<%--                  </table>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div> <!-- Second row ends -->--%>
<%--          <div class="copyrights">Collect from</div>--%>
<%--          <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->--%>
<%--            <div class="col-1 templatemo-overflow-hidden">--%>
<%--              <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">--%>
<%--                <i class="fa fa-times"></i>--%>
<%--                <div class="templatemo-flex-row flex-content-row">--%>
<%--                  <div class="col-1 col-lg-6 col-md-12">--%>
<%--                    <h2 class="text-center">Modular<span class="badge">new</span></h2>--%>
<%--                    <div id="pie_chart_div" class="templatemo-chart"></div> <!-- Pie chart div -->--%>
<%--                  </div>--%>
<%--                  <div class="col-1 col-lg-6 col-md-12">--%>
<%--                    <h2 class="text-center">Interactive<span class="badge">new</span></h2>--%>
<%--                    <div id="bar_chart_div" class="templatemo-chart"></div> <!-- Bar chart div -->--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>

    <!-- JS -->
    <script src="../js/jquery-3.6.0.min.js"></script>      <!-- jQuery -->
    <script src="../js/jquery-migrate.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script type="text/javascript" src="../js/templatemo.js"></script>      <!-- Templatemo Script -->
        <script>
            function dj(that){
                var s=document.getElementsByClassName('active')[0];
                s.className="no";
                this.className="active";
            }
        </script>
  </body>
</html>
