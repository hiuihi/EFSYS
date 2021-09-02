
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../layui/css/layui.css" rel="stylesheet"   media="all">
    <link href="../other/css/back.css" rel="stylesheet"   media="all">
    <link href="../other/css/1.css" rel="stylesheet"   media="all">

</head>
<style>
    /* 添加修改框添加右侧滑动条 */
    .div_Logistics{
        height: 540px;
        overflow-x:hidden;
        overflow-y: scroll ;
    }
    .layui-tab-brief a:hover{
        color: #009688;
    }

</style>
<body style="background-color: white;">


<form class="layui-form" action="../border/showOrder.action" style="margin-top: 2%;">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">订单号</label>
            <div class="layui-input-inline">
                <input type="text" name="osn"  autocomplete="off" class="layui-input" value="${osn}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">买家</label>
            <div class="layui-input-inline">
                <input type="text" name="uid"  autocomplete="off" class="layui-input" value="${uid}">
            </div>
        </div>
        <div class="layui-inline">
            <button type="submit" class="layui-btn">
                <i class="layui-icon">&#xe615;</i>
            </button>
        </div>
    </div>

</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">  </fieldset>


<div class="layui-tab layui-tab-brief" id="div-tab">
    <ul class="layui-tab-title">
        <input type="hidden"  id="input_hide" value="${status}">
        <li><a href="../border/showOrder.action">全部订单</a></li>
        <li><a href="../border/showOrder.action?orderStatus=0">等待付款<span class="layui-badge">${result[0]}</span></a></li>
        <li><a href="../border/showOrder.action?orderStatus=1">等待发货<span class="layui-badge">${result[1]}</span></a></li>
        <li><a href="../border/showOrder.action?orderStatus=2">已发货</a></li>
        <li><a href="../border/showOrder.action?orderStatus=3">待评价<span class="layui-badge">${result[3]}</span></a></li>
        <li><a href="../border/showOrder.action?orderStatus=4">成功</a></li>

        <li><a href="../border/showOrder.action?orderStatus=6">退款<span class="layui-badge">${result[6]}</span></a></li>

        <li><a href="../border/showOrder.action?orderStatus=5">关闭</a></li>
    </ul>
    <!-- <div class="layui-tab-content">
      <div class="layui-tab-item layui-show">内容1</div>
      <div class="layui-tab-item">内容2</div>
      <div class="layui-tab-item">内容3</div>
      <div class="layui-tab-item">内容4</div>
      <div class="layui-tab-item">内容5</div>
    </div> -->
</div>





<div class="layui-form" style="padding: 0px 10px;" >
    <!-- <div style="margin-left: 20px;">
          <button type="button" class="layui-btn" id="add-btn">添加</button>
           <button type="button" class="layui-btn" id="del-btn">删除</button>
      </div> -->


    <!-- 标题 -->
    <div class="order-head" >
        <table>
            <thead>
            <tr>
                <th class="all_checkbox"><input type="checkbox" lay-skin="primary" class="allcb" lay-filter="check_all" style="float: left;"/>全选</th>
                <th class="shoping_product">商品</th>
                <th >单价（元）</th>
                <th >数量</th>
                <th >实付（元）</th>
                <th >售后</th>
                <th >买家</th>
                <th >交易状态</th>

            </tr>
            </thead>
        </table>
    </div>
    <c:forEach items="${orderGoodsVos}" var="orderGoodsVo">
        <div class="order-list">
            <table >
                <thead>
                <div class="breadcrumb-wrap1">
                    <p>
                        <input type="checkbox"  lay-skin="primary" lay-filter="authority" class="authority" name="cb" value="${orderGoodsVo.order.orderSn}">
                        订单号: <span>${orderGoodsVo.order.orderSn}</span> &nbsp;&nbsp;
                        下单时间: <span><fmt:formatDate value="${orderGoodsVo.order.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </p>
                </div>

                </thead>
                <tbody >
                <c:forEach items="${orderGoodsVo.orderGoods}" var="orderGoods" varStatus="orderGood">
                    <tr >
                        <td class="order_item" >
                            <img  src="..${orderGoods.images}" alt="">
                            <h5 >
                                <a href="javascript:void(0)">${orderGoods.goodsName}</a><br>
                                规格:<span>${orderGoods.spec}</span>
                            </h5>

                        </td>
                        <td class="order_price" >
                            ￥<span>${orderGoods.price}</span>
                        </td>
                        <td class="order_quantity" >
                            <span>${orderGoods.stock}</span>
                        </td>
                        <c:if test="${orderGood.first}">
                            <td class="order_total" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                ￥<span>${orderGoodsVo.order.totalAmount}</span>
                            </td>
                            <td class="order_after" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                <c:if test="${orderGoodsVo.order.orderStatus==6}">
                                    <a href="../border/showReimburse.action?orderSn=${orderGoodsVo.order.orderSn}" >退货/退款</a>
