
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>我的账户</title>

    <link href="../other/css/bootstrap.css" rel="stylesheet">

    <link href="../assets/css/vendor.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

    <link href="../layui/css/layui.css" rel="stylesheet">

    <link href="../other/css/other.css" rel="stylesheet">
    <link href="../other/css/address.css" rel="stylesheet">
    <link href="../other/css/orderConfirm.css" rel="stylesheet">

    <link href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">
    <link href="../veg/css/nice-select.css" rel="stylesheet"  type="text/css">
    <link href="../veg/css/elegant-icons.css" rel="stylesheet"  type="text/css">

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
                            <h1>地址管理</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">收货地址</li>--%>
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
                    <!-- 右上新增地址 -->
                    <div id="div_add_address">
                        <button id="btn_add_address">新增收货地址</button>&nbsp;&nbsp;
                        <span>您已创建<i>${addressSum}</i>个收货地址</span>
                    </div>
                    <!-- 右下地址 -->
                    <div class="div_container">
                        <!-- 列表 -->
                        <c:choose>
                            <c:when test="${empty addressList}">
                                <div class="n_available">
                                    <img src="../other/img/other/noAddress.png">
                                    <p>暂无地址</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="shoping__cart__table2">
                                    <table >
                                        <thead>
                                        <tr>
                                            <th >收货人</th>
                                            <th >所在地区</th>
                                            <th >详细地址</th>
                                            <th >手机号码</th>
                                            <th >操作</th>
                                            <th >默认地址</th>
                                            <th ></th>
                                        </tr>
                                        </thead>
                                        <tbody >

                                        <c:forEach items="${addressList}" var="address">
                                            <tr >
                                                <td class="shoping__cart__item" >
                                                    <span>${address.userAddressName}</span>
                                                </td>
                                                <td class="shoping__cart__price">
                                                    <span>${address.province}</span>

                                                </td>
                                                <td class="shoping__cart__quantity">
                                                    <span>${address.city}</span>
                                                    <span>${address.county}</span>
                                                    <span>${address.address}</span>
                                                </td>
                                                <td class="shoping__cart__total">
                                                    <span>${address.tel}</span>
                                                </td>
                                                <td class="shoping__cart__after"><a href="javascript:void(0)" class="edit_adress">编辑</a></td>
                                                <td class="shoping__cart__status">
                                                    <c:if test="${address.isDefault==1}">
                                                        <span>默认地址</span>
                                                    </c:if>
                                                    <c:if test="${address.isDefault==0}">
                                                        <a href="javascript:void(0)" class="setDefault">设为默认</a>
                                                    </c:if>

                                                </td>
                                                <td class="shoping__cart__handle">
                                                    <i class="fa fa-close" name="del_address"><input type="hidden" value="${address.id}"></i>
                                                    <!-- <a href="" >确认收货</a> -->
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>



                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 添加收货地址框 -->
    <div class="addmodal" >
        <div class="layui-card " id="add-modal-dialog">
            <div class="layui-card-header" style="background-color: #eee;">新增收货人信息<button style="float: right;" class="layui-icon btn_x" >&#x1007;</button> </div>
            <div class="layui-card-body">
<%--                <form class="" action="" id="login-form">--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">收货人</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required"  autocomplete="off" class="layui-input" id="add-name">
                        </div>
                    </div>
                    <div class="layui-form-item" >
                        <label class="layui-form-label">地址</label>
                        <div data-toggle="distpicker">
                            <div class="layui-input-inline " style="margin-left: 29px;width: 140px;">
                                <select class="select-city" name="city" required data-province="---- 选择省 ----" id="add-province"></select>
                            </div>
                            <div class="layui-input-inline " style="width: 145px;">
                                <select class="select-city" name="city" required data-city="---- 选择市 ----" id="add-city"> </select>
                            </div>
                            <div class="layui-input-inline " style="width: 140px;">
                                <select class="select-city" name="city" required data-district="---- 选择区 ----" id="add-county"></select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">详细地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required"  autocomplete="off" class="layui-input" id="add-address">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">电话</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required"  autocomplete="off" class="layui-input" id="add-phone">
                        </div>
                    </div>
                    <div class="layui-form-item" style="margin-top: 60px;">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-danger" style="background-color: #7fad39;margin-left: 150px;margin-top: -50px;" lay-submit lay-filter="formDemo" id="add-btn-danger">确认</button>
                            <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
                        </div>
                    </div>
