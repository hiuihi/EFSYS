
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>订单详情</title>
    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../layui/css/layui.css" rel="stylesheet">

    <link  href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link  href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">

    <link href="../other/css/other.css" rel="stylesheet">
    <link  href="../other/css/orderDetails.css" rel="stylesheet" type="text/css">

    <style>

    </style>


</head>
<style>

</style>
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
                            <h1>订单详情</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">订单详情</li>--%>
<%--                            </ul>--%>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 订单确认条 -->
    <div class="process-wrap1" >
        <input type="hidden" value="${orderGoodsVo.order.orderStatus}">
        <div class="process1 text-center active">
            <dt>
                <img src="../other/img/orderdetails/orderinfo_img1.png" class="img_orderinfo" alt=""/></dt>
            <dd>
                <p>提交订单</p>
                <span>
                    <fmt:formatDate value="${orderGoodsVo.order.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
            </dd>
        </div>
        <div class="process1 text-center active">
            <dt><img src="../other/img/orderdetails/orderinfo_img2.png" class="img_orderinfo" alt=""/></dt>
            <dd>
                <p>付款成功</p>
                <span>
                    <fmt:formatDate value="${orderGoodsVo.order.paymentTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
            </dd>
        </div>
        <div class="process1 text-center active">
            <img src="../other/img/orderdetails/orderinfo_img3.png" class="img_orderinfo" alt=""/>
            <p>运输中</p>
            <span>
                <fmt:formatDate value="${orderGoodsVo.order.deliveryTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
            </span>
        </div>
        <div class="process1 text-center active">
            <dt><img src="../other/img/orderdetails/orderinfo_img4.png" class="img_orderinfo" alt=""/></dt>
            <dd>
                <p>确认收货</p>
                <span>
                    <fmt:formatDate value="${orderGoodsVo.order.receiveTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
            </dd>
        </div>
        <div class="process1 text-center">
            <dt><img src="../other/img/orderdetails/orderinfo_img5.png" class="img_orderinfo"alt=""/></dt>
            <dd>
                <p>评价</p>
                <span>
                    <fmt:formatDate value="${orderGoodsVo.order.commentTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
            </dd>
        </div>
    </div>

    <!-- 商品清单 -->
    <section class="shop-cart spad"  style="margin-top: 150px;">
        <div class="container" >
            <div class="shop_order">
<%--                <div class="product-countdown" data-countdown="<fmt:formatDate value="${orderGoodsVo.order.createTime}" type="date" pattern="yyyy-MM-dd" timeZone="GMT+8"/>"></div>--%>
                <div class="product-countdown" data-countdown="2021/05/02"></div>
<%--                <div class="product-countdown" data-countdown="2021-06-02"></div>--%>
                <c:if test="${orderGoodsVo.order.orderStatus!=0 && orderGoodsVo.order.orderStatus!=5}">
                    <div class="layui-card" style="border: 1px solid #e2e2e2;">
                        <div class="layui-card-header" style="font-weight: 800;">物流信息</div>
                        <div class="layui-card-body">
                            <!--物流信息-->
                            <div id="container" class="clear">

                                <div class="product-countdown" data-countdown="2021/05/02"></div>
<%--                                <div class="product-countdown" data-countdown="2021-06-02"></div>--%>
<%--                                <div class="product-countdown" data-countdown="2021/07/25"></div>--%>
                                <c:choose>
                                    <c:when test="${orderGoodsVo.order.deliverySn!=null && orderGoodsVo.order.deliverySn!='' }">
                                        <p>物流公司:${orderGoodsVo.order.deliveryCompany}</p>
                                        <p>运单号码:${orderGoodsVo.order.deliverySn}</p>
                                        <div class="adress_choice">

                                            <div  class="base" >
                                                <i>  物流跟踪：</i>
                                                <c:forEach items="${deliveryList}" var="delivery">
                                                    <p>${delivery}</p>
                                                </c:forEach>
