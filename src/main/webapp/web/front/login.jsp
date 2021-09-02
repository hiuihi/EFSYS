
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>登录 </title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Gadget Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
<%--    <script>--%>
<%--        addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }--%>
<%--    </script>--%>

    <link href="../other/css/font-awesome.min.css" rel="stylesheet">
    <link href="../other/css/login.css" rel='stylesheet' type='text/css' media="all">

<%--    <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">--%>
<%--    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">--%>

    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/confirm/css/xcConfirm.css" rel="stylesheet" type="text/css" />

</head>
<body>
<h1 class="error">欢迎登录</h1>
<!---728x90--->
<div class="w3layouts-two-grids">
    <!---728x90--->
    <div class="mid-class">
        <div class="img-right-side">
            <h3>我们期待您的加入</h3>
            <p>
                本商城致力于打造食用菌一站式综合购物平台，将“一荤一素一菇”健康膳食结构理念推广至更多食用菌消费人群。
            </p>
            <img src="../other/img/login/31.png" class="img-fluid" alt="">
        </div>
        <div class="txt-left-side txt-left-side-login">
            <h2> 登录 </h2>
            <form action="#" method="post" id="login-form">
                <div class="form-left-to-w3l form-input">
                    <span class="fa fa-user-o" aria-hidden="true"></span>
                    <input type="text" name="Name" placeholder="账号" id="username" required="">
                    <div class="clear username_clear"></div>
                </div>

                <div class="form-left-to-w3l form-input">
                    <span class="fa fa-lock" aria-hidden="true"></span>
                    <input type="password" name="password" placeholder="密码" id="password" required="">
                    <div class="clear password_clear"></div>
                </div>
                <div class="main-two-w3ls form-input">
                    <div class="left-side-forget">
                        <input type="checkbox" class="checked" id="checkboxNum">
                        <span class="remenber-me">记住我</span>
                    </div>
                    <div class="right-side-forget">
                        <a href="../user/showFPassword" class="for">忘记密码...?</a>
                    </div>
                </div>
                <div class="btn_login">
                    <button type="button" id="button_login" >登&nbsp;&nbsp;&nbsp;&nbsp;陆</button>
                </div>
            </form>
            <div class="w3layouts_more-buttn">
                <h3>没有账号？
                    <a href="../user/showRegister">注册
                    </a>
                </h3>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!---728x90--->
<footer class="copyrigh-wthree">
    <p>
        © Edible fungus 食用菌商城
    </p>
</footer>
</body>
<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/jquery.cookie.js"></script>

<script src="../jqueryPlug/distpicker-master/dist/distpicker.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
<script src="../jqueryPlug/confirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<script>
    //blur:鼠标失焦事件
    //当鼠标从用户名的文本框中移出的时候触发（调用）该函数
    $("#username").blur(function(){
        //alert(11111);//弹窗
        var data = $("#username").val();//获取用户在用户名文本框填写的值
        $.ajax({
            type:"POST",
            url:"../user/checkUsername",
            data:"username="+data,
            //状态：请求成功
            success:function(obj)// msg:响应信息
            {
                //alert(obj.message);
                if(obj.message ==="yes"){

                    $(".username_clear").text("用户名可用");
                    $(".username_clear").css("color","black");
                }else if(obj.message === 'no'){

                    $(".username_clear").text("用户名不存在");
                    $(".username_clear").css("color","red");
                }else {
                    $(".username_clear").text("系统异常");
                    $(".username_clear").css("color","red");
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
    $('#button_login').click(function(){
        var inputData = $('#login-form').serialize();
        $.ajax({
            type: 'POST',
            url: '../user/login',
            data:"username="+$("#username").val()+"&password="+$("#password").val(),
            success: function(obj){
                if(obj.state==0){  //登录失败
                    GrowlNotification.notify({
                        title: '登录失败',
                        type: 'error',
                        position: 'top-center',
                        closeTimeout: 1000
                    });

                }else{ //登录成功
                    if ($("#checkboxNum").is(":checked")) {
                        var str_username = $("#username").val();
                        var str_password = $("#password").val();
                        $.cookie("rmbUser", "true", { expires: 7 , path: '/'}); //存储一个带7天期限的cookie
                        $.cookie("username", str_username, { expires: 7 , path: '/'});
                        $.cookie("userpassword", str_password, { expires: 7 , path: '/'});
                    }
                    else {
                        $.cookie("rmbUser", "false", { expire: -1 , path: '/'});
                        $.cookie("username", "", { expires: -1, path: '/'});
                        $.cookie("userpassword", "", { expires: -1 , path: '/'});
                    }
                     window.location.href="../main/showIndex.do";
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
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        if ($.cookie("rmbUser") == "true") {
            $("#checkboxNum").attr("checked", true);
            $("#username").val($.cookie("username"));
            $("#password").val($.cookie("userpassword"));
        }
    });

</script>
</html>
