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
    <title>Sona Dream hotel</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

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

<!-- Hero Section Begin -->
<section class="hero-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="hero-text">
                    <h1>Dream hotel</h1>
                    <p>The best local hotel.....</p>
                    <a href="#" class="primary-btn">Now</a>
                </div>
            </div>
            <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                <div class="booking-form">
                    <h3>hotel information</h3>
                    <form class="layui-form">
                        <div class="check-date">
                            <label >Reservation number: </label>
                            <input type="text" name="idCard">

                        </div>
                        <div class="check-date">
                            <label >Contact: </label>
                            <input type="text" name="tel" >

                        </div>
                        <button class="layui-btn" lay-filter="query" lay-submit="">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="hero-slider owl-carousel">
        <div class="hs-item set-bg" data-setbg="img/hero/hero-1.jpg"></div>
        <div class="hs-item set-bg" data-setbg="img/hero/hero-2.jpg"></div>
        <div class="hs-item set-bg" data-setbg="img/hero/hero-3.jpg"></div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Services Section End -->
<section class="services-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <span>Our services</span>
                    <h2>More services</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-6">
                <div class="service-item">
                    <i class="flaticon-036-parking"></i>
                    <h4>Travel plan</h4>
                    <p><strong>Discover the essence of travel with our carefully curated travel plans. Whether you're an explorer seeking new adventures or a leisure traveler looking for relaxation, our travel plans offer you the perfect blend of experiences. </strong></p>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="service-item">
                    <i class="flaticon-033-dinner"></i>
                    <h4>Banquet service</h4>
                    <p>Elevate your events with our exquisite banquet services. From weddings to corporate gatherings, our dedicated team ensures that every detail is meticulously planned and executed. With customizable menus, elegant decor, and impeccable service, your event will be a truly memorable affair.</p>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="service-item">
                    <i class="flaticon-026-bed"></i>
                    <h4>Baby-watching</h4>
                    <p>Enjoy a worry-free stay with our specialized baby-watching service. We understand the importance of caring for your little ones. Our trained staff will provide nurturing care for your babies, allowing you to relax and enjoy your time at our hotel, knowing that your child is in safe hands..</p>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="service-item">
                    <i class="flaticon-024-towel"></i>
                    <h4>Laundry</h4>
                    <p>Enjoy a worry-free stay with our specialized baby-watching service. We understand the importance of caring for your little ones. Our trained staff will provide nurturing care for your babies, allowing you to relax and enjoy your time at our hotel, knowing that your child is in safe hands.</p>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="service-item">
                    <i class="flaticon-044-clock-1"></i>
                    <h4>Driver</h4>
                    <p>Whether you're arriving from the airport or exploring the city, our chauffeur service offers a seamless and comfortable ride. Our drivers are familiar with the local area, ensuring you arrive at your destination safely and on schedule.</p>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="service-item">
                    <i class="flaticon-012-cocktail"></i>
                    <h4>Bar&Restaurant</h4>
                    <p>Unwind and socialize at our vibrant bar. Indulge in expertly crafted cocktails, fine wines, and a selection of beverages in a chic and inviting atmosphere. Whether it's a quiet evening or a lively night out, our bar is the perfect place to enjoy a drink and good company.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Services Section End -->

<!-- Home Room Section Begin -->
<%--<section class="hp-room-section">--%>
<%--    <div class="container-fluid">--%>
<%--        <div class="hp-room-items">--%>
<%--            <div class="row">--%>

<%--                <c:forEach items="${list}" var="room">--%>
<%--                <div class="col-lg-3 col-md-6">--%>
<%--                    <div class="hp-room-item set-bg" data-setbg="<%=basePath%>${room.img}">--%>
<%--                        <div class="hr-text">--%>
<%--                            <h3>${room.type_name}</h3>--%>
<%--                            <h2>${room.price}$<span>/per night</span></h2>--%>
<%--                            <table>--%>
<%--                                <tbody>--%>
<%--                                <tr>--%>
<%--                                    <td class="r-o">size:</td>--%>
<%--                                    <td>${room.area} feet</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td class="r-o">counts:</td>--%>
<%--                                    <td>Maximum number${room.counts}</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td class="r-o">bed:</td>--%>
<%--                                    <td>${room.bed}</td>--%>
<%--                                </tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                            <a href="#" class="primary-btn">booking</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                </c:forEach>--%>


<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Home Room Section End -->

<!-- Testimonial Section Begin -->



<!-- Footer Section Begin -->
<jsp:include page="foot.jsp" flush="true" />
<!-- Footer Section End -->

<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        //监听提交
        form.on('submit(query)', function(data){
            var data=data.field;
            $.ajax({
                url:"indexServlet?flag=query",
                type:"post",
                data:data,
                success:function(result){
                    if(result.code==0){
                        layer.msg("There is a reservation record. Your room number is"+result.msg)
                    }else{
                        layer.msg("Sorry, no reservation information...")
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