<%--                                    <a href="javascript:void (0)" onclick="reimburse(${orderGoodsVo.order.orderSn})">退货/退款</a>--%>
                                </c:if>
                            </td>
                            <td class="order_handle" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
                                <span>${orderGoodsVo.order.userId}</span>
                            </td>
                            <td class="order_status" rowspan="${fn:length(orderGoodsVo.orderGoods)}">
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
                                        <span>待评价</span>
                                    </c:when>
                                    <c:when test="${orderGoodsVo.order.orderStatus==4}">
                                        <span>已完成</span>
                                    </c:when>
                                    <c:when test="${orderGoodsVo.order.orderStatus==5}">
                                        <span>已关闭</span>
                                    </c:when>
                                    <c:when test="${orderGoodsVo.order.orderStatus==6}">
                                        <span>退货退款</span>
                                    </c:when>
                                </c:choose>
                                <br>
                                <a href="../border/showOrderDetails.action?orderSn=${orderGoodsVo.order.orderSn}">订单详情</a><br>
                                <c:if test="${orderGoodsVo.order.orderStatus==1}">
                                    <a href="javascript:void(0)" class="deliver_goods">发&nbsp;&nbsp;货</a>
                                </c:if>
<%--                                <c:if test="${orderGoodsVo.order.orderStatus>1}">--%>
<%--                                    <a href="javascript:void(0)" class="view_Logistics">查看物流</a>--%>
<%--                                </c:if>--%>
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
                    <li><a class="previoused"><i class="layui-icon layui-icon-left"></i></a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="previous" href="../border/showOrder.action?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}&orderStatus=${orderStatus}&osn=${osn}&uid=${uid}"><i class="layui-icon layui-icon-left"></i></a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                <c:choose>
                    <c:when test="${pageBean.currentPage==i}">
                        <li class="active"><a href="../border/showOrder.action?currentPage=${i}&rows=${pageBean.rows}&orderStatus=${orderStatus}&osn=${osn}&uid=${uid}">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="../border/showOrder.action?currentPage=${i}&rows=${pageBean.rows}&orderStatus=${orderStatus}&osn=${osn}&uid=${uid}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${pageBean.currentPage!=pageBean.totalPage}">
                    <li><a class="next" href="../border/showOrder.action?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}&orderStatus=${orderStatus}&osn=${osn}&uid=${uid}"><i class="layui-icon layui-icon-right"></i></a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="nexted"><i class="layui-icon layui-icon-right"></i></a></li>
                </c:otherwise>
            </c:choose>
            <div class="div_pagination">&nbsp;&nbsp;
                共&nbsp;<span>${pageBean.totalCount}</span>&nbsp;条记录,
                共&nbsp;<span>${pageBean.totalPage}</span>&nbsp;页
            </div>
        </ul>
    </div>
</div>