<%--                </form>--%>
                <form class="layui-form" action="" style="margin-top: -350px">
                    <div class="layui-form-item">
                        <label class="layui-form-label">默认地址</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="close" lay-skin="switch" lay-text="是|否" id="add-default">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 修改收货地址框 -->
    <div class="updatemodal" >
        <div class="layui-card " id="upd-modal-dialog" >
            <div class="layui-card-header" style="background-color: #eee;">修改收货人信息<button href="javascript:void(0)" style="float: right;" class="layui-icon btn_x" >&#x1007;</button> </div>
            <div class="layui-card-body">
<%--                <form class="" action="">--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">收货人</label>
                        <div class="layui-input-block">
                            <input type="hidden" id="address_id">
                            <input type="text" name="title" required  lay-verify="required"  autocomplete="off" class="layui-input" id="upd-name">
                        </div>
                    </div>
                    <div class="layui-form-item" >
                        <label class="layui-form-label">地址</label>
                        <div  id="distpicker2" data-toggle="distpicker">
                            <div class="layui-input-inline " style="margin-left: 29px;width: 140px;">
                                <select class="select-city" name="city" data-province="---- 选择省 ----"  id="upd-province"></select>
                            </div>
                            <div class="layui-input-inline " style="width: 145px;">
                                <select class="select-city" name="city" data-city="---- 选择市 ----" id="upd-city"> </select>
                            </div>
                            <div class="layui-input-inline " style="width: 140px;">
                                <select class="select-city" name="city" data-district="---- 选择区 ----" id="upd-county"></select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">详细地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required"  autocomplete="off" class="layui-input" id="upd-address">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">电话</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required"  autocomplete="off" class="layui-input" id="upd-phone">
                        </div>
                    </div>

                    <div class="layui-form-item" style="margin-top: 60px;">
                        <div class="layui-input-block">
                            <button class="layui-btn" style="background-color: #7fad39;margin-left: 150px;margin-top: -50px;" id="upd-btn-danger">确认</button>
                            <%--                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
                        </div>
                    </div>
<%--                </form>--%>
                <form class="layui-form" action="" style="margin-top: -350px" lay-filter="example">
                    <div class="layui-form-item">
                        <label class="layui-form-label">默认地址</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="close" lay-skin="switch" lay-text="是|否" id="upd-default">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 弹出层显示删除成功等 -->
<%--    <div id="pop_up"></div>/--%>
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

<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<script src="../layui/layui.js"></script>

<script src="../veg/js/main.js"></script>
<script src="../veg/js/jquery-ui.min.js"></script>

