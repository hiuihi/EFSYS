
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>注册 </title>

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
<h1 class="error">欢迎注册</h1>
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
        <div class="txt-left-side">
            <h2> 注册 </h2>
            <form action="#" method="post" id="form-register">
                <div class="form-left-to-w3l form-input">
                    <span class="fa fa-user-o" aria-hidden="true"></span>
                    <input type="text" name="Name" placeholder="账号" id="username" required="">
                    <div class="clear" id="username_clear"></div>
                </div>
<%--                <div class="form-left-to-w3l">--%>
<%--                    <span class="fa fa-user-o" aria-hidden="true"></span>--%>
<%--                    <input type="text" name="username" placeholder="账号" required="" id="username">--%>
<%--                    <div class="username_clear"></div>--%>
<%--                </div>--%>
                <div class="form-left-to-w3l">
                    <span class="fa fa-phone" aria-hidden="true"></span>
                    <input type="text" name="phone" placeholder="手机号" required=""id="phone">
                    <div class="clear" id="phone_clear"></div>
                </div>
<%--                <div class="form-left-to-w3l">--%>
<%--                    <span class="fa fa-envelope-o" aria-hidden="true"></span>--%>
<%--                    <input type="email" name="email" placeholder="邮箱" required="">--%>

<%--                    <div class="clear"></div>--%>
<%--                </div>--%>
                <div class="form-left-to-w3l ">
                    <span class="fa fa-lock" aria-hidden="true"></span>
                    <input type="password" name="password" placeholder="密码" required="" id="password">
                    <div class="clear" id="password_clear"></div>
                </div>
                <div class="form-left-to-w3l ">
                    <span class="fa fa-lock" aria-hidden="true"></span>
                    <input type="password" name="newpassword" placeholder="确认密码" required="" id="newpassword">
                    <div class="clear" id="newpassword_clear"></div>
                </div>
                <div class="form-left-to-w3l">
                    <span class="fa fa-question-circle" aria-hidden="true"></span>
                    <select name="securityQuestion" class="securityQuestion" id="securityQuestion">
                        <option value="请选择" selected>设置密保以找回密码</option>
                        <option value="你父母亲的姓名">你父母亲的姓名</option>
                        <option value="你的生日">你的生日</option>
                        <option value="你毕业于哪个初中">你毕业于哪个初中</option>
                        <option value="你喜欢看的电影">你喜欢看的电影</option>
                        <option value="你的学号(或工号)是">你的学号(或工号)是</option>
                        <option value="你小学班主任的名字是">你小学班主任的名字是</option>
                        <option value="你最熟悉的童年好友名字是">你最熟悉的童年好友名字是</option>
                        <option value="你最熟悉的学校宿舍舍友名字是">你最熟悉的学校宿舍舍友名字是</option>
                        <option value="对你影响最大的人名字是">对你影响最大的人名字是</option>
                    </select>
                    <div class="clear" id="securityQuestion_clear"></div>
                </div>
                <div class="form-left-to-w3l">
                    <span class="fa fa-info-circle" aria-hidden="true"></span>
                    <input type="text" name="answer" id="answer" placeholder="答案" required="">
                    <div class="clear" id="answer_clear"></div>
                </div>




                <div class="btnn">
                    <button type="button" id="bt-register">注&nbsp;&nbsp;&nbsp;&nbsp;册</button>
                </div>
            </form>
            <div class="w3layouts_more-buttn">
                <h3>已有账号
                    <a href="../user/showLogin.do">登录
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
    $('#bt-register').click(function(){//点击提交按钮触发该函数
        var str_username = $("#username").val();
        var str_password = $("#password").val();
        var lengths=0;//电仪变量
        $('.form-left-to-w3l').each(function(){//循环
            if($(this).find('div').hasClass('cleared')){//
                lengths++;
            }
        });
            if(lengths==6){//当span有六个success属性值的时候
                $.ajax({
                    url:"../user/register",
                    data:$("#form-register").serialize(),//将表单序列化
                    type:"post",
                    dataType:"json",
                    success:function(obj){
                        if(obj.state==1){
                            GrowlNotification.notify({
                                title: '注册成功',
                                type: 'success',
                                position: 'top-center',
                                closeTimeout: 1000
                            });

                            $.cookie("rmbUser", "true", { expires: 7 , path: '/'}); //存储一个带7天期限的cookie
                            $.cookie("username", str_username, { expires: 7 , path: '/'});
                            $.cookie("userpassword", str_password, { expires: 7 , path: '/'});
                            setTimeout( 'window.location.href="../main/showIndex.do"',200);

                        }else{
                            //注册失败
                            alert("注册失败！");
                        }
                    }
                });

            }else{
                //alert("3");
                var username =$('#username').val();
                var phone =$('#phone').val();
                var password =$('#password').val();
                var securityQuestion =$('#securityQuestion').val();
                var newpassword =$('#newpassword').val();
                var answer =$('#answer').val();
                if (username===''){
                    $("#username_clear").text("账户不能为空");
                }
                if (phone===''){
                    $("#phone_clear").text("手机号不能为空");
                }
                if (password===''){
                    $("#password_clear").text("密码不能为空");
                }
                if (newpassword===''){
                    $("#newpassword_clear").text("密码不能为空");
                }
                if (securityQuestion=="请选择"){
                    $("#securityQuestion_clear").text("请选择");
                }
                if (answer===''){
                    $("#answer_clear").text("答案不能为空");
                }
            }

    })
