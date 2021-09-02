<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>我的订单</title>
    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../layui/css/layui.css" rel="stylesheet">

    <link href="../other/css/other.css" rel="stylesheet">
    <link  href="../other/css/orders.css" rel="stylesheet" type="text/css">
    <link href="../other/css/chat-f.css" rel="stylesheet" type="text/css" >

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
                                <form class="form-inline" action="../account/showOrders.do">
                                    <div class="search" style="visibility:hidden;">
                                        <input type="text" name="term" value="${term}"/>
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
                            <form class="form-inline" style="width: 100%" action="../account/showOrders.do">
                                <div class="search" style="visibility:hidden;">
                                    <input type="text" name="term"  value="${term}"/>
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

<main >

    <!-- 标题 -->
    <div class="breadcrumb-area common-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <input type="hidden" value="${condition}" id="condition">
                            <h1>我的订单</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">我的订单</li>--%>
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
                    <!--  -->
                    <c:choose>
                        <c:when test="${not empty orderGoodsVos}">
                            <div class="div_container">
                                <!-- 标题 -->
                                <div class="shoping__cart__table1" >
                                    <table>
                                        <thead>
                                        <tr>
                                            <th class="shoping__product" >商品</th>
                                            <th >单价（元）</th>
                                            <th >数量</th>
                                            <th >实付（元）</th>
                                            <th >售后</th>
                                            <th >交易状态</th>
                                            <th >操作</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>

                                <c:forEach items="${orderGoodsVos}" var="orderGoodsVo">
                                    <!-- 列表 -->
                                    <div class="shoping__cart__table2">
                                        <table >
                                            <thead>
                                            <div class="breadcrumb-wrap1">
                                                <p>
                                                    订单号:<span>${orderGoodsVo.order.orderSn}</span> &nbsp;&nbsp;
                                                    下单时间:<span><fmt:formatDate value="${orderGoodsVo.order.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                                    <button class="del_order"><i class="fa fa-trash-o"></i></button>
                                                </p>
                                            </div>
                                            </thead>
                                            <tbody >
                                            <c:forEach items="${orderGoodsVo.orderGoods}" var="orderGoods" varStatus="orderGood">
                                                <tr>
                                                    <td class="shoping__cart__item" >
                                                        <img  src="..${orderGoods.images}" alt="">
                                                        <h5 >
                                                            <a href="../goods/showGoodsDetails.do?gid=${orderGoods.goodsId}">${orderGoods.goodsName}</a><br>
                                                            规格:<span>${orderGoods.spec}</span>
                                                        </h5>
                                                        <!-- <div class="shop_div_type">
                                                            <p>类型：Xs</p>
                                                        </div> -->
                                                    </td>
                                                    <td class="shoping__cart__price">
                                                        ￥<span>${orderGoods.price}</span>
                                                    </td>
                                                    <td class="shoping__cart__quantity">
                                                        <span>${orderGoods.stock}</span>
                                                    </td>
                                                    <c:if test="${orderGood.first}">
                                                        <td class="shoping__cart__total" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                                            ￥<span>${orderGoodsVo.order.totalAmount}</span>
                                                        </td>
                                                        <td class="shoping__cart__after" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                                                <%--                                                            <a href="javascript:void(0)" class="a_reimburse">退货/退款</a>--%>
                                                            <a href="../order/showReimburse.do?orderSn=${orderGoodsVo.order.orderSn}" class="a_reimburse">退货/退款</a>
                                                                <%--                                                            <a href="../order/refund?orderSn=${orderGoodsVo.order.orderSn}&tradeNo=${orderGoodsVo.order.tradeNo}&price=${orderGoodsVo.order.totalAmount}">退货/退款</a>--%>
                                                        </td>
                                                        <td class="shoping__cart__status" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                                            <c:choose>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==0}">
                                                                    <span>待付款</span>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==1}">
                                                                    <span>待发货</span>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==2}">
                                                                    <span>已发货</span>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==3}">
                                                                    <span>已完成</span>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==4}">
                                                                    <span>已评价</span>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==5}">
                                                                    <span>已关闭</span>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==6}">
                                                                    <span>退货退款</span>
                                                                </c:when>
                                                            </c:choose>
                                                            <br>
                                                                <%--                                                ?orderGoodsVo=${orderGoodsVo}--%>
                                                            <a href="../order/showOrderDetails.do?orderSn=${orderGoodsVo.order.orderSn}">订单详情</a><br>
