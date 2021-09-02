
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../layui/css/layui.css" rel="stylesheet">

    <link href="../other/css/reimburse_b.css"rel="stylesheet" >
    <link href="../other/css/back.css"rel="stylesheet" >

</head>
<style>


</style>
<body style="background-color: white;overflow-x: hidden;/*x轴禁止滚动*/">



<div style="height:100%;">
    <div class="rebinding-box">
        <!-- <div class="box-title"> -->
        <!-- <h2 class="mtb5">退货退款</h2> -->
        <!-- <i>为了保障您的帐户安全，请谨慎填写</i> -->
        <!-- </div> -->



        <div class="box-timeline">
            <ul class="text-center" style="width: 1000px;">
                <li>
                    买家申请退款
                    <div class="box-num1">
                        1
                    </div>
                </li>
                <li class="ml45">
                    卖家处理退款
                    <div class="box-outside1 outside1ab" id="outside1abs">
                        <div class="box-num2 num2ab">
                            2
                        </div>
                    </div>
                </li>
                <li class="ml45">
                    <c:if test="${reimburse.isRetutnGoods==1}">
                        买家退货
                    </c:if>
                    <c:if test="${reimburse.isRetutnGoods==0}">
                        买家无需退货
                    </c:if>

                    <div class="box-outside2 outside2ab" id="outside2as">
                        <div class="box-num3 num3ab">
                            3
                        </div>
                    </div>
                </li>
                <li class="ml45">
                    退款成功
                    <div class="box-outside3 outside3a" id="outside3as">
                        <div class="box-num4 num4a">
                            4
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <!--第一步-->
        <div class="onebox-form" id="oneform">
            <div class="oneform">