</script>
<!--验证-->
<script>

    /*1.对用户名进行验证*/
    $('#username').blur(function(){
            /**发起异步GET请求，询问服务器用户名是否已经存在**/
            var username =$(this).val();
            //alert(a);
            if (username ==''){
                $("#username_clear").text("账号不能为空");
                $("#username_clear").removeClass("cleared")
                $("#username_clear").css("color","red");
            }else{
                $.ajax({
                    url:"../user/checkUsername",
                    data:"username="+$("#username").val(),
                    type:"get",
                    dataType:"json",
                    success:function(obj){
                        if(obj.state==0){
                            $("#username_clear").text("用户名被占用");
                            $("#username_clear").removeClass("cleared")
                            $("#username_clear").css("color","red");
                            // $("#unamespan").attr("class","msg-error");
                            // $("#unamespan").html("该用户名被占用");
                        }else{
                            //alert(obj.message);
                            $("#username_clear").text("用户名正常");
                            $("#username_clear").addClass("cleared")
                            $("#username_clear").css("color","black");
                            // $("#unamespan").attr("class","msg-success");
                            // $("#unamespan").html("该用户名正常使用");
                        }
                    }
                });
            }
    } );

    /*2.对手机号进行验证*/
    $('#phone').blur(function(){
            eval("var reg = /^1[34578]\\d{9}$/;");

            var phone=$(this).val();
            //alert(a);
            if (phone ==''){
                $("#phone_clear").text("手机号不能为空");
                $("#phone_clear").removeClass("cleared")
                $("#phone_clear").css("color","red");
            }else{
                 var isPhone=RegExp(reg).test(phone);
                 if (!isPhone){
                     $("#phone_clear").text("手机号不规范");
                     $("#phone_clear").removeClass("cleared")
                     $("#phone_clear").css("color","red");
                 }else{
                     $.ajax({
                         url:"../user/checkPhone",
                         data:"phone="+$("#phone").val(),
                         type:"get",
                         dataType:"json",
                         success:function(obj){
                             if(obj.state==0){
                                 $("#phone_clear").text("手机号被占用");
                                 $("#phone_clear").removeClass("cleared")
                                 $("#phone_clear").css("color","red");
                                 // $("#unamespan").attr("class","msg-error");
                                 // $("#unamespan").html("该用户名被占用");
                             }else{
                                 //alert(obj.message);
                                 $("#phone_clear").text("手机号正常");
                                 $("#phone_clear").addClass("cleared")
                                 $("#phone_clear").css("color","black");
                                 // $("#unamespan").attr("class","msg-success");
                                 // $("#unamespan").html("该用户名正常使用");
                             }
                         }
                     });
                 }
            }
    } )

    /*3.对密码进行验证*/
    $('#password').blur(function(){
        var password=$(this).val();
        var newpassword=$('#newpassword').val();

        if (password===''){
            $("#password_clear").text("密码不能为空");
            $("#password_clear").removeClass("cleared");
            $("#password_clear").css("color","red");

        }else{
            if (password==newpassword){
                $("#password_clear").text("密码正常");
                $("#newpassword_clear").text("密码正常");
                $("#password_clear").addClass("cleared");
                $("#password_clear").css("color","black");
                $("#newpassword_clear").addClass("cleared");
                $("#newpassword_clear").css("color","black");
            }else{
                $("#newpassword_clear").text("密码不一致");
                $("#newpassword_clear").removeClass("cleared")
                $("#newpassword_clear").css("color","red");
                $("#password_clear").text("密码不一致");
                $("#password_clear").removeClass("cleared")
                $("#password_clear").css("color","red");
            }


        }
    } );

    $('#newpassword').blur(function(){
        var password=$('#password').val();
        var newpassword=$(this).val();
        // alert(password);
        // alert(newpassword);
        // alert(newpassword===password);
        if (newpassword===password){
            $("#password_clear").text("密码正常");
            $("#newpassword_clear").text("密码正常");
            $("#password_clear").addClass("cleared");
            $("#password_clear").css("color","black");
            $("#newpassword_clear").addClass("cleared");
            $("#newpassword_clear").css("color","black");
        }else{
                $("#newpassword_clear").text("密码不一致");
                $("#newpassword_clear").removeClass("cleared")
                $("#newpassword_clear").css("color","red");
                $("#password_clear").text("密码不一致");
                $("#password_clear").removeClass("cleared")
                $("#password_clear").css("color","red");
        }
    } );
    $('#securityQuestion').blur(function(){
        var securityQuestion=$('#securityQuestion').val();
        // alert(password);
        // alert(newpassword);
        // alert(newpassword===password);
        if (securityQuestion==='请选择'){
            $("#securityQuestion_clear").text("请选择");
            $("#securityQuestion_clear").removeClass("cleared")
            $("#securityQuestion_clear").css("color","red");
        }else{
            $("#securityQuestion_clear").text("密保正常");
            $("#securityQuestion_clear").addClass("cleared");
            $("#securityQuestion_clear").css("color","black");
        }
    } );
    $('#answer').blur(function(){
        var answer=$('#answer').val();
        var securityQuestion=$('#securityQuestion').val();
        if (answer===''){
            $("#answer_clear").text("答案为空");
            $("#answer_clear").removeClass("cleared")
            $("#answer_clear").css("color","red");

        }else{
            if (securityQuestion==='请选择'){
                $("#answer_clear").text("请设置密保");
                $("#answer_clear").removeClass("cleared")
                $("#answer_clear").css("color","red");
            }else{
                $("#answer_clear").text("答案正常");
                $("#answer_clear").addClass("cleared");
                $("#answer_clear").css("color","black");
            }
        }
    } );
</script>
</html>