<%--                                                            <c:if test="${orderGoodsVo.order.orderStatus!=0}">--%>
<%--                                                                <a href="javascript:void(0)" class="view_Logistics">查看物流</a>--%>
<%--                                                            </c:if>--%>
                                                        </td>
                                                        <td class="shoping__cart__handle" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                                            <c:choose>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==0}">
                                                                    <a href="javascript:void(0)" class="continue_to_pay">立即支付</a>
                                                                    <button class="cancel_order">取消订单</button>
                                                                    <%--                                                                    <a href="../order/showOrder.do?orderSn=${orderGoodsVo.order.orderSn}">查询</a>--%>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==1}">
                                                                    <%--                                                                    <a href="javascript:void(0)">提醒发货</a>--%>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==2}">
                                                                    <a href="javascript:void(0)" class="confirm_receipt">确认收货</a>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==3}">
                                                                    <a href="javascript:void(0)" class="to_evaluate">立即评价</a>
                                                                </c:when>
                                                                <c:when test="${orderGoodsVo.order.orderStatus==4}">
                                                                    <%--                                                                    <a href="../cart/addCart?ids=${orderGoodsVo.order.goodsIds}"  onclick="addCart()">加入购物车</a>--%>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                    </c:if>

                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>


                                <!-- 分页 -->
                                <div class="paginatoin-area text-center" >
                                    <ul class="pagination-box">
                                        <c:choose>
                                            <c:when test="${pageBean.currentPage==1}">
                                                <li><a class="previoused"><i class="lnr lnr-chevron-left"></i></a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a class="previous" href="../account/showOrders.do?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}&orderStatus=${orderStatus}"><i class="lnr lnr-chevron-left"></i></a></li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                                            <c:choose>
                                                <c:when test="${pageBean.currentPage==i}">
                                                    <li class="active"><a href="../account/showOrders.do?currentPage=${i}&rows=${pageBean.rows}&orderStatus=${orderStatus}">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="../account/showOrders.do?currentPage=${i}&rows=${pageBean.rows}&orderStatus=${orderStatus}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${pageBean.currentPage!=pageBean.totalPage}">
                                                <li><a class="next" href="../account/showOrders.do?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}&orderStatus=${orderStatus}"><i class="lnr lnr-chevron-right"></i></a></li>
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
                        </c:when>
                        <c:otherwise>
                            <div class="n_available">
                                <img src="../other/img/other/noOrders.png">
                                <p>暂无订单</p>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </section>

    <!-- 物流信息 -->
    <div class="addmodal" >
        <div class="layui-card " id="add-modal-dialog">
            <div class="layui-card-header" style="background-color: #eee;">物流信息<span style="margin:0 20px">顺丰快递</span>运单编号:<span>SF1198324912548</span><button style="float: right;" class="layui-icon btn_x" >&#x1007;</button> </div>
            <div class="layui-card-body" id="div_Logistics">
                <ul class="layui-timeline">
<%--                    <li class="layui-timeline-item">--%>
<%--                        <i class="layui-icon layui-timeline-axis">&#x1005;</i>--%>
<%--                        <div class="layui-timeline-content layui-text">--%>
<%--                            <h3 class="layui-timeline-title">已签收</h3>--%>
<%--                            <p>--%>
<%--                                2021-03-12 14:23:11 您的快递已签收--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="layui-timeline-item">--%>
<%--                        <i class="layui-icon layui-timeline-axis">&#xe613;</i>--%>
<%--                        <div class="layui-timeline-content layui-text">--%>
<%--                            <h3 class="layui-timeline-title">派送中</h3>--%>
<%--                            <p>2021-03-12 10:18:16【杭州市】浙江省杭州市大运河树人城院分部派件员当前正在为您派件</p>--%>
<%--                        </div>--%>
<%--                    </li>--%>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe609;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">运输中</h3>
<%--                            <p>2021-03-12</p>--%>
<%--                            <ul>--%>
<%--                                <li>10:18:16 浙江省杭州市大运河树人城院分部 已收入</li>--%>
<%--                                <li>07:38:53 浙江省杭州市大运河公司 已收入</li>--%>
<%--                                <li>04:13:20 杭州石桥城配中心公司 已发出,下一站 浙江省杭州市大运河</li>--%>
<%--                                <li>03:50:43 杭州石桥城配中心公司 已打包</li>--%>
<%--                                <li>03:29:32 杭州石桥城配中心公司 已收入</li>--%>
<%--                                <li>01:48:52 杭州转运中心公司 已发出,下一站 杭州石桥城配中心</li>--%>
<%--                                <li>01:46:11 杭州转运中心公司 已收入</li>--%>
<%--                            </ul>--%>

                            <p>2021-05-03</p>
                            <ul>
                                <li>14:12:29 丽水水阁中转场 已发出,下一站 浙江陆运枢纽（杭州）</li>
                                <li>13:40:21 丽水水阁中转场 已收入</li>
                                <li>09:21:06 丽水庆元公司 已发出,下一站 丽水水阁中转场</li>
                                <li>09:12:47 丽水庆元公司 已打包</li>
                                <li>08:31:46 丽水庆元公司 已收件</li>
                                <li>08:01:03 包裹正在等待揽收 </li>
                            </ul>
