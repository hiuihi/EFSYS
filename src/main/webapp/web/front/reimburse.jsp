
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>退货退款</title>
    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../layui/css/layui.css" rel="stylesheet">

    <link href="../other/css/other.css"rel="stylesheet" >
    <link href="../other/css/orderDetails.css"rel="stylesheet" >

    <link href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">

    <link href="../other/css/reimburse_f.css" rel="stylesheet" >


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
    <div class="breadcrumb-area common-bg" style="margin-bottom: 30px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <h1>退货退款</h1>
                            <!-- <ul class="breadcrumb"> -->
                            <!-- <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li> -->
                            <!-- <li class="breadcrumb-item active" aria-current="page">支付</li> -->
                            <!-- </ul> -->
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>


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
                        <c:choose>
                            <c:when test="${reimburse.isRetutnGoods==0}">
                                买家无需退货
                            </c:when>
                            <c:otherwise>
                                买家退货
                            </c:otherwise>
                        </c:choose>
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
                    <form class="layui-form layui-form-pane" action="" id="from_reimburse">
                        <input type="hidden" id="reimburse_orderSn" name="orderSn" value="${orderGoodsVo.order.orderSn}">
                        <input type="hidden" id="deliveryStatus"  value="${reimburse.deliveryStatus}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">是否收到货</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="is_received_goods" name="his_received_goods">
                                <input type="radio" name="is_received_goods" value="1" title="已收到" lay-filter="is_received_goods">
                                <input type="radio" name="is_received_goods" value="0" title="未收到" lay-filter="is_received_goods">
                            </div>
                        </div>

                        <div class="layui-form-item div_display">
                            <label class="layui-form-label">是否退货</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="is_retutn_goods" name="his_retutn_goods">
                                <input type="radio" name="is_retutn_goods" value="0" title="无需退货" lay-filter="is_retutn_goods">
                                <input type="radio" name="is_retutn_goods" value="1" title="退货" lay-filter="is_retutn_goods">
                            </div>
                        </div>

                        <div class="layui-form-item div_display">
                            <label class="layui-form-label">选择商品</label>
                            <div class="layui-input-block">
                                <input type="hidden" id="select_goods" name="h_select_goods">
                                <input type="radio" name="select_goods" value="1" title="全部退款" lay-filter="select_goods">
                                <input type="radio" name="select_goods" value="0" title="部分退款" lay-filter="select_goods">
                            </div>
                        </div>
                        <div class="layui-form-item div_display">
                            <label class="layui-form-label">商品</label>
                            <input type="hidden" id="ids" name="ids" value="${orderGoodsVo.order.goodsIds}">
                            <div class="layui-input-block">
                                <c:forEach items="${orderGoodsVo.orderGoods}" var="orderGoods">
                                    <div class="div-refund-goods">
                                        <input type="checkbox" name="gooodsId" lay-skin="primary" lay-filter="test2" value="${orderGoods.goodsId}">
                                        <img src="..${orderGoods.images}">
                                        <div class="refund-goodsname"><span>${orderGoods.goodsName}</span></div>
                                        <div class="refund-goodsname">规格:<span>${orderGoods.spec}</span></div>
                                        <div class="refund-goodsname">数量:<span>${orderGoods.stock}</span></div>
                                        <div class="refund-goodsname">单价:<span>${orderGoods.price}</span>元</div>
                                        <div class="refund-goodsname">共:<span>${orderGoods.price*orderGoods.stock}</span>元</div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="layui-form-item div_display">
                            <label class="layui-form-label">退款金额</label>
                            <div class="layui-input-inline">
                                <input type="text" name="money" lay-verify="required|number|reimburse"  autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">最多&nbsp;<span>${orderGoodsVo.order.totalAmount}</span>&nbsp;元</div>
                        </div>

                        <div class="layui-form-item div_display">
                            <label class="layui-form-label">退款理由</label>
                            <div class="layui-input-inline">
                                <select name="reimburse_reason" lay-verify="required">
                                    <option value="" selected>请选择</option>
                                    <option value="商品质量有问题">商品质量有问题</option>
                                    <option value="不喜欢">不喜欢</option>
                                    <option value="产品颜色等与描述不符">产品颜色等与描述不符</option>
                                    <option value="快递太久无法本人收到">快递太久无法本人收到</option>
                                    <option value="收到商品破损">收到商品破损</option>
                                    <option value="商品错发,漏发">商品错发,漏发</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item layui-form-text div_display">
                            <div class="layui-input-block">
                                <textarea placeholder="退款说明" class="layui-textarea" lay-verify="required" name="reimburse_text"></textarea>
                            </div>
                        </div>

                        <div class="upload_comment_image div_display" id="reimburse_comment_image">
                            <input type="hidden" name="comment_image">
                            <button  type="button" id="reimburse_upload_picture">
                                <i class="layui-icon layui-icon-upload-drag" ></i><br>
                                <p>添加照片凭证</p>
                            </button>
                        </div>

                        <!-- <div class="layui-form-item div_display">
                            <div class="layui-input-block">
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="reimburse_submit">提交</button>
                            </div>
                        </div> -->
                        <div class="onebtn-box">
                            <button type="submit" class="onebtn" id="onebtn" lay-filter="reimburse_submit" lay-submit="">提交</button>
                        </div>
                    </form>

