<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>Management System</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script src="js/jquery-3.3.1.min.js"></script>
<%--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
<%--    <script type="text/javascript"src="https://cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.min.js"></script>--%>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/cookie.js"></script>
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect(basePath+"admin/login.jsp");
    }
%>

<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./index.html">Hotel Management</a></div>
    <div class="left_open">
        <i title="Expand left column" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${sessionScope.user.getUsername()}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="<%=basePath%>loginServlet?flag=out">Exit</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="<%=basePath%>index.jsp">Home Page</a></li>
    </ul>

</div>
<!-- 顶部结束 -->

<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<!--第一个-->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>Setting</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="TypeIndex.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>Type management</cite>
                        </a>
                    </li >
               <li>
                   <a _href="room/index.jsp">
                       <i class="iconfont">&#xe6a7;</i>
                       <cite>Room management</cite>
                   </a>
               </li >
                    <li>
                        <a _href="user/index.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>User management</cite>
                        </a>
                    </li >

                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>Business management</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="reserve/index.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>Booking management</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="check/index.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>Check-out management</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="comment/index.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>Comment management</cite>
                        </a>
                    </li >
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6ce;</i>
                    <cite>Statistic analysis</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="../roomServlet?flag=tongji">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>Room type statistics</cite>
                        </a>
                    </li >

                </ul>
            </li>

        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->

<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>My desktop</li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">Close this</dd>
                <dd data-type="other">Close other</dd>
                <dd data-type="all">Close all</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='TypeIndex.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->

<!-- 中部结束 -->

<!-- 底部开始 -->
<div class="footer">
    <div class="copyright"></div>
</div>
<!-- 底部结束 -->

</body>
</html>