<!-- 物流信息 -->
<div class="logistics" >
    <div class="layui-card logistics-modal" >
        <div class="layui-card-header" style="background-color: #eee;">物流信息   顺丰快递   运输中<button style="float: right;" class="layui-icon btn_x" >&#x1007;</button> </div>
        <div class="layui-card-body" id="div_Logistics">
            <ul class="layui-timeline">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#x1005;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">已签收</h3>
                        <p>
                            2021-03-12 14:23:11 您的快递已签收
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe613;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">派送中</h3>
                        <p>2021-03-12 10:18:16【杭州市】浙江省杭州市大运河树人城院分部派件员当前正在为您派件</p>


                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe609;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">运输中</h3>
                        <p>2021-03-12</p>
                        <ul>
                            <li>10:18:16 浙江省杭州市大运河树人城院分部 已收入</li>
                            <li>07:38:53 浙江省杭州市大运河公司 已收入</li>
                            <li>04:13:20 杭州石桥城配中心公司 已发出,下一站 浙江省杭州市大运河</li>
                            <li>03:50:43 杭州石桥城配中心公司 已打包</li>
                            <li>03:29:32 杭州石桥城配中心公司 已收入</li>
                            <li>01:48:52 杭州转运中心公司 已发出,下一站 杭州石桥城配中心</li>
                            <li>01:46:11 杭州转运中心公司 已收入</li>
                        </ul>

                        <p>2021-03-09</p>
                        <ul>
                            <li>21:42:29 广东宝安接驳点公司 已发出,下一站 杭州转运中心</li>
                            <li>21:40:21 广东宝安接驳点公司 已收入</li>
                            <li>19:21:06 广东省深圳市宝安区光明新区公司 已发出,下一站 广东宝安接驳点</li>
                            <li>19:12:47 广东省深圳市宝安区光明新区公司 已打包</li>
                            <li>08:31:46 广东省深圳市宝安区光明新区公司 已收件</li>
                            <li>08:01:03 包裹正在等待揽收 </li>
                        </ul>

                    </div>
                </li>

                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe60a;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">已下单</h3>
                        <p>2021-03-08 23:18:57 商品已经下单</p>

                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 发货 -->
<div class="div-deliver-goods" >
    <div class="layui-card deliver-goods-modal" >
        <div class="layui-card-header" style="background-color: #eee;">发货<button style="float: right;" class="layui-icon btn_x" >&#x1007;</button> </div>
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">订单号</label>
                    <div class="layui-input-block">
                        <input type="text" name="orderSn" autocomplete="off" class="layui-input layui-disabled" disabled>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">快递公司</label>
                    <div class="layui-input-block">
                        <input type="text" name="deliveryCompany" autocomplete="off" class="layui-input" lay-verify="required">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">快递单号</label>
                    <div class="layui-input-block">
                        <input type="text" name="deliverySn" autocomplete="off" class="layui-input" lay-verify="required">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-left: 0px;">
                    <div class="layui-input-block">
                        <button class="layui-btn "  lay-submit lay-filter="deliver-goods-submit">确认</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<!-- 退款 -->
<div class="div_reimburse" >
    <div class="layui-card reimburse-modal-dialog">
        <div class="layui-card-header" style="background-color: #eee;">退货退款<button style="float: right;" class="layui-icon btn_x" >&#x1007;</button> </div>
        <div class="layui-card-body div_reimburse-y" style="background-color: #fff;">
            <form class="layui-form layui-form-pane" action="">


                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">订单号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="orderSn"  autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">是否收到货</label>
                        <div class="layui-input-inline">
                            <input type="text" name="isReceivedGoods"  autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">是否需退货</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="isRetutnGoods"  autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">退款</label>
                        <div class="layui-input-inline">
                            <input type="text" name="isAllReimburse"  autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">退款商品</label>
                    <div class="layui-input-block">
