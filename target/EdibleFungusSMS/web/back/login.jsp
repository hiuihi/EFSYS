
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>管理员登录</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords"
          content="Exploring travel form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

    <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="../other/css/loginB.css" type="text/css" media="all" />

    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
</head>

<body>

<section class="w3l-travel-form">

    <div class="travel-form-grid">
        <div class="wrapper">
            <div class="logo">
                <a class="brand-logo" href="index.html">后台 <span>登录</span></a>
                <!--  logo    -->
                <!-- <a class="brand-logo" href="#index.html">
                    <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
                </a> -->
            </div>
            <div class="travel-block-grid">
                <div class="travel-left-img align-end">
                    <img src="../other/img/login/4.jpg" class="img-responsive" alt="img" />
                </div>
                <div class="form-right-inf">
                    <div class="booking-form-content">
                        <h2>登录</h2>

                        <form action="#" class="book-depature-6 signin-form" method="post">
                            <div class="input-grids">
                                <input class="name"  type="text" placeholder="账号" id="adminName">
                            </div>
                            <div class="input-grids">
                                <input class="password"  type="password" placeholder="密码" id="password">
                            </div>
                            <label class="check-remaind">
                                <input type="checkbox" id="checkboxNum">
                                <span class="checkmark"></span>
                                <p class="remember">记住我</p>
                            </label>
                        </form>
                        <button class="btn btn-style mt-3" id="btn-login">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="copyright text-center">
        <div class="wrapper">
            <p class="copy-footer-29"> © Edible fungus 食用菌后台管理</p>
        </div>
    </div>
</section>
<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/jquery.cookie.js"></script>

<script src="../jqueryPlug/notice/growl-notification.min.js"></script>

<!--登录-->
<script>
    $('#btn-login').click(function(){
        $.ajax({
            type: 'POST',
            url: '../back/login',
            data:"adminName="+$("#adminName").val()+"&password="+$("#password").val(),
            // dataType:'json',
            success: function(obj){
                if(obj.state==0){  //登录失
                    GrowlNotification.notify({
                        title: '登录失败',
                        type: 'error',
                        position: 'top-center',
                        closeTimeout: 1000
                    });

                }else{ //登录成功
                    if ($("#checkboxNum").is(":checked")) {
                        var str_adminName = $("#adminName").val();
                        var str_password = $("#password").val();
                        $.cookie("rmbAdmin", "true", { expires: 7 , path: '/'}); //存储一个带7天期限的cookie
                        $.cookie("adminName", str_adminName, { expires: 7 , path: '/'});
                        $.cookie("adminpassword", str_password, { expires: 7 , path: '/'});
                    }
                    else {
                        $.cookie("rmbAdmin", "false", { expire: -1 , path: '/'});
                        $.cookie("adminName", "", { expires: -1, path: '/'});
                        $.cookie("adminpassword", "", { expires: -1 , path: '/'});
                    }
                    window.location.href="../back/showIndex.action";
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
<!--自动填写账号密码-->
<script type="text/javascript">
    $(document).ready(function () {
        if ($.cookie("rmbAdmin") == "true") {
            $("#checkboxNum").attr("checked", true);
            $("#adminName").val($.cookie("adminName"));
            $("#password").val($.cookie("adminpassword"));
        }
    });

</script>
</body>
</html>
