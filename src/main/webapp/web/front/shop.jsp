
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>商品列表</title>
    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../other/css/other.css" rel="stylesheet">

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
                                        <input type="text" name="goodsName" value="${goodsName}"/>
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
                                    <input type="text" name="goodsName" value="${goodsName}"/>
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
    <!-- 标题 -->
    <div class="breadcrumb-area common-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <h1>列表</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">商品列表</li>--%>
<%--                            </ul>--%>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 主内容 -->
    <div class="shop-main-wrapper section-space pb-0">
        <div class="container">
            <div class="row">

                    <c:choose>
                        <c:when test="${empty goodslist}">
                            <div class="n_available">
                                <img src="../other/img/other/noOrders.png">
                                <p>未找到该商品</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- 左侧侧边栏 -->
                            <div class="col-lg-3 order-2 order-lg-1">
                                <aside class="sidebar-wrapper">
                                    <!-- 类别 -->
                                    <div class="sidebar-single">
                                        <h3 class="sidebar-title">类别</h3>
                                        <div class="sidebar-body">
                                            <ul class="shop-categories">
                                                <c:forEach items="${goodsCategories}" var="gc">
                                                    <li><a href="../shop/show">${gc.name}<span></span></a></li>
                                                </c:forEach>
<%--                                                <li><a href="#">香菇 <span></span></a></li>--%>
<%--                                                <li><a href="#">木耳 <span></span></a></li>--%>
<%--                                                <li><a href="#">银耳 <span></span></a></li>--%>
<%--                                                <li><a href="#">灰树花 <span></span></a></li>--%>
<%--                                                <li><a href="#">灵芝 <span>5</span></a></li>--%>

                                            </ul>
                                        </div>
                                    </div>

                                </aside>
                            </div>
                        <!-- 右侧商品 -->
                        <div class="col-lg-9 order-1 order-lg-2">
                            <div class="shop-product-wrapper">
                                <!-- 上部筛选-->
                                <div class="shop-top-bar">
                                    <div class="row align-items-center">
                                        <div class="col-lg-7 col-md-6 order-2 order-md-1">
                                            <div class="top-bar-left">
                                                <div class="product-view-mode">
                                                    <a class="active" href="#" data-target="grid-view" data-toggle="tooltip" ><i class="fa fa-th"></i></a>
                                                    <a href="#" data-target="list-view" data-toggle="tooltip" ><i class="fa fa-list"></i></a>
                                                </div>
                                                    <%--                                        <div class="product-amount">--%>
                                                    <%--                                            <p>显示${pageBean.totalCount}个结果中的${pageBean.start+1}–${pageBean.currentPage*pageBean.rows}个</p>--%>
                                                    <%--                                        </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 商品列表 -->
                                <div class="shop-product-wrap grid-view row mbn-40">
                                    <c:forEach items="${goodslist}" var="list">
                                        <!-- 单个商品 -->
                                        <div class="col-md-4 col-sm-6">
                                            <!-- 网格 -->
                                            <div class="product-item">
                                                <div class="product__item">
                                                    <div class="product__item__pic set-bg" data-setbg="..${list.icon}">
                                                        <ul class="product__item__pic__hover">
                                                            <li><a href="javascript:void(0)" title="收    藏" data-toggle="tooltip" data-placement="top" onclick="add_collect(${list.goodsId})"><i class="fa fa-heart"></i></a></li>
                                                            <li><a href="javascript:void(0)"onclick="add_cart(${list.goodsId})" title="加入购物车" data-toggle="tooltip" data-placement="top"><i class="fa fa-shopping-cart"></i><input type="hidden" value="${list.goodsId}"></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product__item__text">
                                                        <h6><a href="../goods/showGoodsDetails.do?gid=${list.goodsId}">${list.goodsName}</a></h6>
                                                        <c:choose>
                                                            <c:when test="${list.promotionPrice!=0 && list.discountStatus==1}">
                                                                <h5>￥${list.promotionPrice}</h5>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h5>￥${list.price}</h5>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--  列表 -->
                                            <div class="product-list-item">
                                                <figure class="product-thumb">
                                                    <a href="../goods/showGoodsDetails.do?gid=${list.goodsId}">
                                                        <img class="pri-img" src="..${list.icon}" alt="">
                                                        <img class="sec-img" src="..${list.icon}" alt="">
                                                        <!-- <img class="sec-img" src="../assets/img/product/product-2.jpg" alt="product"> -->
                                                    </a>
                                                    <div class="product-badge">
                                                        <c:if test="${list.newStatus==1}">
                                                            <div class="product-label new">
                                                                <span>新</span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${list.promotionPrice!=0 && list.discountStatus==1}">
                                                            <div class="product-label discount">
                                                        <span>
                                                            -<fmt:parseNumber value="${(list.price-list.promotionPrice)/list.price*100}" integerOnly="true"/>%
