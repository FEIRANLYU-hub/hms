<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Booking Online/Sona Dream Hotel</title>

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
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<jsp:include page="header.jsp" flush="true" />
<!-- Header End -->

<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <h2>Rooms</h2>
                    <div class="bt-option">
                        <a href="./home.html">Home</a>
                        <span>rooms</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Rooms Section Begin -->
<section class="rooms-section spad">
    <div class="container">
        <div class="row">



      <c:forEach items="${list}" var="room">
            <div class="col-lg-4 col-md-6">
                <div class="room-item">

<%--                    <img src="<%=basePath%>${room.img}" width="430px" height="270px" alt="tup">--%>
    <img src="${room.img}" width="430px" height="270px" alt="tup">

                <%--    <img src="jetbrains://idea/navigate/reference?project=wineshop&path=img/room/room-1.jpg" width="430px" height="270px" alt="web/img/room/room-1.jpg">--%>
<%--    <img src="img/room/room-1.jpeg" width="430px" height="270px" alt="">--%>

    <div class="ri-text">
                        <h4>${room.type_name}</h4>
                        <h3>${room.price} Pound<span> / day</span></h3>
                        <table>
                            <tbody>
<%--                            <tr>--%>
<%--                                <td class="r-o">size:</td>--%>
<%--                                <td>${room.area} feet</td>--%>
<%--                            </tr>--%>
                            <tr>
                                <td class="r-o">Maximum:</td>
                                <td>${room.counts} people</td>
                            </tr>
                            <tr>
                                <td class="r-o">Bed:</td>
                                <td>${room.bed}</td>
                            </tr>
                            <tr>
                                <td class="r-o">Services:</td>
                                <td>
                                        ${fn:substring(room.remark, 0, 10)}...
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <a href="reserveWebServlet?flag=queryById&id=${room.id}" class="primary-btn">Details</a>
                    </div>
                </div>
            </div>
      </c:forEach>

<%--    <div class="col-lg-4 col-md-6">--%>
<%--        <div class="room-item">--%>
<%--            &lt;%&ndash;                    <img src="<%=basePath%>${room.img}" width="430px" height="270px" alt="">&ndash;%&gt;--%>
<%--            &lt;%&ndash;    <img src="jetbrains://idea/navigate/reference?project=wineshop&path=img/room/room-1.jpg" width="430px" height="270px" alt="web/img/room/room-1.jpg">&ndash;%&gt;--%>
<%--            <img src="img/room/room-3.jpg" width="430px" height="270px" alt="web/img/room/room-3.jpg">--%>

<%--            <div class="ri-text">--%>
<%--                <h4>Single room</h4>--%>
<%--                <h3> 120 Pound<span>/day</span></h3>--%>
<%--                <table>--%>
<%--                    <tbody>--%>
<%--                    &lt;%&ndash;                            <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <td class="r-o">size:</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <td>${room.area} feet</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </tr>&ndash;%&gt;--%>
<%--                    <tr>--%>
<%--                        <td class="r-o">Maximum:</td>--%>
<%--                        <td> 1 people</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td class="r-o">Bed:</td>--%>
<%--                        <td> 1 </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td class="r-o">Reviews:</td>--%>
<%--                        <td>--%>
<%--                            ${fn:substring(room.remark, 0, 10)}...--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--                <a href="reserveWebServlet?flag=queryById&id=1" class="primary-btn">Details</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>


        </div>
    </div>
</section>
<!-- Rooms Section End -->

<!-- Footer Section Begin -->
<jsp:include page="foot.jsp" flush="true" />
<!-- Footer Section End -->

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