<%--                            <ul>--%>
<%--                                <li>21:42:29 广东宝安接驳点公司 已发出,下一站 杭州转运中心</li>--%>
<%--                                <li>21:40:21 广东宝安接驳点公司 已收入</li>--%>
<%--                                <li>19:21:06 广东省深圳市宝安区光明新区公司 已发出,下一站 广东宝安接驳点</li>--%>
<%--                                <li>19:12:47 广东省深圳市宝安区光明新区公司 已打包</li>--%>
<%--                                <li>08:31:46 广东省深圳市宝安区光明新区公司 已收件</li>--%>
<%--                                <li>08:01:03 包裹正在等待揽收 </li>--%>
<%--                            </ul>--%>
                        </div>
                    </li>

                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe60a;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">已下单</h3>
                            <p>2021-05-02 17:33:44 商品已经下单</p>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 评价 -->
    <div class="div_comment" >
        <div class="layui-card comment-modal-dialog">
            <div class="layui-card-header" style="background-color: #eee;">评论<button style="float: right;" class="layui-icon btn_x" >&#x1007;</button> </div>
            <div class="layui-card-body div_comment-y" style="background-color: #F6F6F6;">
                <form class="layui-form" id="layui-form-comment" action="">
                    <div class="comment-list">

                    </div>
                    <input type="hidden" name="h_start" value="0">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn" lay-submit="" lay-filter="comment-submit">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- 信息 -->
    <div class="chatContainer">
        <div class="chatBtn">
            <i class="fa fa-commenting-o"></i>
        </div>
        <div class="chat-message-num" style="display: none;">0</div>
        <div class="chatBox" ref="chatBox">
            <div class="chatBox-head">
                <div class="chatBox-head-two">
                    <div class="chat-people">
                        <div class="ChatInfoHead">
                            <img src="../other/img/defaultavatar/customerService.jpeg" alt="头像"/>
                        </div>
                        <div class="ChatInfoName">客服1号<span></span></div>
                    </div>
                    <div class="chat-close">关闭</div>
                </div>
            </div>
            <div class="chatBox-info">
                <div class="chatBox-kuang" ref="chatBoxkuang">
                    <div class="chatBox-content">
                        <div class="chatBox-content-demo" id="chatBox-content-demo">

                        </div>
                    </div>
                    <div class="chatBox-send">
                        <div class="div-textarea" contenteditable="true"></div>
                        <div>
                            <button id="chat-fasong" class="btn-default-styles" title="发送"><i class="fa fa-location-arrow"></i>
                            </button>
                        </div>
                    </div>
                </div>
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

<%--<script src="../assets/js/vendor.js"></script>--%>
<script src="../assets/js/active.js"></script>

<script src="../veg/js/bootstrap.min.js"></script>
<script src="../veg/js/jquery.nice-select.min.js"></script>
<script src="../veg/js/jquery-ui.min.js"></script>
<script src="../veg/js/jquery.slicknav.js"></script>
<script src="../veg/js/mixitup.min.js"></script>
<script src="../veg/js/owl.carousel.min.js"></script>
<script src="../veg/js/main.js"></script>

<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/other.js"></script>
<script src="../other/js/sockjs.min.js"></script>

<script src="../layui/layui.js"></script>

<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<!--发送消息-->
<script>

    screenFuc();
    function screenFuc() {
        var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
        //屏幕小于768px时候,布局change
        var winWidth = $(window).innerWidth();
        if (winWidth <= 768) {
            var totalHeight = $(window).height(); //页面整体高度
            $(".chatBox-info").css("height", totalHeight - topHeight);
            var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
            //中间内容高度
            $(".chatBox-content").css("height", infoHeight - 46);
            $(".chatBox-content-demo").css("height", infoHeight - 46);

            // $(".chatBox-list").css("height", totalHeight - topHeight);
            $(".chatBox-kuang").css("height", totalHeight - topHeight);
            $(".div-textarea").css("width", winWidth - 106);
        } else {
            $(".chatBox-info").css("height", 495);
            $(".chatBox-content").css("height", 448);
            $(".chatBox-content-demo").css("height", 448);
            // $(".chatBox-list").css("height", 495);
            $(".chatBox-kuang").css("height", 495);
            $(".div-textarea").css("width", 260);
        }
    }
    (window.onresize = function () {
        screenFuc();
    })();
    //未读信息数量为空时
    var totalNum = $(".chat-message-num").html();
    if (totalNum == "") {
        $(".chat-message-num").css("padding", 0);
    }
    $(".message-num").each(function () {
        var wdNum = $(this).html();
        if (wdNum == "") {
            $(this).css("padding", 0);
        }
    });


    //打开/关闭聊天框
    $(".chatBtn").click(function () {
        $(".chatBox").toggle(10);
        if (!$(".chatBox").is(":hidden")){
            //信息小红点数字归零
            $(".chatContainer").find(".chat-message-num").text(0);
            $(".chatContainer").find(".chat-message-num").hide();;
        }
    })
    $(".chat-close").click(function () {
        $(".chatBox").toggle(10);
    })

    //进聊天页面
    // $(".chat-list-people").each(function () {
    //     $(this).click(function () {
    //         var n = $(this).index();
    //         // $(".chatBox-head-one").toggle();
    //         $(".chatBox-head-two").toggle();
    //         // $(".chatBox-list").fadeToggle();
    //         $(".chatBox-kuang").fadeToggle();

    //         //传名字
    //         $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

    //         //传头像
    //         $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

    //         //聊天框默认最底部
    //         $(document).ready(function () {
    //             $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
    //         });
    //     })
    // });



    //      发送信息
    // $("#chat-fasong").click(function () {
    //     var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
    //     if (textContent != "") {
    //         $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
    //             "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
    //             "<div class=\"right\"> <div class=\"chat-message\"> " + textContent + " </div> " +
    //             "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
    //         //发送后清空输入框
    //         $(".div-textarea").html("");
    //         //聊天框默认最底部
    //         $(document).ready(function () {
    //             $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
    //         });
    //     }
    // });