<%--                <div class="onebtn-box">--%>
<%--                    <button class="onebtn" id="onebtn" onclick="fun()">提交</button>--%>
<%--                </div>--%>
            </div>
        </div>
        <!--第二步-->
        <div class="twobox-form" id="twoform">
            <div class="twoform">
                <div class="twoform-box">
                    <input type="hidden" id="deliveryStatus"  value="${reimburse.deliveryStatus}">
                    <c:choose>
                        <c:when test="${reimburse.sellerOpinion==0}">
                            <span>已拒绝买家退款申请，等待协商</span>
                        </c:when>
                        <c:otherwise>
                            <span>买家退款申请信息</span>
                            <form class="layui-form layui-form-pane" action="" style="margin-top: 20px;">


                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">订单号</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="orderSn"  autocomplete="off" class="layui-input" readonly="readonly" value="${reimburse.orderSn}">
                                        </div>
                                    </div>

                                    <div class="layui-inline">
                                        <label class="layui-form-label">是否收到货</label>
                                        <div class="layui-input-inline">
                                            <c:if test="${reimburse.isReceivedGoods==1}">
                                                <input type="text" name="isReceivedGoods"  autocomplete="off" class="layui-input" readonly="readonly" value="是">
                                            </c:if>
                                            <c:if test="${reimburse.isReceivedGoods==0}">
                                                <input type="text" name="isReceivedGoods"  autocomplete="off" class="layui-input" readonly="readonly" value="否">
                                            </c:if>

                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">是否需退货</label>
                                        <div class="layui-input-inline">
                                            <c:if test="${reimburse.isRetutnGoods==1}">
                                                <input type="tel" name="isRetutnGoods"  autocomplete="off" class="layui-input" readonly="readonly" value="需要">
                                            </c:if>
                                            <c:if test="${reimburse.isRetutnGoods==0}">
                                                <input type="tel" name="isRetutnGoods"  autocomplete="off" class="layui-input" readonly="readonly" value="不需要">
                                            </c:if>

                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">退款</label>
                                        <div class="layui-input-inline">
                                            <c:if test="${reimburse.isAllReimburse==1}">
                                                <input type="text" name="isAllReimburse"  autocomplete="off" class="layui-input" readonly="readonly" value="全额退款">
                                            </c:if>
                                            <c:if test="${reimburse.isAllReimburse==0}">
                                                <input type="text" name="isAllReimburse"  autocomplete="off" class="layui-input" readonly="readonly" value="部分退款">
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                                <div class="layui-form-item">
                                    <label class="layui-form-label">退款商品</label>
                                    <div class="layui-input-block">
                                        <c:forTokens items="${reimburse.goodsIds}" delims="," var="gid">
                                            <c:forEach items="${orderGoodsVo.orderGoods}" var="orderGoods">
                                                <c:if test="${gid==orderGoods.goodsId}">
                                                    <div class="div-refund-goods">
                                                        <img src="..${orderGoods.images}">
                                                        <div class="refund-goodsname"><span>${orderGoods.goodsName}</span></div>
                                                        <div class="refund-goodsname">规格:<span>${orderGoods.spec}</span></div>
                                                        <div class="refund-goodsname">数量:<span>${orderGoods.stock}</span></div>
                                                        <div class="refund-goodsname">单价:<span>${orderGoods.price}</span>元</div>
                                                        <div class="refund-goodsname">共:<span>${orderGoods.stock*orderGoods.price}</span>元</div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </c:forTokens>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">退款金额</label>
                                        <div class="layui-input-inline">
                                            <input type="tel" name="price"  autocomplete="off" class="layui-input" readonly="readonly" value="${reimburse.price}">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">退款理由</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="reason"  autocomplete="off" class="layui-input" readonly="readonly" value="${reimburse.reason}">
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">退款说明</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="caption" autocomplete="off" class="layui-input" readonly="readonly" value="${reimburse.caption}">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">退款凭证</label>
                                    <div class="layui-input-block" >
                                        <c:set var="pic" value="${reimburse.images}"/>
                                        <c:choose>
                                            <c:when test="${fn:contains(pic,',')}">
                                                <c:if test="${reimburse.images!='0'}">
                                                    <c:forTokens items="${reimburse.images}" begin="1"  delims="," var="picc" >
                                                        <c:forTokens items="${reimburse.images}" begin="0"  end="0" delims="," var="pic" >
                                                            <img src="..${pic}${picc}" class="reimburse_img"/>
                                                        </c:forTokens>
                                                    </c:forTokens>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${reimburse.images!='0'}">
                                                    <img src="..${reimburse.images}" class="reimburse_img">
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>


                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">处理</label>
                                    <div class="layui-input-block">
                                        <input type="hidden" id="seller_opinion" name="his_seller_opinion">
                                        <input type="radio" name="seller_opinion" value="0" title="拒绝" lay-filter="seller_opinion">
                                        <input type="radio" name="seller_opinion" value="1" title="同意" lay-filter="seller_opinion">
                                    </div>
                                </div>
                                <div class="layui-form-item" style="display: none;">
                                    <label class="layui-form-label">拒绝说明</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="seller_caption" autocomplete="off" class="layui-input" >
                                    </div>
                                </div>
                                <div class="layui-form-item" style="display: none;">
                                    <label class="layui-form-label">退货地址</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="address" autocomplete="off" class="layui-input" value="${admin.address}">
                                    </div>
                                </div>


                            </form>
                            <div class="twobtn-box">
                                <button class="twobtn" id="twobtn" onclick="fun1()">提交</button>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>

        </div>
        <!--第三步-->
        <div class="threebox-form twobox-form" id="threeform">
            <div class="threeform">
                <div class="threeform-box">

                    <c:choose>
                        <c:when test="${empty reimburse.delivery}">
                            <span>等待买家商品退回</span>
                        </c:when>
                        <c:otherwise>
                            <div class="shop_order" style="padding-top: 100px;">
                                <div class="layui-card" style="border: 1px solid #e2e2e2;">
                                    <div class="layui-card-header" style="font-weight: 800;">物流信息</div>
                                    <div class="layui-card-body">
                                        <!--物流信息-->
                                        <div id="container" class="clear">
                                            <p>物流公司：${reimburse.deliveryCompany}</p>
                                            <p>运单号码：${reimburse.delivery}</p>
                                            <!--物流-->
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="threebtn-box">
                    <button class="threebtn" id="threebtn" onclick="fun2(${reimburse.orderSn})">确认收货</button>
                </div>
            </div>
        </div>

        <!--第四步-->
        <div class="fourbox-form" id="fourform">
            <div class="successr">
                <!-- <div class="symbol">

                </div> -->
                <p>退款成功，钱款将于24小时内退回买家账号！</p>
            </div>
        </div>
    </div>
</div>








<script src="../assets/js/active.js"></script>

<script src="../other/js/jquery-3.3.1.min.js"></script>
<!-- <script src="../../other/js/orderConfirm.js"></script> -->

<script src="../layui/layui.js"></script>

