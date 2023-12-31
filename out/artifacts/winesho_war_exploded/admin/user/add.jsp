<%@page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String basePath2=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
    <%--    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>admin/css/xadmin.css">
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>admin/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=basePath%>admin/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="identity" class="layui-form-label">
                <span class="x-red">*</span>account
            </label>
            <div class="layui-input-inline">
                <input type="text" id="identity" name="identity" required=""
                       autocomplete="off" class="layui-input">
            </div>

        </div>

        <div class="layui-form-item">
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>name
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="nickname" class="layui-form-label">
                <span class="x-red">*</span>username
            </label>
            <div class="layui-input-inline">
                <input type="text" id="nickname" name="nickname" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">gender</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <input type="checkbox" checked="" name="sex" lay-skin="switch" lay-filter="switchTest" lay-text="男|女">--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="layui-form-item">
            <label for="password" class="layui-form-label">
                <span class="x-red">*</span>password
            </label>
            <div class="layui-input-inline">
                <input type="password" id="password" name="password" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="tel" class="layui-form-label">
                <span class="x-red">*</span>phone number
            </label>
            <div class="layui-input-inline">
                <input type="text" id="tel" name="tel" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="x-red">*</span>e-mail
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                添加用户
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;



        //监听提交
        form.on('submit(add)', function(data){
            /*
               1、获取输入框的值信息
               2、通过ajax请求向后端发送请求
               3、根据响应反馈信息提示，并刷新主页
             */
            var data=data.field;

            debugger
            //
            if(data.sex=='ON'){
                data.sex="woman";
            }else{
                data.sex="man";
            }
           debugger
            $.ajax({
                url:"<%=basePath%>userServlet?flag=insert",
                type:"post",
                data:data,
                success:function(result){
                    if(result.code==0){
                        layer.alert("updated successfully", {icon: 6},function () {
                            //关闭当前frame
                            x_admin_close();
                            // 可以对父窗口进行刷新
                            x_admin_father_reload();
                        });
                    }else{
                        layer.msg("Sorry,update failed...")
                    }
                }
            })
            return false;
        });


    });
</script>

</body>

</html>