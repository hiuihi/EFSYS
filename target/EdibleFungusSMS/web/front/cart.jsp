
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>购物车</title>
    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../layui/css/layui.css" rel="stylesheet">

    <link href="../other/css/other.css" rel="stylesheet">

    <link  href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link  href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">

    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/confirm/css/xcConfirm.css" rel="stylesheet" type="text/css" />

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
                            <h1>购物车</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">购物车</li>--%>
<%--                            </ul>--%>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${cartList.size()==0}">
        <div class=" offset-sm-1 text-center" style="margin: 150px 0;">
            <p class="icon-addcart"><span><i class="fa fa-shopping-cart" ></i></span></p>
            <h2 class="mb-4">购物车居然是空的</h2>
            <div >
                <a href="../goods/showSearch.do"class="btn btn-primary btn-outline-primary"><i class="fa fa-paper-plane"></i>&nbsp;去逛逛</a>
                <a href="../cart/showCart.do"class="btn btn-primary btn-outline-primary"><i class="fa fa-refresh"></i> 刷新</a>
            </div>
        </div>
    </c:if>
    <c:if test="${cartList.size()!=0}">
        <!-- 购物车列表 -->
        <section class="shop-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="allCB"></th>
                                    <th class="shoping__product">商品</th>
                                    <th>价格</th>
                                    <th>数量</th>
                                    <th>总价</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cartList}" var="list">
                                    <tr>
                                        <td class="cart_check"><input type="checkbox" value="${list.id}" name="CB" ></td>
                                        <td class="shoping__cart__item">
                                            <img  src="..${list.images}" alt="">
                                            <h5 ><a href="../goods/showGoodsDetails.do?gid=${list.goodsId}">${list.goodsName}</a></h5>
                                            <div class="div_type">
                                                <p>规格:${list.spec}</p>
                                            </div>

                                        </td>
                                        <td class="shoping__cart__price">
                                            <c:choose>
                                                <c:when test="${list.promotionPrice==0}">
                                                    ￥<span>${list.price}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    ￥<span>${list.promotionPrice}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                                <div class="pro-qtyy" name="aaa">
                                                    <input type="text" value="${list.stock}" name="quantity" >
                                                </div>
                                            </div>
                                        </td>
                                        <td class="shoping__cart__total">
                                            ￥<span>${list.totalPrice}</span>
                                        </td>
                                        <td class="shoping__cart__item__close">
                                            <span class="fa fa-close"></span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class=" col-xs-1 col-sm-3 col-md-3">
                        <div class="cart__btn">
                            <a href="javascript:void(0)" id="a_del">删&nbsp;&nbsp;除</a>
                        </div>
                    </div>
                    <div class="  col-xs-1 col-sm-6 col-md-7">
                        <div class="cart__total__procced">
                            <ul>
                                <li>已选 <span>0</span>件商品 </li>
                                <li>合计 <span>0</span>元</li>
                            </ul>
                        </div>
                        <!-- <span>已选3件商品，合计30000元</span> -->
                    </div>
                    <div class="  col-xs-1 col-sm-3 col-md-2">
                        <div class=" update__btn" >
                            <a href="javascript:void(0)" id="a_settle">结&nbsp;&nbsp;算</a>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </section>
    </c:if>

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