<%--                        <div class="div-refund-goods">--%>
<%--                            <img src="../other/img/cart/cart-1.png">--%>
<%--                            <div class="refund-goodsname"><span>香dsadsadasdsadsaddasdddddddddddddddd菇</span></div>--%>
<%--                            <div class="refund-goodsname">规格:<span>S</span></div>--%>
<%--                            <div class="refund-goodsname">数量:<span>99</span></div>--%>
<%--                            <div class="refund-goodsname">单价:<span>399.59</span>元</div>--%>
<%--                        </div>--%>

                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">退款金额</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="price"  autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">退款理由</label>
                        <div class="layui-input-inline">
                            <input type="text" name="reason"  autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">退款说明</label>
                    <div class="layui-input-block">
                        <input type="text" name="caption" autocomplete="off" class="layui-input" readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">退款凭证</label>
                    <div class="layui-input-block" >

                    </div>
                </div>
<%--                <div class="upload_comment_image">--%>
<%--                    <input type="hidden" name="comment_image">--%>
<%--                </div>--%>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-danger"  lay-filter="reimburse-submit-off">拒绝</button>
                        <button type="submit" class="layui-btn " lay-submit="" lay-filter="reimburse-submit-on">同意</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../other/js/back.js"></script>
<script>
    //显示快递
    $('.view_Logistics').on('click',function(){
        $('.logistics').show();
    })
    //关闭弹出框
    $('.btn_x').on('click',function(){
        $(this).parent().parent().parent().hide();
    })
    //显示发货框
    $('.deliver_goods').on('click',function(){
        var sn=$(this).parent().parent().parent().parent().parent().find('.authority').val();
        // layer.msg("sn:"+sn);
        $('.div-deliver-goods').find('input[name=orderSn]').val(sn);
        $('.div-deliver-goods').find('input[name=deliveryCompany]').val('');
        $('.div-deliver-goods').find('input[name=deliverySn]').val('');
        $('.div-deliver-goods').show();
    })

</script>
<script>
    var status=$('#input_hide').val();
    var a=$('#div-tab').find('li');
    switch(status){
        case '0':
            a.eq(1).addClass('layui-this');
            break;
        case '1':
            a.eq(2).addClass('layui-this');
            break;
        case '2':
            a.eq(3).addClass('layui-this');
            break;
        case '3':
            a.eq(4).addClass('layui-this');
            break;
        case '4':
            a.eq(5).addClass('layui-this');
            break;
        case '5':
            a.eq(7).addClass('layui-this');
            break;
        case '6':
            a.eq(6).addClass('layui-this');
            break;
        default:
            a.eq(0).addClass('layui-this');
            break;
    }
