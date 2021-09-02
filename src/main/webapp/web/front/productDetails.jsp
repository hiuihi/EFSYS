
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>商品详情</title>

    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../other/css/other.css" rel="stylesheet">

    <link href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">

    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/confirm/css/xcConfirm.css" rel="stylesheet" type="text/css" />
    <link href="../jqueryPlug/jqueryTpck/css/swiper.min.css" rel="stylesheet" type="text/css" />
    <link href="../jqueryPlug/jqueryTpck/css/app.css" type="text/css" rel="stylesheet" >


    <style>


    </style>
</head>

<body>

<!-- 头部 -->
<header class="header-area">
    <div class="main-header d-none d-lg-block">
        <div class="header-main-area sticky">
            <div class="container">
                <div class="row align-items-center position-relative">
                    <!-- logo -->
                    <div class="col-lg-3" >
                        <div class="logo">
                            <a href="../main/showIndex.do"><h3>食用菌商城</h3>
                                <!-- <img src="assets/img/logo/logo.png" alt=""> -->
                            </a>
                        </div>
                    </div>
                    <!-- 搜索框 -->
                    <div class="col-lg-6 position-static">
                        <div class="main-menu-area">
                            <div class="main-menu">
                                <form class="form-inline" >
                                    <div class="search" style="visibility:hidden;">
                                        <input type="text" name="" id="" value=""/>
                                        <button type="submit">搜索</button>
                                    </div>
                                </form>
                                <!-- <li><a href="index.html">Home</a></li>
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="productDetails.html">Product Details</a></li> -->
                            </div>
                        </div>
                    </div>

                    <!-- 右部图标 -->
                    <div class="col-lg-3" >
                        <div class="header-configure-wrapper">
                            <div class="header-configure-area">
                                <ul class="nav justify-content-end">
                                    <!-- <li>
                                        <a href="#" class="offcanvas-btn">
                                            <i class="lnr lnr-magnifier"></i>
                                        </a>
                                    </li> -->
                                    <li class="user-hover">
                                        <a href="../account/showAccount.do">
                                            <i class="fa fa-user"></i>
                                        </a>
                                        <ul class="dropdown-list">
                                            <li><a href="../account/showOrders.do">我的订单</a></li>
                                            <li><a href="../account/showAddress.do">我的地址</a></li>
                                            <li><a href="../user/showLogin.do">退出</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="../account/showCollect.do">
                                            <!-- <i class="lnr lnr-heart"></i> -->
                                            <i class="fa fa-heart"></i>
                                            <!-- <div class="notification">0</div> -->
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../cart/showCart.do" class="minicart-btn">
                                            <!-- <i class="lnr lnr-cart"></i> -->
                                            <i class="fa fa-shopping-cart"></i>
                                            <!-- <div class="notification">2</div> -->
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 头部悬浮-->
    <div class="mobile-header d-lg-none d-md-block sticky">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="mobile-main-header" >
                        <!-- logo -->
                        <div class="mobile-logo">
                            <a href="../main/showIndex.do"><h3>食用菌商城</h3>
                                <!-- <img src="assets/img/logo/logo.png" alt="Brand Logo"> -->
                            </a>
                        </div>
                        <!-- 搜索框 -->
                        <div class="mobile-menu-toggler" style="width: 100%">
                            <form class="form-inline" style="width: 100%">
                                <div class="search" style="visibility:hidden;">
                                    <input type="text" name=""  value=""/>
                                    <button type="submit">搜索</button>
                                </div>
                            </form>
                        </div>
                        <!-- 右部图标 -->
                        <div class="mobile-menu-toggler" >
                            <div class="mini-cart-wrap">
                                <a href="../account/showAccount.do">
                                    <i class="fa fa-user"></i>
                                </a>
                            </div>
                            <div class="mini-cart-wrap">
                                <a href="../cart/showCart.do">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<main>
    <!-- 标题 -->
    <div class="breadcrumb-area common-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <h1>详情</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">商品详情</li>--%>
