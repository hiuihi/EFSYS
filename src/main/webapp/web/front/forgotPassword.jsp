
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>找回密码</title>
    <link href="../other/css/forgotPassword.css" rel="stylesheet">
    <link href="../layui/css/layui.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/light-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/dark-theme.min.css" rel="stylesheet">
    <link href="../jqueryPlug/notice/colored-theme.min.css" rel="stylesheet">
</head>
<body>
<div style="height:100%;">
    <div class="rebinding-box">
        <div class="box-title">
            <h2 class="mtb5">找回密码</h2>
            <i>为了保障您的帐户安全，请谨慎填写</i>
        </div>
        <div class="box-timeline">
            <ul class="text-center" style="width: 1000px;">
                <li>
                    输入账号
                    <div class="box-num1">
                        1
                    </div>
                </li>
                <li class="ml45">
                    问题验证
                    <div class="box-outside1 outside1ab" id="outside1abs">
                        <div class="box-num2 num2ab">
                            2
                        </div>
                    </div>
                </li>
                <li class="ml45">
                    填写新密码
                    <div class="box-outside2 outside2ab" id="outside2as">
                        <div class="box-num3 num3ab">
                            3
                        </div>
                    </div>
                </li>
                <li class="ml45">
                    完成
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
                <div class="oneform-box">
                    <label class="oneform-label">登录账号</label>
                    <div class="oneform-input">
                        <input id="userName" autocomplete="off" placeholder="请填写要找回密码的帐号">
                    </div>
                </div>
                <div class="onebtn-box">
                    <button class="onebtn" id="onebtn" onclick="fun()">下一步</button>
                </div>
            </div>
        </div>
        <!--第二步-->
        <div class="twobox-form" id="twoform">
            <div class="twoform">
                <div class="twoform-box">
                    <div class="newtel">
                        <label class="twoform-label">密保问题</label>
                        <div class="twoform-input">
                            <input type="text" id="securityQuestion" readonly="readonly" >
                        </div>
                    </div>

                    <div class="validatecode">
                        <label class="twoform-label2">答案</label>
                        <div class="twoform-input2">
                            <input type="hidden" id="hide_answer">
                            <input type="text" autocomplete="off" id="answer" placeholder="请输入">
                        </div>
                    </div>
                </div>
            </div>
            <div class="twobtn-box">
                <button class="twobtn" id="twobtn" onclick="fun1()">下一步</button>
            </div>
        </div>
        <!--第三步-->
        <div class="threebox-form twobox-form" id="threeform">
            <div class="threeform">
                <div class="threeform-box">
                    <div class="newtel">
                        <label class="threeform-label">新密码</label>
                        <div class="threeform-input3">
                            <input type="password" id="pwd" autocomplete="off" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="validatecode">
                        <label class="threeform-label3">确认密码</label>
                        <div class="threeform-input3">
                            <input type="password" autocomplete="off" id="repwd" placeholder="请确认输入密码">
                        </div>
                    </div>
                </div>
            </div>
            <div class="threebtn-box">
                <button class="threebtn" id="threebtn" onclick="fun2()">下一步</button>
            </div>
        </div>
        <!--第四步-->
        <div class="fourbox-form" id="fourform">
            <div class="successr">
                <div class="symbol">

                </div>
                <p>恭喜您，修改密码成功！</p>
            </div>
        </div>
    </div>
</div>

<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/jquery.cookie.js"></script>

<script src="../layui/layui.js"></script>
<script src="../jqueryPlug/notice/growl-notification.min.js"></script>
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
        var userName = $("#userName").val();
        if (userName == "") {
            GrowlNotification.notify({
                title: '请输入',
                type: 'error',
                position: 'top-center',
                closeTimeout: 1000
            });
        }else{
            $.ajax({
                type:"POST",
                url:"../user/checkUsername",
                data:"username="+userName,
                dataType:'json',
                //状态：请求成功
                success:function(obj)// msg:响应信息
                {
                    //alert(obj.message);
                    if(obj.message ==="yes"){
                        $('#securityQuestion').val(obj.data.securityQuestion);
                        $('#hide_answer').val(obj.data.answer);
                        soutside1ab.classList.remove("outside1ab");
                        oneforms.style.display = "none";
                        twoforms.style.display = "block";

                    }else if(obj.message === 'no'){
                        GrowlNotification.notify({
                            title: '用户名不存在',
                            type: 'error',
                            position: 'top-center',
                            closeTimeout: 1000
                        });
                    }else {
                       alert("系统异常");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
            GrowlNotification.notify({
                title: 'is:'+is,
                type: 'error',
                position: 'top-center',
                closeTimeout: 1000
            });
        }


    }
    //验证密保问题
    function fun1() {
        var hide_answer = $("#hide_answer").val();
        var answer = $("#answer").val();
        if (answer==''){
            GrowlNotification.notify({
                title: '请输入',
                type: 'error',
                position: 'top-center',
                closeTimeout: 1000
            });
        }else{
            if (hide_answer===answer){
                threeforms.style.display = "block";
                twoforms.style.display = "none";
                soutside2as.classList.remove("outside2ab");
            }else{
                GrowlNotification.notify({
                    title: '答案不正确',
                    type: 'error',
                    position: 'top-center',
                    closeTimeout: 1000
                });
            }
        }
    }
    //修改密码
    function fun2() {
        var userName = $("#userName").val();
        var pwd= $("#pwd").val();
        var repwd = $("#repwd").val();

        if (pwd != repwd) {
            GrowlNotification.notify({
                title: '密码不一致',
                type: 'error',
                position: 'top-center',
                closeTimeout: 1000
            });
        }else{
            $.ajax({
                type:"POST",
                url:"../user/retrievePassword",
                data:"username="+userName+"&password="+pwd,
                //状态：请求成功
                success:function(obj)// msg:响应信息
                {
                    //alert(obj.message);
                    if(obj.state ===1){
                        fourforms.style.display = "block";
                        threeforms.style.display = "none";
                        soutside3as.classList.remove("outside3a");
                        $.cookie("rmbUser", "false", { expire: -1 , path: '/'});
                        $.cookie("username", "", { expires: -1, path: '/'});
                        $.cookie("userpassword", "", { expires: -1 , path: '/'});
                        GrowlNotification.notify({
                            title: '修改成功，即将跳转登录页面...',
                            type: 'success',
                            position: 'top-center',
                            closeTimeout: 3000
                        });
                        setTimeout( 'window.location.href="../user/showLogin.do"',3000);
                    } else {
                        alert("失败");
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
</script>
</body>
</html>