</script>

<script type="text/javascript">
    $(function() {
        var websocket;
        if('WebSocket' in window) {
            console.log("此浏览器支持websocket");
            websocket = new WebSocket("ws://localhost:8088/EdibleFungusSMS/websocket/"+${user.userid});
            // websocket = new WebSocket("ws://127.0.0.1:8080/WebChat/websocketDemo/88");
            // websocket = new WebSocket("ws://127.0.0.1:8080/WebChat/websocketDemo/88");
        } else if('MozWebSocket' in window) {
            alert("此浏览器只支持MozWebSocket");
        } else {
            alert("此浏览器只支持SockJS");
        }
        websocket.onopen = function(evnt) {
            $(".ChatInfoName").find('span').text("在线...")
            // $(".ChatInfoName").append("链接服务器成功!")
        };
        websocket.onmessage = function(evnt) {
            var us=evnt.data;
            var u=new Array();
            u=us.split(",");
            var ic="/other/img/defaultavatar/customerService.jpeg";
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">"+
                u[1]+
                "</small> </div> " +
                "<div class=\"left\"> " +
                "<div class=\"chat-avatars\"><img src="+".."+ic+" alt=\"头像\" /></div>   " +
                "<div class=\"chat-message\"> " + u[2] + " </div> </div> </div>"
            );
            if ($('.chatBox').is(":hidden")){
                //信息小红点数字加一
                var b=$(".chatContainer").find(".chat-message-num");
                b.show();
                var snum=Number(b.text());
                b.text(snum+1);
            }

            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
            // $("#msg").html($("#msg").html() + "<br/>" + evnt.data);
        };
        websocket.onerror = function(evnt) {};
        websocket.onclose = function(evnt) {
            $(".ChatInfoName").find('span').text("下线...")
            // $(".ChatInfoName").append("与服务器断开了链接!")
        }
        //点击发送
        $('#chat-fasong').bind('click', function() {
            <%--var  userId="${user.userid}";--%>
            var icon="${user.icon}";
            // alert("i:"+icon);
            var date=new Date();
            date=date.format("yyyy-MM-dd hh:mm:ss");
            var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>');
            if (textContent != "") {
                $(".chatBox-content-demo").append(
                    '<div class=\"clearfloat\">' +
                    '<div class=\"author-name\"><small class=\"chat-date\">'+
                    date+
                    '</small> </div> ' +
                    '<div class=\"right\"> <div class=\"chat-message\"> ' +  textContent + '</div> ' +
                    '<div class=\"chat-avatars\"><img src="'+'..'+icon+'" alt=\"头像\" /></div> </div> </div>'
                );

                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            }
            send();
        });

        function send() {
            if(websocket != null) {
                var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>');
                if (textContent != "") {
                    var message = textContent;

                    $.ajax({
                        url:"../message/TestWS?userId=88&message="
                            +message+"&uid=${user.userid}",
                        type:"GET",
                        success: function(result){

                        }
                    });

                    <%--$.ajax({--%>
                    <%--    url:"../message/TestWS?userId=${user.userid}"+"&message="--%>
                    <%--        +message+"&uid="+"",--%>
                    <%--    type:"GET",--%>
                    <%--    success: function(result){--%>

                    <%--    }--%>
                    <%--});--%>
                    $(".div-textarea").html("");

                }

            } else {
                alert('未与服务器链接.');
            }
        }
    });
</script>

<!--立即支付订单-->
<script>
    $('.continue_to_pay').on('click',function(){
        var orderSn=$(this).parent().parent().parent().parent().parent().find('span').eq(0).text();
        var totalPrice=$(this).parent().parent().find('.shoping__cart__total').find('span').eq(0).text();
        window.location.href="../alipay/continueToPay?orderSn="+orderSn+"&totalPrice="+totalPrice;
    });

    // function continueToPayOrder(orderSn,totalPrice){
    //     var orderS=$(this).parent().parent().parent().parent().parent().find('span').eq(0).text();
    //     var tatl=$(this).parent().parent().find('.shoping__cart__total').find('span').text();
    //     // alert("or:"+orderS+"  :ta:"+tatl);
    //    // window.location.href="../alipay/continueToPay?orderSn="+orderSn+"&totalPrice="+totalPrice;
    //
    //
    // }