<%--                                                <p>2021-05-03 14:12:29 丽水水阁中转场 已发出,下一站 浙江陆运枢纽（杭州）</p>--%>
<%--                                                <p>2021-05-03 13:40:21 丽水水阁中转场 已收入</p>--%>
<%--                                                <p>2021-05-03 09:21:06 丽水庆元公司 已发出,下一站 丽水水阁中转场</p>--%>
<%--                                                <p>2021-05-03 09:12:47 丽水庆元公司 已打包</p>--%>
<%--                                                <p>2021-05-03 08:31:46 丽水庆元公司 已收件</p>--%>
<%--                                                <p>2021-05-03 08:01:03 包裹正在等待揽收 </p>--%>
<%--                                                <p>2021-05-02 17:33:44 商品已经下单</p>--%>
                                            </div>

                                            <a id="more" href="javascript:void(0);" >
                                                更多信息↓
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <p>物流公司:无</p>
                                        <p>运单号码:无</p>
                                    </c:otherwise>
                                </c:choose>


                                <!--物流-->

                            </div>
                        </div>
                    </div>
                </c:if>



                <!--订单信息 -->
                <div class="row" style="border: 1px solid #e2e2e2;margin: 0 auto;">
                    <div class="col-lg-12">
                        <div class="shop_list" > <span >订单信息</span> </div>
                        <!-- 细横线 -->
                        <fieldset class="layui-elem-field layui-field-title" ></fieldset>
                        <div class="orderInf">
                            <p>
                                收货地址:
                                <span>${orderGoodsVo.order.userAddressName}</span>
                                <span>${orderGoodsVo.order.tel}</span>
                                <span>${orderGoodsVo.order.province}</span>
                                <span>${orderGoodsVo.order.city}</span>
                                <span>${orderGoodsVo.order.county}</span>
                                <span>${orderGoodsVo.order.address}</span>
                            </p>
                            <p>订单号: <span>${orderGoodsVo.order.orderSn}</span></p>
                            <p>提交时间: <fmt:formatDate value="${orderGoodsVo.order.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            <c:if test="${orderGoodsVo.order.tradeNo!=null && orderGoodsVo.order.tradeNo!='' }">
                                <p>支付宝交易号: <span>${orderGoodsVo.order.tradeNo}</span></p>
                                <p>支付时间: <fmt:formatDate value="${orderGoodsVo.order.paymentTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </c:if>
                        </div>
                    </div>


                    <div class="col-lg-12">


                        <div class="order-table" >
                            <table>
                                <thead>
                                <tr>
                                    <th class="shoping_product">商品</th>
                                    <th>属性</th>
                                    <th>价格</th>
                                    <th>数量</th>
                                    <th>总价</th>
                                    <th>状态</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${orderGoodsVo.orderGoods}" var="orderGoods" varStatus="orderGood">
                                    <tr>
                                        <td class="order_item">
                                            <img src="..${orderGoods.images}">
                                            <h5>${orderGoods.goodsName}</h5>
                                        </td>
                                        <td class="order_property">
                                            <span>规格:${orderGoods.spec}</span>
                                        </td>
                                        <td class="order_price">
                                            ￥${orderGoods.price}
                                        </td>
                                        <td class="order_quantity">
                                                ${orderGoods.stock}
                                        </td>
                                        <c:if test="${orderGood.first}">
                                        <td class="order_total" rowspan="${fn:length(orderGoodsVo.orderGoods)}" style="border-left: 1px solid #eee;">
                                            ￥<span>${orderGoodsVo.order.totalAmount}</span>
                                        </td>
                                            <td class="order_total" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                                <c:choose>
                                                    <c:when test="${orderGoodsVo.order.orderStatus==0}">
                                                        待付款
                                                    </c:when>
                                                    <c:when test="${orderGoodsVo.order.orderStatus==1}">
                                                        待发货
                                                    </c:when>
                                                    <c:when test="${orderGoodsVo.order.orderStatus==2}">
                                                        已发货
                                                    </c:when>
                                                    <c:when test="${orderGoodsVo.order.orderStatus==3}">
                                                        已收货
                                                    </c:when>
                                                    <c:when test="${orderGoodsVo.order.orderStatus==4}">
                                                        已评价
                                                    </c:when>
                                                    <c:when test="${orderGoodsVo.order.orderStatus==5}">
                                                        已关闭
                                                    </c:when>
                                                    <c:when test="${orderGoodsVo.order.orderStatus==6}">
                                                        退货退款中
                                                    </c:when>
                                                </c:choose>

                                            </td>
                                        </c:if>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

<%--                        <div class="shoping__cart__table" style="width:95%;margin: 0 auto;margin-top: 20px;margin-bottom: 20px;">--%>
<%--                            <table style="border: 1px solid #e2e2e2;">--%>
<%--                                <thead style="background-color: #e2e2e2;">--%>
<%--                                <tr>--%>

<%--                                    <th class="shoping__product">商品</th>--%>
<%--                                    <th>价格</th>--%>
<%--                                    <th>数量</th>--%>
<%--                                    <th>总价</th>--%>

<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <c:forEach items="${orderGoodsVo.orderGoods}" var="orderGoods" varStatus="orderGood">--%>
<%--                                    <tr>--%>
<%--                                    <td class="shoping__cart__item">--%>
<%--                                    <img src="..${orderGoods.images}" alt="" style="margin-left: 10px;">--%>
<%--                                    <h5>${orderGoods.goodsName} <br><span style="font-size: 10px;">规格:${orderGoods.spec}</span></h5>--%>
<%--                                    </td>--%>
<%--                                    <td class="shoping__cart__price">--%>
<%--                                    ￥${orderGoods.price}--%>
<%--                                    </td>--%>
<%--                                    <td class="shoping__cart__quantity" style="font-weight: 700;">--%>
<%--                                    ${orderGoods.stock}--%>
<%--                                    </td>--%>
<%--                                    <c:if test="${orderGood.first}">--%>
<%--                                        <td class="shoping__cart__total" rowspan="${fn:length(orderGoodsVo.orderGoods)}" style="border-left: 1px solid #eee;">--%>
<%--                                            ￥<span>${orderGoodsVo.order.totalAmount}</span>--%>
<%--                                        </td>--%>
<%--                                    </c:if>--%>

<%--                                    </tr>--%>
<%--                                    </c:forEach>--%>

<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>
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

<script src="../veg/js/bootstrap.min.js"></script>
<script src="../veg/js/jquery.nice-select.min.js"></script>
<script src="../veg/js/jquery-ui.min.js"></script>
<script src="../veg/js/jquery.slicknav.js"></script>
<script src="../veg/js/mixitup.min.js"></script>
<script src="../veg/js/owl.carousel.min.js"></script>
<script src="../veg/js/main.js"></script>

<script src="../assets/js/active.js"></script>
<script src="../assets/js/vendor.js"></script>
<script>
$(function () {
    var orderStatus=$('.process-wrap1').find('input').eq(0).val();
    //进度条
    $.processBar(orderStatus,'f');
    //alert("1:"+orderStatus);

});
</script>
</body>

</html>