<!--添加地址-->
<script>

    $('#add-btn-danger').on('click',function(){
        //alert("1");
        $()
        var name=$('#add-name').val();
        var province=$('#add-province').val();
        var city=$('#add-city').val();
        var county=$('#add-county').val();
        var addres=$('#add-address').val();
        var phone=$('#add-phone').val();
        var is_default=$('#add-default').is(':checked');
        var Default;
        //alert(is_default);
        if(is_default==true){
            Default =1;
        }else{
            Default =0;
        }
        if (name=='' ||province=='' ||province=='' ||city=='' ||county=='' ||addres==''||phone==''){
            GrowlNotification.notify({
                title: '信息未填完整',
                type: 'error',
                position: 'top-center',
                closeTimeout: 2000
            });
        }else{
            var a=new Array();
            a.push(name,phone,province,city,county,addres,Default);
            var address=a.toString();
            //alert(address);
            $.ajax({
                type:"POST",
                url:"../address/addAddress",
                data:"address="+address,
                success: function(obj){
                    if(obj.state==0){
                        alert("添加失败");
                    }else{ //登录成功
                        GrowlNotification.notify({
                            title: '添加成功',
                            type: 'success',
                            position: 'top-center',
                            closeTimeout: 1000
                        });
                        setTimeout( 'window.location.href="../account/showAddress.do"',200);
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


    });
</script>

<script>
    //点击（设为默认地址）将某一地址设为默认地址
    $(".setDefault").click(function(){
        // alert( $(".user_sited").length);
        var id=$(this).parent().parent().find("input").val();
        //$(this).parent().find(".user_sited").show();
        //alert("ID:"+id);
        $.ajax({
            type:"POST",
            url:"../address/updateDefaultAddress",
            data:"id="+id,
            success: function(obj){
                if(obj.state==0){
                    //alert("添加失败");
                }else{ //登录成功
                    //alert("成功");
                    window.location.href="../account/showAddress.do";
                }
            },
            //请求失败
            error:function()
            {
                //错误处理
                alert("系统异常");
            }
        });
        // $(this).parent().attr("class","base_select");
        // $(this).parent().siblings().attr("class","base");
        // $(this).hide();
    });

    //点击编辑显示修改框
    $(".edit_adress").on('click',function(){
        var id=$(this).parent().parent().find("input").val();
        var name=$(this).parent().parent().find(".shoping__cart__item").find("span").text();
        var province=$(this).parent().parent().find(".shoping__cart__price").find("span").text();
        var city=$(this).parent().parent().find(".shoping__cart__quantity").find("span").eq(0).text();
        var county=$(this).parent().parent().find(".shoping__cart__quantity").find("span").eq(1).text();
        var address=$(this).parent().parent().find(".shoping__cart__quantity").find("span").eq(2).text();
        var phone=$(this).parent().parent().find(".shoping__cart__total").find("span").text();
        var sited=$(this).parent().parent().find(".shoping__cart__status").find("span").length;

        $(".updatemodal").show();

        $('#upd-name').val(name);
        $('#upd-address').val(address);
        $('#upd-phone').val(phone);
        $('#address_id').val(id);
        $("#upd-province").val(province);
        $("#upd-province").trigger("change");
        $("#upd-city").val(city);
        $("#upd-city").trigger("change");
        $("#upd-county").val(county);
        $("#upd-county").trigger("change");

        if (sited!=0){
            //$('#upd-default').attr('checked',true);
            layui.use(['form'], function(){
                var form = layui.form
                //表单赋值
                form.val('example', {
                    "close": true //开关状态
                });
            });
        }else {
            layui.use(['form'], function(){
                var form = layui.form
                //表单赋值
                form.val('example', {
                    "close": false //开关状态
                });
            });
        }

    });

</script>

<!--修改地址-->
<script>
    //修改地址
    $('#upd-btn-danger').on('click',function(){

        var id=$('#address_id').val();
        var name=$('#upd-name').val();
        var province=$('#upd-province').val();
        var city=$('#upd-city').val();
        var county=$('#upd-county').val();
        var addres=$('#upd-address').val();
        var phone=$('#upd-phone').val();
        var is_default=$('#upd-default').is(':checked');
        var Default;
        if(is_default==true){
            Default =1;
        }else{
            Default =0;
        }
        if (name=='' ||province=='' ||province=='' ||city=='' ||county=='' ||addres==''||phone==''){
            GrowlNotification.notify({
                title: '信息未填完整',
                type: 'error',
                position: 'top-center',
                closeTimeout: 2000
            });
        }else{
            var a=new Array();
            a.push(id,name,province,city,county,addres,phone,Default);
            var address=a.toString();
            $.ajax({
                type:"POST",
                url:"../address/updateAddress",
                data:"address="+address,
                success: function(obj){
                    //alert("!");
                    if(obj.state==0){
                        //$.pop_up("修改失败");

                    }else{ //登录成功
                        // $("body").html("<div id=\"pop_up\"></div>")
                        GrowlNotification.notify({
                            title: '修改成功',
                            type: 'success',
                            position: 'top-center',
                            closeTimeout: 1000
                        });
                        //$.pop_up("修改成功");

                        setTimeout( 'window.location.href="../account/showAddress.do"',200);

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

    });

</script>
<!--删除地址-->
<script>
    //删除
    $('i[name=del_address]').on('click',function(){
        var id=$(this).find("input").val();
        var txt=  "确定是否删除";
        var option = {
            title: "提示",
            icon: "-48px 0",
            btn: parseInt("0011",2),
            onOk: function(){
                    $.ajax({
                        type:"POST",
                        url:"../address/delAddress",
                        data:"id="+id,
                        success: function(obj){
                            if(obj.state==0){
                                alert("删除失败");
                            }else{ //登录成功
                                //alert("删除成功");
                                GrowlNotification.notify({
                                    title: '删除成功',
                                    type: 'success',
                                    position: 'top-center',
                                    closeTimeout: 1000
                                });
                                setTimeout( 'window.location.href="../account/showAddress.do"',200);

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
    // 显示第三个ul(我的地址)
    $('.hero').find('ul').eq(2).show();

    // //点击设为默认地址
    // $('.setDefault').on('click',function(){
    //         $(this).siblings().show();
    //         $(this).hide();
    //     }
    // );
    //点击新增地址显示新增地址框
    $("#btn_add_address").on('click',function(){
        $(".addmodal").show();
    });
    //点击编辑显示修改框
    $(".edit_adress").on('click',function(){
        $(".updatemodal").show();
    });
    // //点击X隐藏框
    $(".btn_x").on('click',function(){
        $(this).parent().parent().parent().hide();
    });

    layui.use(['form'], function(){
        var form = layui.form
        //表单赋值

    });
</script>
</body>

</html>