<%--                    <div class="onebtn-box">--%>
<%--                        <button class="onebtn" id="onebtn" onclick="fun()">提交</button>--%>
<%--                    </div>--%>
                </div>
            </div>
            <!--第二步-->
            <div class="twobox-form" id="twoform">
                <div class="twoform">
                    <div class="twoform-box">

                        <c:choose>
                            <c:when test="${reimburse.sellerOpinion==0}">
                                <span>卖家拒绝了您的退款请求，请与卖家协商</span>
                                <span>或者您可以取消退款申请后重新申请</span>
                                <span>拒绝理由: ${reimburse.sellerCaption}</span>
                            </c:when>
                            <c:otherwise>
                                <span>退款申请已提交，请耐心等待卖家处理</span>
                            </c:otherwise>
                        </c:choose>
                        <button type="button" onclick="cancelRefund()" class="layui-btn layui-btn-primary" style="margin-left: 300px;margin-top: 30px;">取消退款申请</button>

                    </div>
                </div>
<%--                <div class="twobtn-box">--%>
<%--                    <button class="twobtn" id="twobtn" onclick="fun1()">下一步</button>--%>
<%--                </div>--%>
            </div>
            <!--第三步-->
            <div class="threebox-form twobox-form" id="threeform">
                <div class="threeform">
                    <div class="threeform-box">

                        <c:choose>
                            <c:when test="${empty reimburse.delivery}">
                                <span>卖家已同意退款，请将商品退回</span>
                                <p style="margin: 20px 0px;">卖家地址：${reimburse.address}</p>
                                <form class="layui-form layui-form-pane" action="" id="">
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label">快递公司</label>
                                            <div class="layui-input-inline">
                                                <input type="text" name="deliverycompany"  autocomplete="off" class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-inline">
                                            <label class="layui-form-label">快递单号</label>
                                            <div class="layui-input-inline">
                                                <input type="text" name="delivery"  autocomplete="off" class="layui-input">
                                            </div>
                                        </div>

                                    </div>
                                </form>
                                <div class="threebtn-box">
                                    <button class="threebtn" id="threebtn" onclick="fun2()">提交</button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <span>请耐心等待，卖家确认无误后将退款给您</span>
                                <div class="shop_order" >
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

                </div>
            </div>

            <!--第四步-->
            <div class="fourbox-form" id="fourform">
                <div class="successr">
                    <!-- <div class="symbol">

                    </div> -->
                    <input type="hidden" id="orderSn" value="${reimburse.orderSn}">
                    <p>退款成功，钱款将于24小时内退回原账号！</p>
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