<%--                            </ul>--%>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="shop-main-wrapper section-space">
        <div class="container">
            <div class="row">

                <div class="col-lg-12 order-1 order-lg-2">

                    <div class="productDetails-inner">
                        <div class="row">
                            <!-- 左侧图片 -->
                            <div class="col-lg-5">
                                <!-- 大图 -->
                                <div class="product-large-slider">
                                    <c:forTokens items="${goods.pic}" begin="1"  delims="," var="picc" >
                                        <c:forTokens items="${goods.pic}" begin="0"  end="0" delims="," var="pi" >
                                            <div class="pro-large-img img-zoom">
                                                <img src="..${pi}${picc} " alt="" />
                                            </div>
                                        </c:forTokens>
                                    </c:forTokens>
                                 </div>
                                <!-- 小图 -->
                                <div class="pro-nav slick-row-10 slick-arrow-style">
                                    <c:forTokens items="${goods.pic}" begin="1"  delims="," var="picc" >
                                        <c:forTokens items="${goods.pic}" begin="0"  end="0" delims="," var="pi" >
                                            <div class="pro-nav-thumb">
                                                <img src="..${pi}${picc}" alt="product-details" />
                                            </div>
                                        </c:forTokens>
                                    </c:forTokens>

                                </div>
                            </div>
                            <!-- 右侧 -->
                            <div class="col-lg-7">
                                <div class="product-details-des">
                                    <h3 class="product-name">${goods.goodsName}</h3>
                                    <div class="ratings d-flex">
                                        <c:choose>
                                            <c:when test="${goods.grade==5}">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </c:when>
                                            <c:when test="${goods.grade==4}">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </c:when>
                                            <c:when test="${goods.grade==3}">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </c:when>
                                            <c:when test="${goods.grade==2}">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </c:when>
                                            <c:when test="${goods.grade==1}">
                                                <span><i class="fa fa-star"></i></span>
                                            </c:when>
                                            <c:otherwise>

                                            </c:otherwise>
                                        </c:choose>
<%--                                        <span><i class="fa fa-star"></i></span>--%>
<%--                                        <span><i class="fa fa-star-half-empty"></i></span>--%>
<%--                                        <span><i class="fa fa-star-half"></i></span>--%>
<%--                                        <span><i class="fa fa-star-half-full"></i></span>--%>
<%--                                        <span><i class="fa fa-star-half-o"></i></span>--%>
<%--                                        <span><i class="fa fa-star-o"></i></span>--%>
                                        <div class="pro-review">
                                            <span>${count}评论</span>
                                        </div>
                                    </div>
                                    <div class="price-box">
                                        <c:choose>
                                            <c:when test="${goods.promotionPrice!=0 && goods.discountStatus==1}">
                                                <span class="price-regular">￥${goods.promotionPrice}</span>
                                                <span class="price-old"><del>￥${goods.price}</del></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="price-regular">￥${goods.price}</span>
                                            </c:otherwise>
                                        </c:choose>
