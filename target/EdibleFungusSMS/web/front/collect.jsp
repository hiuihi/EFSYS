
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>我的收藏</title>
    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../layui/css/layui.css" rel="stylesheet">

    <link href="../other/css/other.css" rel="stylesheet">
    <link  href="../other/css/orders.css" rel="stylesheet" type="text/css">

    <link href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">
    <link href="../veg/css/nice-select.css" rel="stylesheet" type="text/css">
    <link href="../veg/css/elegant-icons.css" rel="stylesheet" type="text/css">

    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/confirm/css/xcConfirm.css" rel="stylesheet" type="text/css" />
</head>
<style>

</style>
<body >
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

<main >

    <!-- 标题 -->
    <div class="breadcrumb-area common-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <h1>我的收藏</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">我的收藏</li>--%>
<%--                            </ul>--%>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="hero" style="margin-top: 20px;">
        <div class="container">
            <div class="row">
                <!-- 左侧 -->
                <div class="col-lg-3">

                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>我的订单</span>
                        </div>
                        <ul>
                            <li><a class="account_order" href="../account/showOrders.do">全部订单</a></li>
                            <li><a class="account_order" href="../account/showOrders.do?orderStatus=${0}&condition=${1}">待付款</a></li>
                            <li><a class="account_order" href="../account/showOrders.do?orderStatus=${1}&condition=${2}">待发货</a></li>
                            <li><a class="account_order" href="../account/showOrders.do?orderStatus=${2}&condition=${3}">待收货</a></li>
                            <li><a class="account_order" href="../account/showOrders.do?orderStatus=${3}&condition=${4}">待评价</a></li>
                            <li><a class="account_order" href="../account/showOrders.do?orderStatus=${6}&condition=${5}">退货退款</a></li>
                        </ul>
                    </div>


                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-heart"></i>
                            <span>我的收藏</span>
                        </div>
                        <ul>
                            <li><a href="../account/showCollect.do">我的收藏</a></li>
                        </ul>
                    </div>

                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-map-marker"></i>
                            <span> &nbsp;收货地址</span>
                        </div>
                        <ul>
                            <li><a href="../account/showAddress.do">地址管理</a></li>
                        </ul>
                    </div>

                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-user-circle"></i>
                            <span>账号管理</span>
                        </div>
                        <ul>
                            <li><a href="../account/showAccount.do">我的信息</a></li>
                            <li><a href="../account/showChangePassword.do">修改密码</a></li>

                        </ul>
                    </div>
                </div>
                <!-- 右侧 -->
                <div class="col-lg-9">
                    <c:choose>
                        <c:when test="${empty collects}">
                            <div class="n_available">
                                <img src="../other/img/other/noCollect.png">
                                <p>暂无收藏</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- 列表 -->
                            <div class="shop-product-wrap grid-view row mbn-40">
                                <c:forEach items="${collects}" var="collect">
                                    <!-- 单个 -->
                                    <div class="col-md-4 col-sm-6">
                                        <!-- 网格 -->
                                        <div class="product-item">
                                            <div class="product__item">
                                                <div class="product__item__pic set-bg" data-setbg="..${collect.images}">
                                                    <ul class="product__item__pic__hovered">
                                                        <li>
                                                            <a href="javascript:void(0)" class="unFavorite" title="取消收藏" data-toggle="tooltip" data-placement="top">
                                                                <input type="hidden" value="${collect.id}">
                                                                <i class="fa fa-heart" ></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="product__item__text">
                                                    <h6><a href="../goods/showGoodsDetails.do?gid=${collect.goodsId}">${collect.goodsName}</a></h6>
                                                    <c:choose>
                                                        <c:when test="${collect.promotionPrice!=0}">
                                                            <h5>￥${collect.promotionPrice}</h5>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <h5>￥${collect.price}</h5>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </c:otherwise>
                    </c:choose>



                    <!-- 分页 -->
<%--                    <div class="paginatoin-area text-center" style="margin-bottom: 40px;">--%>
<%--                        <ul class="pagination-box">--%>
<%--                            <li><a class="previous" href="#"><i class="lnr lnr-chevron-left"></i></a></li>--%>
<%--                            <li class="active"><a href="#">1</a></li>--%>
<%--                            <li><a href="#">2</a></li>--%>
<%--                            <li><a href="#">3</a></li>--%>
<%--                            <li><a class="next" href="#"><i class="lnr lnr-chevron-right"></i></a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

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


<script src="../assets/js/vendor.js"></script>
<script src="../assets/js/active.js"></script>

<script src="../other/js/other.js"></script>

<script src="../layui/layui.js"></script>

<script src="../veg/js/main.js"></script>
<script src="../veg/js/jquery-ui.min.js"></script>
<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<!-- 取消收藏-->
<script>
    $('.unFavorite').click(function(){
        var collectId=$(this).find("input").val();

        $.ajax({
            type:"POST",
            url:"../account/delCollect",
            data:"collectId="+collectId,
            success: function(obj){
                if(obj.state==0){
                    alert("取消失败");
                }else{ //登录成功
                    GrowlNotification.notify({
                        title: '取消成功',
                        type: 'success',
                        position: 'top-center',
                        closeTimeout: 1000
                    });
                    setTimeout( 'window.location.href="../account/showCollect.do"',200);
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
    });
</script>
<script>
    // 显示第二个ul(我的收藏)
    $('.hero').find('ul').eq(1).show();
</script>

</body>

</html>