<script src="../assets/js/active.js"></script>
<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../layui/layui.js"></script>

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
        // var userName = $("#userName").val();
        // if (userName == "") {
        //     alert("请输入要找回密码的账户");
        //     return false;
        // }
        // $("#email").val("123067cs@qq.com");


        // soutside1ab.classList.remove("outside1ab");
        // oneforms.style.display = "none";
        // twoforms.style.display = "block";

    }
    //验证邮箱验证码
    function fun1() {
        // var userName = $("#userName").val();
        // var rndNum = $("#rndNum").val();

        // if (rndNum == "") {
        //     alert("请输入验证码");
        //     return false;
        // }

        threeforms.style.display = "block";
        twoforms.style.display = "none";
        soutside2as.classList.remove("outside2ab");

    }
    //上传快递单号
    function fun2() {
        var orderSn=$('#fourform').find('#orderSn').val();
        var delivery=$('input[name=delivery]').val();
        var deliverycompany=$('input[name=deliverycompany]').val();

        if((delivery!='' && delivery!=null) && (deliverycompany!='' && deliverycompany!=null)) {

            $.ajax({
                type:"POST",
                url:"../order/updReimburseDelivery",
                data:"orderSn="+orderSn+"&delivery="+delivery+"&deliverycompany="+deliverycompany,
                success: function(obj){
                    if(obj.state==0){
                        alert("提交失败");
                    }else{
                        layer.msg("提交成功")
                        window.location.href="../order/showReimburse.do?orderSn="+obj.data;
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
        }else{
            layer.msg("不能为空!");

        }


        // fourforms.style.display = "block";
        // threeforms.style.display = "none";
        // soutside3as.classList.remove("outside3a");

    }
    //取消退款申请
    function  cancelRefund() {
        var orderSn=$('#fourform').find('#orderSn').val();
        layer.alert('确定取消吗',{
            btn: ['确定','取消'] //按钮
            ,yes:function(){
                // layer.msg('按钮1')
                $.ajax({
                    type:"POST",
                    url:"../order/cancelRefund",
                    data:"orderSn="+orderSn,
                    success: function(obj){
                        if(obj.state==0){
                            alert("修改失败");
                        }else{
                            layer.msg("取消成功！")
                            setTimeout( 'window.location.href="../account/showOrders.do"',500);

                        }
                    },
                    //请求失败
                    error:function()
                    {
                        //错误处理
                        alert("系统异常");
                    }
                });
            }});
    }

</script>
<script>

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
    //图片右上角x
    $('.img-close').on('click',function(){
        $(this).parent().remove();
    });
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
                $('.oneform').find('.div_display').hide();
                $('.oneform').find('.layui-form-item').eq(1).show(400);
            }else{
                $('.oneform').find('.div_display').hide();
                // $('.div_reimburse').find('.layui-form-item').eq(1).hide(400);
                $('.oneform').find('.layui-form-item').eq(2).show(400);
                // $('.div_reimburse').find('.layui-form-item').eq(2).find('input').attr("checked",false);
            }
        });

        form.on('radio(is_retutn_goods)', function(data){
            $('#is_retutn_goods').val(this.value);
            $('.oneform').find('.layui-form-item').eq(2).show(400);

        });

        form.on('radio(select_goods)', function(data){
            $('#select_goods').val(this.value);
            if(this.value==1){
                // layer.msg("1");
                $('.oneform').find('.layui-form-item').eq(3).hide(400);
                $('.oneform').find('.layui-form-item').eq(4).show(400);
                $('.oneform').find('.layui-form-item').eq(5).show(400);
                $('.oneform').find('.layui-form-item').eq(6).show(400);
                $('.oneform').find('.layui-form-item').eq(7).show(400);
                $('.oneform').find('.upload_comment_image').show(400);
            }else{
                // layer.msg("0");
                $('.oneform').find('.layui-form-item').eq(3).show(400);
                $('.oneform').find('.layui-form-item').eq(4).show(400);
                $('.oneform').find('.layui-form-item').eq(5).show(400);
                $('.oneform').find('.layui-form-item').eq(6).show(400);
                $('.oneform').find('.layui-form-item').eq(7).show(400);
                $('.oneform').find('.upload_comment_image').show(400);
            }
        });

        //退款提交
        form.on('submit(reimburse_submit)', function(data){
            var is_submit=true;
            var aa=$('#reimburse_comment_image');
            var select_goods=$('#select_goods').val();
            var goods=$('.oneform').find('.layui-form-item').eq(3).find('input[name=gooodsId]');
            var max_money=$('.oneform').find('.layui-form-item').eq(4).find('.layui-word-aux').find('span').text();
            var money=$('.oneform').find('.layui-form-item').eq(4).find('input').val();
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
                    $('.oneform').find('#ids').val(ids);
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
                    type:"GET",
                    url:"../order/reimburse",
                    data:data,
                    success: function(obj){
                        if(obj.state==0){
                            alert("提交失败");
                        }else{
                            layer.msg("提交成功");
                            soutside1ab.classList.remove("outside1ab");
                            oneforms.style.display = "none";
                            twoforms.style.display = "block";
                           window.location.href="../order/showReimburse.do?orderSn="+obj.data

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
                pic+=","+document;
            });
            pic=pic.slice(1,pic.length);
            if (folder!=""){
                if ($(imgPath).length>1){
                    pic=folder+","+pic;
                }else{
                    pic=folder+pic;
                }
            }
        }
        return pic;
    };
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
