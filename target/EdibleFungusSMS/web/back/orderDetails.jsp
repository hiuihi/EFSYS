
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../layui/css/layui.css" rel="stylesheet"   media="all">
    <link href="../other/css/back.css" rel="stylesheet"   media="all">
    <link href="../other/css/2.css" rel="stylesheet"   media="all">

</head>
<style>


</style>
<body style="background-color: white;overflow-x: hidden;/*x轴禁止滚动*/">



<!-- 订单确认条 -->
<%--<div class="process-wrap1" >--%>
<%--    <div class="process1 text-center active">--%>
<%--        <dt><img src="../../other/img/orderdetails/orderinfo_img1_3.png" alt=""/></dt>--%>
<%--        <dd>--%>
<%--            <p>提交订单</p>--%>
<%--            <span>2016.01.01 13:00</span>--%>
<%--        </dd>--%>
<%--        <!-- <p><span>确认订单</span></p>--%>
<%--        <h3>确认订单</h3> -->--%>
<%--    </div>--%>
<%--    <div class="process1 text-center active">--%>
<%--        <dt><img src="../../other/img/orderdetails/orderinfo_img2_2.png" alt=""/></dt>--%>
<%--        <dd>--%>
<%--            <p>付款成功</p>--%>
<%--            <span>2016.01.01 13:00</span>--%>
<%--        </dd>--%>
<%--        <!-- <p><span>支付</span></p>--%>
<%--        <h3>支付</h3> -->--%>
<%--    </div>--%>
<%--    <div class="process1 text-center active">--%>
<%--        <img src="../../other/img/orderdetails/orderinfo_img3.png" alt=""/>--%>
<%--        <p>运输中</p>--%>
<%--        <span>2016.01.01 13:00</span>--%>
<%--        <!-- <p><span>支付成功</span></p>--%>
<%--        <h3>支付成功</h3> -->--%>
<%--    </div>--%>
<%--    <div class="process1 text-center active">--%>
<%--        <dt><img src="../../other/img/orderdetails/orderinfo_img4.png" alt=""/></dt>--%>
<%--        <dd>--%>
<%--            <p>确认收货</p>--%>
<%--            <span>2016.01.01 13:00</span>--%>
<%--        </dd>--%>
<%--        <!-- <p><span>支付成功</span></p>--%>
<%--        <h3>支付成功</h3> -->--%>
<%--    </div>--%>
<%--    <div class="process1 text-center">--%>
<%--        <dt><img src="../../other/img/orderdetails/orderinfo_img5.png" alt=""/></dt>--%>
<%--        <dd>--%>
<%--            <p>评价</p>--%>
<%--            <span>2016.01.01 13:00</span>--%>
<%--        </dd>--%>
<%--        <!-- <p><span>支付成功</span></p>--%>
<%--        <h3>支付成功</h3> -->--%>
<%--    </div>--%>
<%--</div>--%>
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
<div class="shop_order">

<%--    <div class="layui-card" style="border: 1px solid #e2e2e2;">--%>
<%--        <div class="layui-card-header" style="font-weight: 800;">物流信息</div>--%>
<%--        <div class="layui-card-body">--%>
<%--            <!--物流信息-->--%>
<%--            <div id="container" class="clear">--%>
<%--                <p>物流公司：顺丰快递</p>--%>
<%--                <p>运单号码：12345678</p>--%>
<%--                <!--物流-->--%>
<%--                <div class="adress_choice">--%>

<%--                    <div  class="base" >--%>
<%--                        <i>  物流跟踪：</i>--%>
<%--                        <p >--%>
<%--                            2021-01-03 13：34：33 【杭州市】快递到达杭州转运中心--%>
<%--                        </p>--%>
<%--                        <p >--%>
<%--                            2021-01-02 13：34：33 【广东省】快递从广东转运中心发出--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            2021-01-01 13：34：33 【广东省】快递到达广东转运中心--%>
<%--                        </p>--%>

<%--                    </div>--%>

<%--                    <a id="more" href="javascript:void(0);" >--%>
<%--                        更多信息↓--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <c:if test="${orderGoodsVo.order.orderStatus!=0}">
        <div class="layui-card" style="border: 1px solid #e2e2e2;">
            <div class="layui-card-header" style="font-weight: 800;">物流信息</div>
            <div class="layui-card-body">
                <!--物流信息-->
                <div id="container" class="clear">
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
                                            退货退款
                                        </c:when>
                                    </c:choose>

                                </td>
                            </c:if>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>







<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../other/js/back.js"></script>
<script src="../other/js/other.js"></script>
<script>
    // 订单详情
    // 收起与展开更多物流信息
    // $("#more").click(function(){
    //     if($(this).hasClass("upup")){
    //         $(this).siblings().find('p').hide();
    //         $(this).siblings().find('p').eq(0).show();
    //         $("#more").html("更多信息↓");
    //         $(this).removeClass("upup");
    //     }else{
    //         $(this).siblings().find('p').show();
    //         $("#more").html("收起信息↑");
    //         $("#more").addClass("upup");
    //     }
    // })
    // 订单详情结束
</script>
<script>
    $(function () {
        var orderStatus=$('.process-wrap1').find('input').eq(0).val();
        //进度条
        $.processBar(orderStatus,'b');
        //alert("1:"+orderStatus);

    });
</script>

</body>
</html>