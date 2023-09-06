<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HMS</title>

    <!-- Google Font -->
<%--    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">--%>
<%--    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">--%>

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>


<!-- Header Section Begin -->
<jsp:include page="header.jsp" flush="true" />
<!-- Header End -->

<!-- Contact Section Begin -->
<section class="contact-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="contact-text">
                    <h2>Contact information</h2>
<%--                    <p>" "</p>--%>
                    <table>
                        <tbody>
                        <tr>
                            <td class="c-o">Address:</td>
                            <td>B15 1ET</td>
                        </tr>
                        <tr>
                            <td class="c-o">Phone:</td>
                            <td>010-111000000</td>
                        </tr>
                        <tr>
                            <td class="c-o">Email:</td>
                            <td>844299490@qq.com.com</td>
                        </tr>
                        <tr>
                            <td class="c-o">Fax:</td>
                            <td>+(44) 12345678</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>


            <div class="col-lg-7 offset-lg-1">
                <form class="layui-form contact-form">
                    <div class="row">
                        <div class="col-lg-6">
                            <input type="text" name="username" placeholder="Name*">
                        </div>
                        <div class="col-lg-6">
                            <input type="text" name="email" placeholder="Email*">
                        </div>
                        <div class="col-lg-12">
                            <textarea name="remark" placeholder="Your Review"></textarea>
                            <button  lay-filter="add" lay-submit="">submit</button>
                        </div>
                    </div>
                </form>


            </div>
        </div>

    </div>
</section>
<!-- Contact Section End -->

<!-- Footer Section Begin -->
<jsp:include page="foot.jsp" flush="true" />
<!-- Footer Section End -->
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        //监听提交
        form.on('submit(add)', function(data){
            var data=data.field;
            $.ajax({
                url:"reserveWebServlet?flag=saveComment",
                type:"post",
                data:data,
                success:function(result){
                    if(result.code==0){
                        layer.msg("The message is successful...")
                    }else{
                        //如果失败提示信息，不进行任何跳转
                        layer.msg("Sorry, message failed...")
                    }
                }
            })
            return false;
        });
    });
</script>


<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>