<%--                                                        ${(list.price-list.promotionPrice)/list.price*100}%--%>
                                                        </span>
                                                            </div>
                                                        </c:if>

                                                    </div>
                                                </figure>
                                                <div class="product-content-list">
                                                    <h5 class="product-name"><a href="../goods/showGoodsDetails.do?gid=${list.goodsId}">${list.goodsName}</a></h5>
                                                    <div class="price-box">
                                                        <c:choose>
                                                            <c:when test="${list.promotionPrice!=0 && list.discountStatus==1}">
                                                                <span class="price-regular">￥${list.promotionPrice}</span>
                                                                <span class="price-old"><del>￥${list.price}</del></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="price-regular">￥${list.price}</span>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </div>
                                                    <p>${list.title}</p>
                                                    <div class="button-group-list">
                                                        <a class="btn-big" href="javascript:void(0)" data-toggle="tooltip" onclick="add_cart(${list.goodsId})"><i class="lnr lnr-cart"><input type="hidden" value="${list.goodsId}"></i>添加到购物车</a>
                                                        <a href="javascript:void(0)" data-toggle="tooltip" onclick="add_collect(${list.goodsId})"><i class="lnr lnr-heart"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- 分页 -->
                                <div class="paginatoin-area text-center" style="margin-bottom: 40px;">
                                    <ul class="pagination-box">
                                        <c:choose>
                                            <c:when test="${pageBean.currentPage==1}">
                                                <li><a class="previoused"><i class="lnr lnr-chevron-left"></i></a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a class="previous" href="../goods/showSearch.do?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}&orderStatus=${orderStatus}"><i class="lnr lnr-chevron-left"></i></a></li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                                            <c:choose>
                                                <c:when test="${pageBean.currentPage==i}">
                                                    <li class="active"><a href="../goods/showSearch.do?currentPage=${i}&rows=${pageBean.rows}&orderStatus=${orderStatus}">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="../goods/showSearch.do?currentPage=${i}&rows=${pageBean.rows}&orderStatus=${orderStatus}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${pageBean.currentPage!=pageBean.totalPage}">
                                                <li><a class="next" href="../goods/showSearch.do?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}&orderStatus=${orderStatus}"><i class="lnr lnr-chevron-right"></i></a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a class="nexted"><i class="lnr lnr-chevron-right"></i></a></li>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="div_pagination">&nbsp;&nbsp;
                                            共&nbsp;<span>${pageBean.totalCount}</span>&nbsp;条记录,
                                            共&nbsp;<span>${pageBean.totalPage}</span>&nbsp;页
                                        </div>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        </c:otherwise>
                    </c:choose>

            </div>
        </div>
    </div>

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
<script src="../veg/js/jquery-3.3.1.min.js"></script>
<script src="../veg/js/main.js"></script>

<script src="../assets/js/vendor.js"></script>
<script src="../assets/js/active.js"></script>

<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
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