<%--                                        <span class="price-regular">￥70.00</span>--%>
<%--                                        <span class="price-old"><del>￥90.00</del></span>--%>
                                    </div>

                                    <c:if test="${goods.discountStatus==1}">
                                        <c:if test="${not empty goods.promotionEndTime}">
                                            <h5 class="offer-text"><strong>赶快</strong>! 优惠结束:</h5>
                                            <div class="product-countdown" data-countdown="<fmt:formatDate value="${goods.promotionEndTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>"></div>
<%--                                            <div class="product-countdown" data-countdown="2021/07/25"></div>--%>
                                        </c:if>
                                    </c:if>
                                    <div class="availability">
                                        <i class="fa fa-check-circle"></i>
                                        <span>库存${goods.stock}件</span>
                                    </div>
                                    <p class="pro-desc">
                                        ${goods.title}
                                    </p>
                                    <div class="quantity-cart-box d-flex align-items-center">
                                        <h5>数量:</h5>
                                        <div class="quantity">
                                            <div class="pro-qty"><input type="text" value="1" id="input_quantity"></div>
                                        </div>
                                        <div class="action_link">
                                            <a class="btn btn-cart2" href="javascript:void(0)" id="add_cart" onclick="add_cart(${goods.goodsId})">添加到购物车</a>
                                            <a href="javascript:void(0)" class="a_desire" onclick="add_collect(${goods.goodsId})"><i class="fa fa-heart" ></i></a>
                                        </div>
                                    </div>
                                    <div class="pro-size">
                                        <h5>规格 :</h5>
                                        <select class="nice-select">
                                            <c:forTokens items="${goods.spec}" delims="," var="spec" >
                                                <option value="${spec}">${spec}</option>
                                            </c:forTokens>
                                        </select>
                                    </div>
                                    <!--重-->
                                    <div class="color-option">
                                        <h5>重量 : ${goods.weight}${goods.unit}</h5>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- 详情-->
                    <div class="product-details-reviews section-space pb-0">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="product-review-info">
                                    <ul class="nav review-tab">
                                        <li>
                                            <a class="active" data-toggle="tab" href="#tab_one">描述</a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#tab_two">信息</a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#tab_three">评论 (${count})</a>
                                        </li>
                                    </ul>
                                    <!-- 描述 -->
                                    <div class="tab-content reviews-tab">
                                        <div class="tab-pane fade show active" id="tab_one">
                                            <div class="tab-one">
                                                <p>
                                                    ${goods.title}</p>
                                                    <c:forTokens items="${goods.albumPics}" begin="1"  delims="," var="picc" >
                                                        <c:forTokens items="${goods.albumPics}" begin="0"  end="0" delims="," var="pi" >
                                                            <img src="..${pi}${picc}" />
                                                        </c:forTokens>
                                                    </c:forTokens>

                                            </div>
                                        </div>
                                        <!-- 信息 -->
                                        <div class="tab-pane fade" id="tab_two">
                                            <table class="table table-bordered">
                                                <tbody>
<%--                                                <tr>--%>
<%--                                                    <td>颜色</td>--%>
<%--                                                    <td>黑, 蓝, 红</td>--%>
<%--                                                </tr>--%>
                                                <tr>
                                                    <td>规格</td>
                                                    <td> ${goods.spec}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- 评论 -->
                                        <div class="tab-pane fade" id="tab_three">
                                            <form action="#" class="review-form">
                                                <h5>${count}条 <span>评论 </span></h5>
                                                <c:forEach items="${comments}" var="comment">
                                                    <div class="total-reviews">
                                                        <div class="rev-avatar">
                                                            <img src="..${comment.userIcon}" alt="">
                                                        </div>
                                                        <div class="review-box">
                                                            <div class="ratings">
                                                                <c:choose>
                                                                    <c:when test="${comment.rating==5}">
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                    </c:when>
                                                                    <c:when test="${comment.rating==4}">
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                    </c:when>
                                                                    <c:when test="${comment.rating==3}">
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                    </c:when>
                                                                    <c:when test="${comment.rating==2}">
                                                                        <span><i class="fa fa-star"></i></span>
                                                                        <span><i class="fa fa-star"></i></span>
                                                                    </c:when>
                                                                    <c:when test="${comment.rating==1}">
                                                                        <span><i class="fa fa-star"></i></span>
                                                                    </c:when>
                                                                    <c:otherwise>

                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="post-author">
                                                                <p><span>
                                                                    <c:choose>
                                                                        <c:when test="${comment.isAnonymous==1}">
                                                                           匿名
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            ${fn:substring(comment.userId,0,1)}***
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    ---</span> <fmt:formatDate value="${comment.commentTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                                </p>
                                                            </div>
                                                            <div class="list">
                                                                <div class="post">
                                                                    <c:if test="${not empty comment.pics}">
                                                                        <c:choose>
                                                                            <c:when test="${fn:contains(comment.pics,',')}">
                                                                                <c:forTokens items="${comment.pics}" begin="1"  delims="," var="picc" >
                                                                                    <c:forTokens items="${comment.pics}" begin="0"  end="0" delims="," var="pic" >
                                                                                        <img class="list-img" src="..${pic}${picc} " >
                                                                                    </c:forTokens>
                                                                                </c:forTokens>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <img class="list-img" src="..${comment.pics}" >
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:if>
                                                                </div>
                                                            </div>
<%--                                                            <div class="big_img">--%>
<%--                                                                <div class="swiper-container2">--%>
<%--                                                                    <div class="swiper-wrapper"> </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
                                                            <p>
                                                               ${comment.content}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <div class="big_img">
        <div class="swiper-container2">
            <div class="swiper-wrapper"> </div>
        </div>
    </div>
    <!-- 折扣商品 -->
    <section class="product spad">
        <div class="container">

            <div class="product__discount">
                <div class="section-title product__discount__title" style="text-align: center;">
                    <h2 style="margin:0 auto">折扣商品</h2>
                </div>
                <div class="row">
                    <div class="product__discount__slider owl-carousel">
                        <c:forEach items="${goodslist}" var="list">
                            <c:if test="${list.promotionPrice!=0 && list.discountStatus==1}">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                             data-setbg="..${list.icon}">
                                            <div class="product__discount__percent">
                                                -<fmt:parseNumber value="${(list.price-list.promotionPrice)/list.price*100}" integerOnly="true"/>%
                                            </div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart" onclick="add_collect(${list.goodsId})" title="收   藏" data-toggle="tooltip" data-placement="top"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart" onclick="add_cart(${list.goodsId})" title="加入购物车" data-toggle="tooltip" data-placement="top"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <!-- 类别 -->
                                                <%--                                        <span>生鲜</span>--%>
                                            <h5><a href="../goods/showGoodsDetails.do?gid=${list.goodsId}">${list.goodsName}</a></h5>
                                            <div class="product__item__price">￥${list.promotionPrice} <span>￥${list.price}</span></div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
    </section>

</main>

<!-- 页脚 -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="javascript:void(0)"><h5>食用菌商城</h5></a>
                    </div>
                    <ul>
                        <li>地址: 浙江省丽水市庆元县</li>
                        <li>电话: (0578) 3746 7377 3777</li>
                        <li>邮箱: 123456789@qq.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>支付方式</h6>
                    <ul>
                        <li><a href="javascript:void(0)">货到付款</a></li>
                        <li><a href="javascript:void(0)">在线支付</a></li>
                        <li><a href="javascript:void(0)">分期付款</a></li>
                        <li><a href="javascript:void(0)">快捷支付</a></li>
                    </ul>

                </div>
            </div>
            <div class="col-lg-2 col-md-12">
                <div class="footer__widget">
                    <h6>购物指南</h6>
                    <ul>
                        <li><a href="javascript:void(0)">购物流程</a></li>
                        <li><a href="javascript:void(0)">生活旅游</a></li>
                        <li><a href="javascript:void(0)">常见问题 </a></li>
                        <li><a href="javascript:void(0)">价格保护</a></li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright" >
                    <div class="footer__copyright__text" >
                        <p>© Edible fungus 食用菌商城</p>
                    </div>

                </div>
            </div>
        </div>
    </div>
</footer>


<!-- 滚动到顶部 -->
<div class="scroll-top not-visible">
    <i class="fa fa-angle-up"></i>
</div>
<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/other.js"></script>

<script src="../assets/js/vendor.js"></script>
<script src="../assets/js/active.js"></script>

<script src="../veg/js/jquery-3.3.1.min.js"></script>
<script src="../veg/js/jquery.slicknav.js"></script>
<script src="../veg/js/owl.carousel.min.js"></script>
<script src="../veg/js/main.js"></script>




<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script src="../jqueryPlug/jqueryTpck/js/swiper.min.js" type="text/javascript" ></script>
<script src="../jqueryPlug/jqueryTpck/js/bigImg.js" type="text/javascript" ></script>


<!-- 加入购物车-->
<script>
    //添加购物车
    function add_cart(goodsId){
        $.ajax({
            type:"POST",
            url:"../cart/addCart",
            data:"goodsId="+goodsId,
            success: function(obj){
                if(obj.state==0){  //登录失败
                    alert("加入购物车失败");
                }else{ //登录成功
                    GrowlNotification.notify({
                        title: '加入购物车成功',
                        type: 'success',
                        position: 'top-center',
                        closeTimeout: 1000
                    });
                }
            },
            //请求失败
            error:function()
            {
                //错误处理
                alert("系统异常");
            }
        });
    }
</script>

<!-- 添加收藏-->
<script>
    function add_collect(goodsId){
        $.ajax({
            type:"POST",
            url:"../account/addCollect",
            data:"goodsId="+goodsId,
            success: function(obj){
                if(obj.state==0){
                    GrowlNotification.notify({
                        title: '已收藏过该商品，看看别的吧',
                        type: 'info',
                        position: 'top-center',
                        closeTimeout: 2000
                    });
                }else{ //登录成功
                    GrowlNotification.notify({
                        title: '收藏成功',
                        type: 'success',
                        position: 'top-center',
                        closeTimeout: 1000
                    });

                }
            },
            //请求失败
            error:function()
            {
                //错误处理
                alert("系统异常");
            }
        });
        //location.href='index.html';
    }
</script>
</body>

</html>