<script>
    // 订单详情
    // 收起与展开更多物流信息
    $("#more").click(function(){
        if($(this).hasClass("upup")){
            $(this).siblings().find('p').hide();
            $(this).siblings().find('p').eq(0).show();
            $("#more").html("更多信息↓");
            $(this).removeClass("upup");
        }else{
            $(this).siblings().find('p').show();
            $("#more").html("收起信息↑");
            $("#more").addClass("upup");
        }
    })
    // 订单详情结束
</script>
<script>
    var onebtns = document.getElementById("onebtn");
    var twobtns = document.getElementById("twobtn");

    var soutside1ab = document.getElementById("outside1abs");
    var soutside2as = document.getElementById("outside2as");
    var soutside3as = document.getElementById("outside3as");

    var oneforms = document.getElementById("oneform");
    var twoforms = document.getElementById("twoform");
    var threeforms = document.getElementById("threeform");
    var fourforms = document.getElementById("fourform");

    ///验证账号
    function fun() {
        soutside1ab.classList.remove("outside1ab");
        oneforms.style.display = "none";
        twoforms.style.display = "block";

    }
    //卖家处理退款
    function fun1() {
        var orderSn=$('input[name=orderSn]').val();
        var seller_opinion=$('#seller_opinion').val();
        var seller_caption=$('input[name=seller_caption]').val();
        var address=$('input[name=address]').val();
        var isRetutnGoods=$('input[name=isRetutnGoods]').val();

        $.ajax({
            type:"POST",
            url:"../border/updReimburse",
            data:"orderSn="+orderSn+"&sellerOpinion="+seller_opinion+"&sellerCaption="+seller_caption+"&address="+address+"&isRetutnGoods="+isRetutnGoods,
            success: function(obj){
                if(obj.state==0){
                    alert("提交失败");
                }else{
                   layer.msg("提交成功")
                    window.location.href="../border/showReimburse.action?orderSn="+obj.data;
                }
            },
            //请求失败
            error:function()
            {
                //错误处理
                alert("系统异常");
            }
        });



        // threeforms.style.display = "block";
        // twoforms.style.display = "none";
        // soutside2as.classList.remove("outside2ab");

    }
    //确认收货
    function fun2(orderSn) {
        $.ajax({
            type:"POST",
            url:"../border/confirmReceipt",
            data:"orderSn="+orderSn,
            success: function(obj){
                if(obj.state==0){
                    alert("失败");
                }else{
                    layer.msg("确认成功");
                    window.location.href="../border/showOrderDetails.action?orderSn="+obj.data;
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
    layui.use(['form','rate','upload'], function(){
        var rate = layui.rate
            , form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            , $ = layui.jquery
            ,upload = layui.upload;

        form.on('radio(seller_opinion)', function(data){
            $('#seller_opinion').val(this.value);
            var isRetutnGoods=$('input[name=isRetutnGoods]').val();
            if(this.value==1){
                $('.twoform').find('.layui-form-item').eq(7).hide();
                if (isRetutnGoods==='需要'){
                    $('.twoform').find('.layui-form-item').eq(8).show();
                }
            }else{
                $('.twoform').find('.layui-form-item').eq(7).show();
                $('.twoform').find('.layui-form-item').eq(8).hide();
            }
        });

    });
</script>
<script>
    $(function(){
        var deliveryStatus=$('#deliveryStatus').val();
        switch (deliveryStatus){
            case '0':
                soutside1ab.classList.remove("outside1ab");
                oneforms.style.display = "none";
                twoforms.style.display = "block";
                break;
            case '1':
                soutside1ab.classList.remove("outside1ab");
                oneforms.style.display = "none";
                twoforms.style.display = "block";
                break;
            case '2':
                soutside1ab.classList.remove("outside1ab");
                oneforms.style.display = "none";
                twoforms.style.display = "block";
                threeforms.style.display = "block";
                twoforms.style.display = "none";
                soutside2as.classList.remove("outside2ab");
                break;
            case '3':
                soutside1ab.classList.remove("outside1ab");
                oneforms.style.display = "none";
                twoforms.style.display = "block";
                threeforms.style.display = "block";
                twoforms.style.display = "none";
                soutside2as.classList.remove("outside2ab");
                fourforms.style.display = "block";
                threeforms.style.display = "none";
                soutside3as.classList.remove("outside3a");
                break;
        }
    });
</script>
</body>
</html>