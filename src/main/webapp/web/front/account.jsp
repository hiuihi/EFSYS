
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link href="../veg/css/style.css" rel="stylesheet"type="text/css">
    <link href="../veg/css/owl.carousel.min.css" rel="stylesheet" type="text/css">
    <link href="../veg/css/nice-select.css" rel="stylesheet"  type="text/css">
    <link href="../veg/css/elegant-icons.css" rel="stylesheet"  type="text/css">

    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/confirm/css/xcConfirm.css" rel="stylesheet" type="text/css" />

</head>

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
                            <h1>我的信息</h1>
<%--                            <ul class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">账户管理</li>--%>
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

                        <div class="layui-form-item">
                            <label class="layui-form-label">头像</label>
                            <div class="layui-input-block">
                                <div class="layui-upload">
                                    <div class="layui-upload-list" id="div1" style="width: 100px;">
                                        <img src="..${user.icon}" class="layui-circle" id="demo1" style="height: 100px;width: 100px;">
                                    </div><button type="button" class="layui-btn" id="replace_avatar" style="background-color: #7fad39">更换头像</button>

                                </div>
                                <!-- <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input"> -->
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>

                            <div class="layui-input-block">
                                <div class="layui-upload">
                                    <input type="text" name="nickname" value="${user.nickname}" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 40%;">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">生日</label>
                            <div class="layui-input-block">
                                <div class="layui-upload">
                                    <div class="layui-form">
                                        <div class="layui-input-inline">
                                            <input type="text" name="birthday" class="layui-input" id="data" placeholder="年-月-日">
                                        </div>
                                    </div>
                                    <!-- <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 40%;"> -->
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">城市</label>
                            <div class="layui-input-block">
                                <div class="layui-upload">
                                    <input type="text" name="city" value="${user.city}" lay-verify="title" autocomplete="off"  class="layui-input" style="width: 40%;">
                                </div>
                            </div>
                        </div>

                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <c:choose>
                                    <c:when test="${user.gender==1}">
                                        <input type="radio" name="sex" value="男" title="男" checked>
                                        <input type="radio" name="sex" value="女" title="女" >
                                        <input type="radio" name="sex" value="保密" title="保密" >
                                    </c:when>
                                    <c:when test="${user.gender==2}">
                                        <input type="radio" name="sex" value="男" title="男">
                                        <input type="radio" name="sex" value="女" title="女" checked>
                                        <input type="radio" name="sex" value="保密" title="保密" >
                                    </c:when>
                                    <c:otherwise>
                                        <input type="radio" name="sex" value="男" title="男">
                                        <input type="radio" name="sex" value="女" title="女" >
                                        <input type="radio" name="sex" value="保密" title="保密" checked>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </form>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button  class="layui-btn" id="button_submit" lay-submit="" lay-filter="demo1" style="background-color: #7fad39">保存</button>
                            </div>
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


<script src="../assets/js/vendor.js"></script>
<script src="../assets/js/active.js"></script>

<script src="../other/js/other.js"></script>
<script src="../other/js/jquery-3.3.1.min.js"></script>

<script src="../layui/layui.js"></script>

<script src="../veg/js/main.js"></script>
<script src="../veg/js/jquery-ui.min.js"></script>

<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<!--提交信息-->
<script>
    $('#button_submit').on('click',function(){
        // alert('1');
        var nickname=$('main').find('input[name="nickname"]').val();
        var gender=$('main').find('input[name="sex"]');
        var city=$('main').find('input[name="city"]').val();
        var birthday=$('main').find('input[name="birthday"]').val();
        var  sex;
        gender.each(function(){
           if ($(this).is(":checked")){
               if ($(this).val()=="男"){
                   sex=1;
               }else if ($(this).val()=="女"){
                   sex=2;
               }else {
                   sex=0
               }
           }
        });
        var us=new Array(nickname,birthday,city,sex).toString();
        $.ajax({
            type:"POST",
            url:"../user/updUser",
            data:"us="+us,
            success: function(obj){
                if(obj.state==0){
                    alert("保存失败");
                }else{ //删除成功
                    GrowlNotification.notify({
                        title: '保存成功',
                        type: 'success',
                        position: 'top-center',
                        closeTimeout: 1000
                    });
                    setTimeout( 'window.location.href="../account/showAccount.do"',200);
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
</script>
<script>
    // 显示第四个ul(账户管理)
    $('.hero').find('ul').eq(3).show();
</script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>

<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#replace_avatar'
            ,url: '../user/updIcon' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code = 0){
                    return layer.msg('上传失败');
                }
                else{
                    return layer.msg('上传成功');
                }
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#data'
            ,value: '<fmt:formatDate value="${user.birthday}" type="date" pattern="yyyy-MM-dd"/>' //必须遵循format参数设定的格式
        });

    });
</script>
</body>

</html>
