
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>食用菌商城</title>
    <!--=== 图标 ===-->
<%--    <link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon" />--%>

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../layui/css/layui.css" rel="stylesheet">

    <link href="../other/css/other.css" rel="stylesheet">
    <link href="../other/css/bootstrap.css" rel="stylesheet">
    <link href="../other/css/chat-f.css" rel="stylesheet" type="text/css" >
    <link href="../other/css/index.css" rel="stylesheet"type="text/css">

    <link  href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link  href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">

    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/confirm/css/xcConfirm.css" rel="stylesheet" type="text/css" />

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
                                <form action="../goods/showSearch.do">
                                    <div class="search">
                                        <input type="text" name="goodsName" id=""/>
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
                            <form class="form-inline" style="width: 100%" action="../goods/showSearch.do">
                                <div class="search">
                                    <input type="text" name="goodsName"/>
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
                            <!-- <div class="mobile-menu-btn">
                                <div class="off-canvas-btn">
                                    <i class="lnr lnr-menu"></i>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<main>
    <!--  轮播图-->
    <section class="slider-area" >
        <div class="hero-slider-active slick-arrow-style slick-arrow-style_hero slick-dot-style">

            <div class="hero-single-slide ">

                <div class="hero-slider-item bg-img" data-bg="../other/img/slider/4.png">
                    <!-- <div class="hero-slider-item bg-img" data-bg="../../other/img/slider/home1-slide1.png"> -->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="hero-slider-content slide-1">
                                    <!-- <span>valentine gift</span> -->
                                    <h1>口感香脆</h1>
                                    <h2>味道鲜美</h2>
                                    <a href="../goods/showGoodsDetails.do?gid=105" class="btn-hero">查看</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="hero-single-slide">
                <div class="hero-slider-item bg-img" data-bg="../other/img/slider/3.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="hero-slider-content slide-2">
                                    <!-- <span>valentine gift</span> -->

                                    <h1>传统栽培</h1>
                                    <h2>味道更佳</h2>
                                    <a href="../goods/showGoodsDetails.do?gid=102" class="btn-hero">查看</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </section>

    <c:forEach items="${goodslist}" var="goods">
        <c:if test="${goods.promotionPrice!=0 && goods.discountStatus==1}">
            <c:if test="${goods.recommandStatus==1}">
                <!--折扣-->
                <section class="categories spad" style="margin-top: 100px">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="categories__hot__deal">
                                    <c:set var="subPic" value="${goods.subPic}"/>
                                    <c:choose>
                                        <c:when test="${fn:contains(subPic,',')}">
                                            <c:forTokens items="${goods.subPic}" begin="1"  delims="," var="picc" >
                                                <c:forTokens items="${goods.subPic}" begin="0"  end="0" delims="," var="pic" >
                                                    <img src="..${pic}${picc} ">
                                                </c:forTokens>
                                            </c:forTokens>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="..${goods.subPic}">
                                        </c:otherwise>
                                    </c:choose>


                                    <div class="hot__deal__sticker">
                                        <span>折扣价</span>
                                        <h5>￥${goods.promotionPrice}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 offset-lg-1">
                                <div class="categories__deal__countdown">
                                    <span>限时折扣</span>
                                    <h2>${goods.goodsName}</h2>
                                    <input type="hidden" value="<fmt:formatDate value="${goods.promotionEndTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>" id="h_countdown">
                                    <div class="categories__deal__countdown__timer"  id="countdown"></div>
                                    <!-- <div class="product-countdown" data-countdown="2021/07/25"></div> -->
                                    <a href="../goods/showGoodsDetails.do?gid=${goods.goodsId}" class="primary-btn">去看看</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>

        </c:if>
    </c:forEach>
    <!-- 中部分类 -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img src="../other/img/slider/22.png" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>热销爆款</h2>
                            <a href="../goods/showSearch.do">去看看</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src="../other/img/slider/11.png" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>进店必买</h2>
                            <a href="../goods/showSearch.do">去看看</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                            <!-- <img src="../../html/img/banner/banner-3.jpg" alt=""> -->
                            <img src="../other/img/slider/33.png" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>新品上新</h2>
                            <a href="../goods/showSearch.do">去看看</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 产品列表 -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>产品</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">特色</li>
                            <li data-filter=".or">香菇</li>
                            <li data-filter=".ve">其他</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row featured__filter">
                <c:forEach items="${goodslist}" end="8" var="goods">
                    <c:if test="${goods.categoryId==1001}">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix or">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="..${goods.icon}">
                                    <ul class="featured__item__pic__hover">
                                        <li><a href="javascript:void(0)" onclick="addCollect(${goods.goodsId})"><i class="fa fa-heart" title="收藏" data-toggle="tooltip" data-placement="top"></i></a></li>
                                        <li><a href="javascript:void(0)" onclick="addCart(${goods.goodsId})" class="add_cart"><i class="fa fa-shopping-cart" title="加入购物车" data-toggle="tooltip" data-placement="top"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="../goods/showGoodsDetails.do?gid=${goods.goodsId}">${goods.goodsName}</a></h6>
                                    <c:choose>
                                        <c:when test="${goods.promotionPrice!=0 && goods.discountStatus==1}">
                                            <h5>￥${goods.promotionPrice}</h5>
                                        </c:when>
                                        <c:otherwise>
                                            <h5>￥${goods.price}</h5>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${goods.categoryId!=1001}">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix ve">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="..${goods.icon}">
                                    <ul class="featured__item__pic__hover">
                                        <li><a href="javascript:void(0)" onclick="addCollect(${goods.goodsId})"><i class="fa fa-heart" title="收藏" data-toggle="tooltip" data-placement="top"></i></a></li>
                                        <li><a href="javascript:void(0)" onclick="addCart(${goods.goodsId})"><i class="fa fa-shopping-cart" title="加入购物车" data-toggle="tooltip" data-placement="top"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="../goods/showGoodsDetails.do?gid=${goods.goodsId}">${goods.goodsName}</a></h6>
                                    <c:choose>
                                        <c:when test="${goods.promotionPrice!=0 && goods.discountStatus==1}">
                                            <h5>￥${goods.promotionPrice}</h5>
                                        </c:when>
                                        <c:otherwise>
                                            <h5>￥${goods.price}</h5>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- 查看更多 -->
    <div class="col-12">
        <div class="view-more-btn" style="margin-bottom: 50px">
            <a class="btn-hero btn-load-more" href="../goods/showSearch.do">查看更多</a>
        </div>
    </div>



    <!-- 服务政策-->
    <section class="service-policy-area section-space p-0" style="margin:50px auto">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">

                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="../assets/img/icon/free_shipping.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>免运费</h5>
                            <p>所有订单免运费</p>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">

                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="../assets/img/icon/support247.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>全天候支持</h5>
                            <p>24小时在线</p>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">

                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="../assets/img/icon/money_back.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>品质保证</h5>
                            <p>30天免费退货</p>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">

                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="../assets/img/icon/promotions.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>订单折扣</h5>
                            <p>不定时推出折扣活动</p>
                        </div>
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
<script src="../other/js/sockjs.min.js"></script>


<script src="../veg/js/bootstrap.min.js"></script>
<script src="../veg/js/jquery.nice-select.min.js"></script>
<script src="../veg/js/jquery-ui.min.js"></script>
<script src="../veg/js/jquery.slicknav.js"></script>
<script src="../veg/js/mixitup.min.js"></script>
<script src="../veg/js/owl.carousel.min.js"></script>
<script src="../veg/js/main.js"></script>

<script src="../assets/js/vendor.js"></script>
<script src="../assets/js/active.js"></script>

<script src="../other/js/index/jquery.nicescroll.min.js"></script>
<script src="../other/js/index/jquery.slicknav.js"></script>
<script src="../other/js/index/owl.carousel.min.js"></script>
<script src="../other/js/index/main.js"></script>

<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>


<!-- 加入购物车-->
<script>
    // $('.add_cart').click(function(){
        function addCart(goodsId){
        // var goodsId=$(this).parent().parent().find("input").val();
        // console.log(list);
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
        //location.href='index.html';
    }
</script>
<!-- 添加收藏-->
<script>
    // $('.add_collect').click(function(){
        function addCollect(goodsId){
        // var goodsId=$(this).parent().parent().find("input").val();
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

<script>
    // $('.btn_header_submit').on('click',function(){
    //    var goodsNamed = $(this).parent().find('input').val();
    //     window.location.href="../goods/continueToPay?orderSn="+orderSn+"&totalPrice="+totalPrice;
    // });
</script>
</body>

</html>