</script>
<!--退款-->
<script>
   function reimburse(orderSn){
       $.ajax({
           type:"POST",
           url:"../order/selreimburse",
           data:"orderSn="+orderSn,
           dataType:"json",
           success: function(obj){
               if(obj.state==0){
                   alert("查询失败");
               }else{
                   var re=$('.div_reimburse');
                   re.find('input[name=orderSn]').val('');
                   re.find('input[name=isReceivedGoods]').val('');
                   re.find('input[name=isRetutnGoods]').val('');
                   re.find('input[name=isAllReimburse]').val('');
                   re.find('input[name=price]').val('');
                   re.find('input[name=reason]').val('');
                   re.find('input[name=caption]').val('');
                   re.find('.layui-form-item').eq(2).find('.layui-input-block').find('.div-refund-goods').remove();
                   re.find('.layui-form-item').eq(5).find('.layui-input-block').find('img').remove();

                    var reim=obj.data.reimburse;
                    var orderGoods=obj.data.orderGoods;
                    re.find('input[name=orderSn]').val(reim.orderSn);
                    var isReceivedGoods="";
                    var isRetutnGoods="";
                    var isAllReimburse="";
                    if (reim.isReceivedGoods==1){
                        isReceivedGoods="是";
                    }else if (reim.isReceivedGoods==0){
                        isReceivedGoods="否";
                    }
                   if (reim.isRetutnGoods==1){
                       isRetutnGoods="无需";
                   }else if (reim.isRetutnGoods==0){
                       isRetutnGoods="无需";
                   }
                   if (reim.isAllReimburse==1){
                       isAllReimburse="全额退款";
                   }else if (reim.isAllReimburse==0){
                       isAllReimburse="部分退款";
                   }
                    re.find('input[name=isReceivedGoods]').val(isReceivedGoods);
                    re.find('input[name=isRetutnGoods]').val(isRetutnGoods);
                    re.find('input[name=isAllReimburse]').val(isAllReimburse);
                    re.find('input[name=price]').val(reim.price);
                    re.find('input[name=reason]').val(reim.reason);
                    re.find('input[name=caption]').val(reim.caption);
                    var goodsIds=new Array();
                    goodsIds=reim.goodsIds.split(',');
                   // layer.msg(goodsIds.length);
                    for (var i=0;i<goodsIds.length;i++){
                        for (var j=0;j<orderGoods.length;j++){
                                // layer.msg(goodsIds[i]+","+orderGoods[j].goodsId);
                            if (goodsIds[i]==orderGoods[j].goodsId){
                                // layer.msg("发货");
                                re.find('.layui-form-item').eq(2).find('.layui-input-block').append(
                                    '<div class="div-refund-goods">'+
                                    '<img src="..'+orderGoods[j].images+'">'+
                                    '<div class="refund-goodsname"><span>'+orderGoods[j].goodsName+'</span></div>'+
                                    ' <div class="refund-goodsname">规格:<span>'+orderGoods[j].spec+'</span></div>'+
                                    ' <div class="refund-goodsname">数量:<span>'+orderGoods[j].stock+'</span></div>'+
                                    '<div class="refund-goodsname">单价:<span>'+orderGoods[j].price+'</span>元</div>'+
                                    '</div>');
                            }
                        }
                        // orderGoods.each(function(){
                        //     layer.msg(goodsIds[i]+","+$(this).goodsId);
                        //     if (goodsIds[i]===$(this).goodsId){
                        //         re.find('.layui-form-item').eq(4).find('.layui-input-block').append(
                        //         '<div class="div-refund-goods">'+
                        //             '<img src="..'+$(this).images+'">'+
                        //             '<div class="refund-goodsname"><span>'+$(this).goodsName+'</span></div>'+
                        //             ' <div class="refund-goodsname">规格:<span>'+$(this).spec+'</span></div>'+
                        //             ' <div class="refund-goodsname">数量:<span>'+$(this).stock+'</span></div>'+
                        //             '<div class="refund-goodsname">单价:<span>'+$(this).price+'</span>元</div>'+
                        //         '</div>'
                        //         );
                        //     }
                        // });
                    }



                    if (reim.images!=null && reim.images!='' && reim.images!=0){
                        var img=new Array();
                       img= reim.images.split(",");
                       if (img.length==1){
                           re.find('.upload_comment_image').append(
                               '<img src="..'+img+'" class="reimburse_img">'
                           );
                       }else{
                           for (var i=1;i<img.length;i++){
                               re.find('.layui-form-item').eq(5).find('.layui-input-block').append(
                                   '<img src="..'+img[0]+img[i]+'" class="reimburse_img">'
                               );
                           }
                       }
                    }

                   $('.div_reimburse').show();
                   // GrowlNotification.notify({
                   //     title: '保存成功',
                   //     type: 'success',
                   //     position: 'top-center',
                   //     closeTimeout: 1000
                   // });
                   // setTimeout( 'window.location.href="../account/showAccount"',200);
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
<script>
    layui.use(['form','element', 'layedit', 'laydate','upload','laypage','rate'], function(){
        var form = layui.form
            ,element = layui.element
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,upload = layui.upload
            ,laypage = layui.laypage
            ,rate = layui.rate
            ,$=layui.jquery;

        // 实现 全选 反选
        form.on('checkbox(check_all)',function(data){
            $('.layui-form').find("input[name=cb]").prop("checked",this.checked);
            form.render('checkbox');
        });
        /**
         * 以下代码实现:
         * 1 当子项全部选中时,全选被选中
         * 2 当子项未全部选中时,全选不选中
         */
        form.on('checkbox(authority)',function(data){
            var item = $(".authority");
            var sum=0;
            for(var i=0;i<item.length;i++){
                if(item[i].checked == false){
                    $(".allcb").prop("checked", false);
                    form.render('checkbox');
                }
                else{
                    sum++;
                }
            }
            if(sum==item.length){
                $(".allcb").prop("checked", true);
                form.render('checkbox');
            }
        });




        //监听指定开关
        // form.on('switch(cb_discount)', function(data){
        //     if(this.checked){
        //         this.value=1;
        //         $('.hidden_promotion').show(400);
        //         // layer.msg("v:"+this.value);
        //     }else{
        //         this.value=0;
        //         $('.hidden_promotion').hide(400);
        //         // layer.msg("v:"+this.value);
        //     }

        // });

        //监听提交
        form.on('submit(deliver-goods-submit)', function(data){
            var orderSn=data.field.orderSn;
            var deliveryCompany=data.field.deliveryCompany;
            var deliverySn=data.field.deliverySn;
            var status=$('#input_hide').val();
            // layer.msg("sn:"+orderSn+deliveryCompany+deliverySn+"s:"+status);
            $.ajax({
                type:"POST",
                url:"../border/updOrderDelivery",
                data:"orderSn="+orderSn+"&deliveryCompany="+deliveryCompany+"&deliverySn="+deliverySn,
                success: function(obj){
                    if(obj.state==0){
                        layer.msg("发货成功");
                        // setTimeout( 'window.location.href="../border/showOrder.action?orderStatus="+obj.data',200);
                        window.location.href="../border/showOrder.action?orderStatus="+status;
                    }else{
                        layer.msg("发货失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return false;
        });
        //同意退款
        form.on('submit(reimburse-submit-on)', function(data){
            var orderSn=data.field.orderSn;
            $.ajax({
                type:"POST",
                url:"../order/updOrderDelivery",
                data:"orderSn="+orderSn+"&deliveryCompany="+deliveryCompany+"&deliverySn="+deliverySn,
                success: function(obj){
                    if(obj.state==0){
                        layer.msg("发货成功");
                        // setTimeout( 'window.location.href="../border/showOrder.action?orderStatus="+obj.data',200);
                        window.location.href="../border/showOrder.action?orderStatus="+status;
                    }else{
                        layer.msg("发货失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return false;
        });
        //拒绝退款
        form.on('submit(reimburse-submit-off)', function(data){
            var orderSn=data.field.orderSn;
            $.ajax({
                type:"POST",
                url:"../border/updOrderDelivery",
                data:"orderSn="+orderSn+"&deliveryCompany="+deliveryCompany+"&deliverySn="+deliverySn,
                success: function(obj){
                    if(obj.state==0){
                        layer.msg("发货成功");
                        // setTimeout( 'window.location.href="../border/showOrder.action?orderStatus="+obj.data',200);
                        window.location.href="../border/showOrder.action?orderStatus="+status;
                    }else{
                        layer.msg("发货失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return false;
        });

        //表单赋值
        // layui.$('#LAY-component-form-setval').on('click', function(){
        //     form.val('example', {
        //         "username": "贤心" // "name""value"
        //         ,"interest": 1
        //         ,"like[write]": true //复选框选中状态
        //         ,"close": true //开关状态
        //         ,"sex": "女"
        //         ,"desc": "我爱 layui"
        //     });
        // });

        //表单取值
        // layui.$('#LAY-component-form-getval').on('click', function(){
        //     var data = form.val('example');
        //     alert(JSON.stringify(data));
        // });

    });
</script>
</body>
</html>
