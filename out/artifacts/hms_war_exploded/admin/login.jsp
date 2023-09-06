<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>Backend login</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/cookie.js"></script>

</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">Login</div>
        <div id="darkbannerwrap"></div>
        <form method="post" class="layui-form" >
            <input name="username" placeholder="Name"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="Password"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="Login" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(function  () {
            layui.use('form', function(){
                var form = layui.form;

                //监听提交
                form.on('submit(login)', function(data){
                    //登录成功跳转主页
                    var data=data.field;
                    debugger
                    $.ajax({
                        url:"<%=basePath%>loginServlet?flag=loginIn",
                        type:"post",
                        data:data,
                        success:function (result) {
                            debugger
                            console.log(result)
                            console.log(typeof(result) );
                            if(result.code==0){
                                layer.alert("Login successfully", {icon: 6},function () {
                                    location.href='<%=basePath%>admin/index.jsp'
                                });
                            }else{
                                layer.msg("Login failed, please try again")
                            }
                        }
                    });
                    return false;
                });
            });
        })


    </script>

    
    <!-- 底部结束 -->
</body>
</html>