</script>
<!--取消订单-->
<script>
    $('.cancel_order').on('click',function(){
        var orderSn=$(this).parent().parent().parent().parent().parent().find('span').eq(0).text();
        var txt=  "确定是否取消";
        var option = {
            title: "提示",
            icon: "-48px 0",
            btn: parseInt("0011",2),
            onOk: function(){

                // window.location.href="../order/cancelOrder?orderSn="+orderSn;
                $.ajax({
                    type:"POST",
                    url:"../order/cancelOrder",
                    data:"orderSn="+orderSn,
                    success: function(obj){
                        if(obj.state==0){
                            alert("取消失败");
                        }else{ //
                            GrowlNotification.notify({
                                title: obj.message,
                                type: 'success',
                                position: 'top-center',
                                closeTimeout: 1000
                            });
                            setTimeout( 'window.location.href="../account/showOrders.do"',300);
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
        }
        window.wxc.xcConfirm(txt, "custom", option);

    });
</script>
<!--删除订单-->
<script>
    //删除订单
    $('.del_order').on('click',function(){
        var orderSn=$(this).parent().find('span').eq(0).text();
        var txt=  "确定是否删除";
        var option = {
            title: "提示",
            icon: "-48px 0",
            btn: parseInt("0011",2),
            onOk: function(){
                $.ajax({
                    type:"POST",
                    url:"../order/delOrder",
                    data:"orderSn="+orderSn,
                    success: function(obj){
                        if(obj.state==0){
                            alert("删除失败");
                        }else{ //删除成功
                            GrowlNotification.notify({
                                title: obj.message,
                                type: 'success',
                                position: 'top-center',
                                closeTimeout: 1000
                            });
                            setTimeout( 'window.location.href="../account/showOrders.do"',300);
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
        }
        window.wxc.xcConfirm(txt, "custom", option);
    });
</script>
<script>
    //点击删除照片
    // 删除图片
    $(document).on('click','.img-wrapper .img-close',function(){
        // layer.msg('sdas');
        // $('.img-wrapper').hide();
        $(this).parent().remove();
    });
    //点击评价
    $(".to_evaluate").on('click',function(){
        var orderSn=$(this).parent().parent().parent().parent().parent().find("span").eq(0).text();
        $.ajax({
            type:"GET",
            async: false,//加这个ajax就可以修改全局变量了
            url:"../order/selectOrder",
            data:"orderSn="+orderSn,
            success: function(obj){
                if(obj.state==1){
                    var order=obj.data.order;
                    var orderGoods=obj.data.orderGoods;
                    for (var i=0;i<obj.data.orderGoods.length;i++){
                        $('.comment-list').append(
                            '<div class="layui-card">'+
                            '<input type="hidden" name="comment_userId" value="'+order.userId+'">'+
                            '<input type="hidden" name="comment_orderSn" value="'+order.orderSn+'">'+
                            '<input type="hidden" name="comment_goodsId" value="'+orderGoods[i].goodsId+'">'+
                            '<input type="hidden" name="comment_goodsSpec" value="'+orderGoods[i].spec+'">'+
                            '<div class="layui-card-header" style="height: 80px;">'+
                            '<img src="'+'..'+orderGoods[i].images+'" class="icon">'+
                            '<span>商品:'+orderGoods[i].goodsName+'</span>'+
                            '<span class="span-spec">规格:'+orderGoods[i].spec+'</span>'+
                            '<span>评价:</span>  <div class="ssss start'+orderGoods[i].goodsId+orderGoods[i].spec+'" name="start"></div>'+
                            ' </div>'+
                            '<div class="layui-card-body">'+
                            ' <div>'+
                            '<div class="upload_comment_image" id="'+orderGoods[i].goodsId+orderGoods[i].spec+'">'+
                            '<input type="hidden" name="comment_image">'+
                            ' <button type="button" class="'+orderGoods[i].goodsId+orderGoods[i].spec+'" >'+
                            ' <i class="layui-icon layui-icon-upload-drag" ></i><br>'+
                            ' <p>添加图片</p>'+
                            ' </button>'+
                            ' </div>'+
                            ' <textarea placeholder="请输入内容" class="layui-textarea" name="content" ></textarea>'+
                            '<input type="hidden" name="h_cb"  value="0">'+
                            ' <label class="layui-form-label"> 匿名</label><input type="checkbox" name="close" lay-skin="switch" lay-text="是|否" lay-filter="cb'+orderGoods[i].goodsId+orderGoods[i].spec+'">'+
                            ' </div>'+
                            ' </div>'+
                            ' </div>'
                        );

                        layui.use(['form','rate','upload'], function(){
                            var rate = layui.rate
                                ,form = layui.form
                                ,layer = layui.layer
                                ,layedit = layui.layedit
                                ,laydate = layui.laydate
                                ,$ = layui.jquery
                                ,upload = layui.upload;
                            //渲染
                            var ins1 = rate.render({
                                elem: '.start'+orderGoods[i].goodsId+orderGoods[i].spec  //绑定元素
                                // elem: '#test1'  //绑定元素
                                ,text:true
                                ,setText: function(value){
                                    var arrs = {
                                        '0': ' '
                                        ,'1': '极差'
                                        ,'2': '差'
                                        ,'3': '中等'
                                        ,'4': '好'
                                        ,'5': '非常好'
                                    };
                                    this.span.text(arrs[value] || ( value + "星"));
                                }
                                ,choose: function(value){
                                    // layer.msg(value);
                                    // // layer.msg(orderGoods[i].goodsId);
                                    // var sum=$('.comment-list').find('input[name=h_start]').val();
                                    // var a=$('.comment-list').find('input[name=h_start]').val(sum+value);
                                    // $(".start"+orderGoods[i].goodsId).parent().find('input[name=h_start]').val(value);
                                    // layer.msg("a:"+a.val());
                                }
                            });
                            form.on('switch(cb'+orderGoods[i].goodsId+orderGoods[i].spec+')',function(data){
                                if(this.checked){
                                    this.value=1;
                                    // layer.msg('1');
                                    $(this).parent().find('input[name=h_cb]').val(1);
                                    // layer.msg("v:"+this.value);
                                }else{
                                    this.value=0;
                                    // layer.msg('2');
                                    $(this).parent().find('input[name=h_cb]').val(0);
                                    // layer.msg("v:"+this.value);
                                }
                            });
                            //多图片上传
                            upload.render({
                                elem: '.'+orderGoods[i].goodsId+orderGoods[i].spec
                                ,url: '../comment/updIcon' //改成您自己的上传接口
                                ,multiple: true
                                ,data: {
                                    goodsId: orderGoods[i].goodsId,
                                    userId:orderGoods[i].userId,
                                    spec:orderGoods[i].spec
                                }
                                ,before: function(obj){
                                    //预读本地文件示例，不支持ie8
                                    // obj.preview(function(index, file, result){
                                    //     $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                                    // });
                                }
                                ,done: function(res){
                                    // layer.msg("成功");

                                    //上传完毕
                                    $("#"+res.message).prepend(
                                        '<div class="img-wrapper">'+
                                        '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                                        '<i class="layui-icon img-close">&#x1007;</i>'+
                                        '</div>'
                                    );
                                    // layer.msg("成功12");
                                }
                            });

                            form.render();

                        });

                    }

                }else{
                    layer.msg("删除失败");
                }
            },
            //请求失败
            error:function()
            {
                //错误处理
                alert("系统异常");
            }
        });
        // layer.msg("sn:"+orderSn);
        $(".div_comment").show();
    });
    //点击新增地址显示添加框
    $(".view_Logistics").on('click',function(){
        $(".addmodal").show();
    });
    //点击X隐藏框
    $(".btn_x").on('click',function(){
        $('.comment-list').remove();
        $('#layui-form-comment').prepend(
            '<div class="comment-list"></div>'
        );
        $(this).parent().parent().parent().hide();
    });

    // 显示第一个ul(我的订单)
    $('.hero').find('ul').eq(0).show();
</script>
<script>
    $(function(){
        var condition=$('#condition').val();
        if (condition==1){
            $('.breadcrumb-wrap').find('h1').text('待付款');
            $('.breadcrumb-wrap').find('.account_order').eq(1).toggleClass('a_order');
        }else if (condition==2){
            $('.breadcrumb-wrap').find('h1').text('待发货');
            $('.breadcrumb-wrap').find('.account_order').eq(2).toggleClass('a_order');

        }else if(condition==3){
            $('.breadcrumb-wrap').find('h1').text('待收货');
            $('.breadcrumb-wrap').find('.account_order').eq(3).toggleClass('a_order');

        }else if (condition==4){
            $('.breadcrumb-wrap').find('h1').text('待评价');
            $('.breadcrumb-wrap').find('.account_order').eq(4).toggleClass('a_order');

        }else if (condition==5){
            $('.breadcrumb-wrap').find('h1').text('退货退款');
            $('.breadcrumb-wrap').find('.account_order').eq(5).toggleClass('a_order');

        }else {
            $('.breadcrumb-wrap').find('h1').text('全部订单');
            $('.breadcrumb-wrap').find('.account_order').eq(0).toggleClass('a_order');

        }

    });
</script>

<!--确认收货-->
<script>
    $('.confirm_receipt').on('click',function(){
        var orderSn=$(this).parent().parent().parent().parent().parent().find('span').eq(0).text();
        var txt=  "确定是否收货，一旦确认无法取消";
        var option = {
            title: "提示",
            icon: "-48px 0",
            btn: parseInt("0011",2),
            onOk: function(){
                $.ajax({
                    type:"POST",
                    url:"../order/confirmReceipt",
                    data:"orderSn="+orderSn,
                    success: function(obj){
                        if(obj.state==0){
                            alert("删除失败");
                        }else{ //删除成功
                            GrowlNotification.notify({
                                title: obj.message,
                                type: 'success',
                                position: 'top-center',
                                closeTimeout: 1000
                            });
                            setTimeout( 'window.location.href="../account/showOrders.do"',300);
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
        }
        window.wxc.xcConfirm(txt, "custom", option);
    });
    // function confirmReceipt(orderSn){
    //     var txt=  "确定是否收货，一旦确认无法取消";
    //     var option = {
    //         title: "提示",
    //         icon: "-48px 0",
    //         btn: parseInt("0011",2),
    //         onOk: function(){
    //             $.ajax({
    //                 type:"POST",
    //                 url:"../order/confirmReceipt",
    //                 data:"orderSn="+orderSn,
    //                 success: function(obj){
    //                     if(obj.state==0){
    //                         alert("删除失败");
    //                     }else{ //删除成功
    //                         GrowlNotification.notify({
    //                             title: obj.message,
    //                             type: 'success',
    //                             position: 'top-center',
    //                             closeTimeout: 1000
    //                         });
    //                         setTimeout( 'window.location.href="../account/showOrders.do"',300);
    //                     }
    //                 },
    //                 //请求失败
    //                 error:function()
    //                 {
    //                     //错误处理
    //                     alert("系统异常");
    //                 }
    //             });
    //         }
    //     }
    //     window.wxc.xcConfirm(txt, "custom", option);
    // }
</script>
<!--layui-->
<script>
    layui.use(['form','rate','upload'], function(){
        var rate = layui.rate
            ,form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,$ = layui.jquery
            ,upload = layui.upload;
        //渲染
        var ins1 = rate.render({
            elem: '.div_start'  //绑定元素
            // elem: '#test1'  //绑定元素
            ,text:true
            ,setText: function(value){
                var arrs = {
                    '0': ' '
                    ,'1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '非常好'
                };
                this.span.text(arrs[value] || ( value + "星"));
            }
        });

        //多图片上传
        upload.render({
            elem: '#reimburse_upload_picture'
            ,url: '../order/updPice' //改成您自己的上传接口
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    // $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                });
            }
            ,done: function(res){
                //上传完毕
                $('#reimburse_comment_image').prepend(
                    '<div class="img-wrapper">'+
                    '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                    '<i class="layui-icon img-close">&#x1007;</i>'+
                    '</div>'
                );
            }
        });
        form.on('radio(is_received_goods)', function(data){
            $('#is_received_goods').val(this.value);
            if(this.value==1){
                $('.div_reimburse').find('.div_display').hide();
                $('.div_reimburse').find('.layui-form-item').eq(1).show(400);
            }else{
                $('.div_reimburse').find('.div_display').hide();
                // $('.div_reimburse').find('.layui-form-item').eq(1).hide(400);
                $('.div_reimburse').find('.layui-form-item').eq(2).show(400);
                // $('.div_reimburse').find('.layui-form-item').eq(2).find('input').attr("checked",false);
            }
        });

        form.on('radio(is_retutn_goods)', function(data){
            $('#is_retutn_goods').val(this.value);
            $('.div_reimburse').find('.layui-form-item').eq(2).show(400);

        });

        form.on('radio(select_goods)', function(data){
            $('#select_goods').val(this.value);
            if(this.value==1){
                // layer.msg("1");
                $('.div_reimburse').find('.layui-form-item').eq(3).hide(400);
                $('.div_reimburse').find('.layui-form-item').eq(4).show(400);
                $('.div_reimburse').find('.layui-form-item').eq(5).show(400);
                $('.div_reimburse').find('.layui-form-item').eq(6).show(400);
                $('.div_reimburse').find('.layui-form-item').eq(7).show(400);
                $('.div_reimburse').find('.upload_comment_image').show(400);
            }else{
                // layer.msg("0");
                $('.div_reimburse').find('.layui-form-item').eq(3).show(400);
                $('.div_reimburse').find('.layui-form-item').eq(4).show(400);
                $('.div_reimburse').find('.layui-form-item').eq(5).show(400);
                $('.div_reimburse').find('.layui-form-item').eq(6).show(400);
                $('.div_reimburse').find('.layui-form-item').eq(7).show(400);
                $('.div_reimburse').find('.upload_comment_image').show(400);
            }
        });

        //评价提交
        form.on('submit(comment-submit)', function(data){
            // data.field.switch = data.field.switch ? "on": "off";
            // data.field.switch = data.field.switch ? "on": "off";
            var start="";
            var s=$('.ssss span');
            var is_submit=true;
            var aa=$('.upload_comment_image');
            var ltextarea=$('.layui-textarea');
            aa.each(function(){
                var aaa=$(this).find('img');
                var pics= picturePath(aaa);
                if (pics==null || pics==""){
                    pics="0";
                }
                $(this).find('input[name=comment_image]').val(pics);
            });

            ltextarea.each(function(){
                if ($(this).text()==null || $(this).text()==''){
                    $(this).text(" ");
                }
            });
            // var pics= picturePath('.upload_comment_image img');
            s.each(function(){
                if ($(this).text()===null || $(this).text()===' '){
                    is_submit=false;
                    layer.msg("评价星级不能为空")
                }else{
                    var st=setStart($(this).text())
                    start+=","+st;
                }
            });

            start = start.slice(1, start.length);
            $('.comment-list').parent().find('input[name=h_start]').val(start);
            if(is_submit){
                var data=$('#layui-form-comment').serialize();
                $.ajax({
                    type:"POST",
                    url:"../comment/insertComment",
                    data:data,
                    success: function(obj){
                        if(obj.state==0){
                            alert("评价失败");
                        }else{ //删除成功
                            GrowlNotification.notify({
                                title: '评价成功',
                                type: 'success',
                                position: 'top-center',
                                closeTimeout: 2000
                            });
                            setTimeout( 'window.location.href="../account/showAccount"',2000);
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

            return is_submit;
        });
        //退款提交
        form.on('submit(reimburse_submit)', function(data){
            var is_submit=true;
            var aa=$('#reimburse_comment_image');
            var select_goods=$('#select_goods').val();
            var goods=$('.div_reimburse').find('.layui-form-item').eq(3).find('input[name=gooodsId]');
            var max_money=$('.div_reimburse').find('.layui-form-item').eq(4).find('.layui-word-aux').find('span').text();
            var money=$('.div_reimburse').find('.layui-form-item').eq(4).find('input').val();
            if (select_goods==1){
                if (Number(money)>Number(max_money)){
                    layer.msg("退款金额不能大于"+max_money);
                    is_submit=false;
                }
            }else{
                var is_select=false;
                var stocks=new Array();
                var prices=new Array();
                var ids=new Array();
                goods.each(function(){
                    if ($(this).is(":checked")){
                        is_select=true;
                        var stock=$(this).parent().find(".refund-goodsname").eq(2).find("span").text();
                        var price=$(this).parent().find(".refund-goodsname").eq(3).find("span").text();
                        var id=$(this).val();
                        stocks.push(stock);
                        prices.push(price);
                        ids.push(id);
                    }
                });
                if (!is_select){
                    layer.msg("未选择商品");
                    is_submit=false;
                }else{
                    var sum=0;
                    for (var i=0;i<stocks.length;i++){
                        var total=Number(stocks[i])*Number(prices[i]);
                        sum=Number(sum)+total;
                    }
                    if (Number(sum)<Number(money)){
                        layer.msg("退款金额不能大于"+sum);
                        is_submit=false;
                    }
                    $('.div_reimburse').find('#ids').val(ids);
                }

            }
            aa.each(function(){
                var aaa=$(this).find('img');
                var pics= picturePath(aaa);
                if (pics==null || pics==""){
                    pics="0";
                }
                $(this).find('input[name=comment_image]').val(pics);
            });

            var data=$('#from_reimburse').serialize();
            if (is_submit){
                // layer.msg("data:"+data)
                $.ajax({
                    type:"POST",
                    url:"../order/reimburse",
                    data:data,
                    success: function(obj){
                        if(obj.state==0){
                            alert("提交失败");
                        }else{ //删除成功
                            GrowlNotification.notify({
                                title: '提交成功',
                                type: 'success',
                                position: 'top-center',
                                closeTimeout: 2000
                            });
                            setTimeout( 'window.location.href="../account/showAccount"',2000);
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


            return is_submit;
        });
    });
    //获取div中img的src  输入('.add-pic img')
    function picturePath(imgPath){
        var folder="";
        var pic="";
        if ($(imgPath).length!=0){
            $(imgPath).each(function(){
                var img=$(this).attr("src");
                //截取文件夹名
                folder=img.substring(img.indexOf('/'),img.lastIndexOf('/')+1);
                //截取图片文件名
                var document=img.substring(img.lastIndexOf('/')+1);
                pic+=":"+document;
            });
            pic=pic.slice(1,pic.length);
            if (folder!=""){
                if ($(imgPath).length>1){
                    pic=folder+":"+pic;
                }else{
                    pic=folder+pic;
                }
            }
        }
        return pic;
    };
    function setStart(start){
        switch(start){
            case '极差':
                return 1;
                break;
            case '差':
                return 2;
                break;
            case '中等':
                return 3;
                break;
            case '好':
                return 4;
                break;
            case '非常好':
                return 5;
                break;
        }
    }
</script>
<!--jq时间转换-->
<script>
    //jq时间转换
    Date.prototype.format = function(fmt)
    {
        var o = {
            "M+" : this.getMonth()+1, //月份
            "d+" : this.getDate(), //日
            "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
            "H+" : this.getHours(), //小时
            "m+" : this.getMinutes(), //分
            "s+" : this.getSeconds(), //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S" : this.getMilliseconds() //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }

</script>
</body>

</html>