<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<!-- 删除购物车-->
<script>
    $('.fa-close').click(function(){
        var id=$(this).parent().siblings().eq(0).children().val();
        var txt=  "确定是否删除";
        var option = {
            title: "提示",
            icon: "-48px 0",
            btn: parseInt("0011",2),
            onOk: function(){
                $.ajax({
                    type:"POST",
                    url:"../cart/delCart",
                    data:"id="+id,
                    success: function(obj){
                        if(obj.state==0){
                            alert("删除失败");
                        }else{ //删除成功
                            GrowlNotification.notify({
                                title: '删除成功',
                                type: 'success',
                                position: 'top-center',
                                closeTimeout: 1000
                            });
                            setTimeout( 'window.location.href="../cart/showCart.do"',200);
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

<!-- 计算选中多少商品和总价-->
<script>
    $('#allCB').click(function() {
        //alert("1");
        var cbs=$("input[name=CB]");
        //遍历
        for (var i=0;i<cbs.length;i++){
            cbs[i].checked=this.checked;
        }
    })
    var a;
    a=$('.shoping__cart__total').find("span").text();
    //alert("a:"+a);
    // $(".cart__total__procced").blur(function(){
    $('input[type="checkbox"]').click(function() {

        //alert("1");
        var valueArr= $('input[name=CB]');
        var total=0;
        var quantity;
        var sum=0;
        valueArr.each(function() {
            if ($(this).is(':checked')){
                total=total+parseFloat($(this).parent().parent().find('.shoping__cart__total').find("span").text());
                sum=sum+1;
            }else{
                // alert("未");
            }
        });
        $('.cart__total__procced').find("li").eq(1).find('span').text(total.toFixed(2));
        $('.cart__total__procced').find("li").eq(0).find('span').text(sum);
    })
</script>

<!-- 批量删除购物车-->
<script type="text/javascript">
    $('#a_del').click(function(){
        var cbs=$("input[name=CB]");
        var a = new Array();
        //alert("2");
        //遍历
        cbs.each(function() {
            if ($(this).is(':checked')){
               a.push($(this).val());
            }
        });
        // alert("a"+a.length);
        if (a.length==0){
            //alert("1");
            GrowlNotification.notify({
                title: '未选中',
                type: 'error',
                position: 'top-center',
                closeTimeout: 1000
            });
        }else{
            var cb=a.toString();
            var txt=  "确定是否删除";
            var option = {
                title: "提示",
                icon: "-48px 0",
                btn: parseInt("0011",2),
                onOk: function(){
                    $.ajax({
                        type:"POST",
                        url:"../cart/delCart",
                        data:"cb="+cb,
                        success: function(obj){
                            if(obj.state==0){
                                alert("删除失败");
                            }else{
                                GrowlNotification.notify({
                                    title: '删除成功',
                                    type: 'success',
                                    position: 'top-center',
                                    closeTimeout: 1000
                                });
                                setTimeout( 'window.location.href="../cart/showCart.do"',200);
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
        }

    })
</script>
<!--控制数量总价随着改变-->
<script>
    //鼠标离开数量文本框
    $("input[name=quantity]").on("blur",function(){
        var price=$(this).parent().parent().parent().siblings().eq(2).children().text();
        var count=$(this).val();
        var sum=(price*count).toFixed(2);
        var id=$(this).parent().parent().parent().siblings().eq(0).find("input").val();
        // alert("P:"+price+"   c:"+count+"   s:"+sum);
        $(this).parent().parent().parent().siblings().eq(3).children().text(sum);
        // var total=$('.shoping__cart__quantity').find('input').val();
        // var quantity=$('.shoping__cart__total').find('span').text();
        $.ajax({
            type:"POST",
            url:"../cart/updCart",
            data:"total="+count+"&quantity="+sum+"&id="+id,
            success: function(obj){
                if(obj.state==0){
                    //alert("修改失败");
                }else{ //
                   // alert("修改成功");
                    // window.location.href="../cart/showCart.do";
                }
            },
            //请求失败
            error:function()
            {
                //错误处理
                alert("系统异常");
            }
        });
    });
    // 总价=价格x数量
    $(".pro-qtyy").on("click",function(){
            var price=$(this).parent().parent().siblings().eq(2).children().text();
            var count=$(this).find("input").val();
            var sum=(price*count).toFixed(2);
            var id=$(this).parent().parent().siblings().eq(0).find("input").val();
            // alert("id:"+id);
            $(this).parent().parent().siblings().eq(3).children().text(sum);
            $.ajax({
                type:"POST",
                url:"../cart/updCart",
                data:"total="+count+"&quantity="+sum+"&id="+id,
                success: function(obj){
                    if(obj.state==0){
                        alert("修改失败");
                    }else{ //
                        //alert("修改成功");
                        // window.location.href="../cart/showCart.do";
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
    );

</script>
<!--结算-->
<script>
    $('#a_settle').click(function(){
        var cbs=$("input[name=CB]");
        var a = new Array();
        //alert("2");
        //遍历
        cbs.each(function() {
            if ($(this).is(':checked')){
                a.push($(this).val());
            }
        });
        if (a.length==0){
            GrowlNotification.notify({
                title: '未选中',
                type: 'error',
                position: 'top-center',
                closeTimeout: 1000
            });
        }else{
            var ids=a.toString();
            // $.ajax({
            //     type:"POST",
            //     url:"../order/showOrderConfirmation.do",
            //     data:"ids="+ids,
            //     success: function(obj){
            //         // if(obj.state==0){
            //         //     alert("删除失败");
            //         // }else{ //删除成功
            //         //     GrowlNotification.notify({
            //         //         title: '删除成功',
            //         //         type: 'success',
            //         //         position: 'top-center',
            //         //         closeTimeout: 1000
            //         //     });
            //              window.location.href="../order/showOrderConfirmation.do";
            //         // }
            //     },
            //     //请求失败
            //     error:function()
            //     {
            //         //错误处理
            //         alert("系统异常");
            //     }
            // });

             window.location.href="../order/showOrderConfirmation.do?ids="+ids;
        }

    })
</script>
</body>

</html>
