
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>食用菌后台管理系统</title>
    <link rel="stylesheet" href="../layui/css/layui.css" >
    <link href="../other/css/chat-b.css" rel="stylesheet" type="text/css" >
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><i style="color: #918f8f;;font-style:normal;font-size: 120%;">食用菌后台管理系统</i></div>
        <ul class="layui-nav layui-layout-right">

<%--            <li class="layui-nav-item">--%>
<%--                <a href="">个人中心<span class="layui-badge-dot"></span></a>--%>
<%--            </li>--%>
            <li class="layui-nav-item">
                <a href="">
<%--                    <img src="//t.cn/RCzsdCq" class="layui-nav-img">--%>
                    我</a>
                <dl class="layui-nav-child">
<%--                    <dd><a href="javascript:;">修改信息</a></dd>--%>
<%--                    <dd><a href="http://www.baidu.com">安全管理</a></dd>--%>
                    <dd><a href="../back/showLogin.action">退了</a></dd>
                </dl>
            </li>
        </ul>

        <!-- <ul class="layui-nav layui-layout-right"> -->
        <!-- <li class="layui-nav-item">
        欢迎光临，商户001
        </li>
        <li class="layui-nav-item"><a href="">安全退出</a></li>
        </ul> -->
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧垂直导航区域-->
            <ul class="layui-nav layui-nav-tree " lay-filter="test">
<%--                <li class="layui-nav-item">--%>
<%--                    <a class="" href="javascript:;" >主页</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;" data-id="index1" data-title="主页1" data-url="../back/showIndex1.action"--%>
<%--                               class="site-demo-active" data-type="tabAdd">主页1</a></dd>--%>

<%--                    </dl>--%>
<%--                </li>--%>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;" >商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-id="goods" data-title="商品" data-url="../bgoods/showGoods.action"
                               class="site-demo-active" data-type="tabAdd">商品</a></dd>
                        <dd><a href="javascript:;" data-id="inv" data-title="库存预警" data-url="../bgoods/showInventory.action"
                               class="site-demo-active" data-type="tabAdd">库存预警</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;" >人员</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-id="user" data-title="用户" data-url="../buser/showUser.action"
                               class="site-demo-active" data-type="tabAdd">用户</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;" >订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-id="order" data-title="订单" data-url="../border/showOrder.action"
                               class="site-demo-active" data-type="tabAdd">订单</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;" >销售</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-id="sell" data-title="销售统计" data-url="../back/showSalesStatistics.action"
                               class="site-demo-active" data-type="tabAdd">销售统计</a></dd>
                    </dl>
                </li>
<%--                <li class="layui-nav-item ">--%>
<%--                    <a href="javascript:;" >系统管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;" data-id="5" data-title="支付API设置"--%>
<%--                               data-url="https://www.iqiyi.com/" class="site-demo-active" data-type="tabAdd">支付API设置</a></dd>--%>
<%--                        <dd><a href="javascript:;" data-id="6" data-title="公告设置"--%>
<%--                               data-url="index.php?&a=adminList" class="site-demo-active" data-type="tabAdd">公告设置</a></dd>--%>
<%--                        <dd><a href="javascript:;" data-id="" data-id="7" data-title="控制台"--%>
<%--                               data-url="index.php?&a=adminList" class="site-demo-active" data-type="tabAdd">控制台</a></dd>--%>
<%--                </li>--%>

            </ul>
        </div>
    </div>

    <!--tab标签-->
    <div class="layui-tab " lay-filter="demo" lay-allowclose="true" style="margin-left: 200px;">
        <ul class="layui-tab-title " ></ul>
        <div class="layui-tab-content " style="background-color:#e2e2e2"></div>
    </div>

    <!-- 信息 -->
    <div class="chatContainer">
        <div class="chatBtn">
            <i class="layui-icon layui-icon-email"></i>
        </div>
        <div class="chat-message-num" style="display: none;">0</div>
        <div class="chatBox" ref="chatBox">
            <div class="chatBox-head">
                <div class="chatBox-head-one">
                    信息<span></span>
                    <div class="chat-close" style="margin: 10px 10px 0 0;font-size: 14px">关闭</div>
                </div>
                <div class="chatBox-head-two">
                    <div class="chat-return">返回</div>
                    <div class="chat-people">
                        <div class="ChatInfoHead">
                            <img src="../../other/img/icon/1.jpeg" alt="头像"/>
                        </div>
                        <div class="ChatInfoName">客服1号</div>
                    </div>
                    <div class="chat-close">关闭</div>
                </div>
            </div>
            <div class="chatBox-info">
                <div class="chatBox-list" ref="chatBoxlist">

<%--                    <div class="chat-list-people">--%>
<%--                        <div><img src="img/icon01.png" alt="头像"/></div>--%>
<%--                        <div class="chat-name">--%>
<%--                            <p>自酌一杯酒</p>--%>
<%--                        </div>--%>
<%--                        <div class="message-num">10</div>--%>
<%--                    </div>--%>
                </div>
                <div class="chatBox-kuang" ref="chatBoxkuang">
                    <div class="chatBox-content">
<%--                        <div class="chatBox-content-demo" id="chatBox-content-demo">--%>

<%--                        </div>--%>
                    </div>
                    <div class="chatBox-send">
                        <div class="div-textarea" contenteditable="true"></div>
                        <div>
                            <button id="chat-fasong" class="btn-default-styles" title="发送"><i class="layui-icon layui-icon-release"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 底部固定区域 -->
    <!-- <div class="layui-footer" style="text-align:center;">

        © Edible fungus 食用菌后台管理系统
    </div> -->
</div>
<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/sockjs.min.js"></script>

<script src="../layui/layui.js"></script>


<!--发送消息-->
<script>

    screenFuc();
    function screenFuc() {
        var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
        //屏幕小于768px时候,布局change
        var winWidth = $(window).innerWidth();
        if (winWidth <= 768) {
            var totalHeight = $(window).height(); //页面整体高度
            $(".chatBox-info").css("height", totalHeight - topHeight);
            var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
            //中间内容高度
            $(".chatBox-content").css("height", infoHeight - 46);
            $(".chatBox-content-demo").css("height", infoHeight - 46);

            $(".chatBox-list").css("height", totalHeight - topHeight);
            $(".chatBox-kuang").css("height", totalHeight - topHeight);
            $(".div-textarea").css("width", winWidth - 106);
        } else {
            $(".chatBox-info").css("height", 495);
            $(".chatBox-content").css("height", 448);
            $(".chatBox-content-demo").css("height", 448);
            $(".chatBox-list").css("height", 495);
            $(".chatBox-kuang").css("height", 495);
            $(".div-textarea").css("width", 260);
        }
    }
    (window.onresize = function () {
        screenFuc();
    })();
    //未读信息数量为空时
    var totalNum = $(".chat-message-num").html();
    if (totalNum == "") {
        $(".chat-message-num").css("padding", 0);
    }
    $(".message-num").each(function () {
        var wdNum = $(this).html();
        if (wdNum == "") {
            $(this).css("padding", 0);
        }
    });


    //打开/关闭聊天框
    $(".chatBtn").click(function () {
        $(".chatBox").toggle(10);
    })
    $(".chat-close").click(function () {
        $(".chatBox").toggle(10);
    })
    //进聊天页面
    // $(".chat-list-people").each(function () {
    //     $(this).click(function () {
    //         var n = $(this).index();
    //         $(".chatBox-head-one").toggle();
    //         $(".chatBox-head-two").toggle();
    //         $(".chatBox-list").fadeToggle();
    //         $(".chatBox-kuang").fadeToggle();
    //
    //         //传名字
    //         $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());
    //
    //         //传头像
    //         $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));
    //
    //         //聊天框默认最底部
    //         $(document).ready(function () {
    //             $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
    //         });
    //     })
    // });

    //返回列表
    $(".chat-return").click(function () {
        $(".chatBox-head-one").toggle(1);
        $(".chatBox-head-two").toggle(1);
        $(".chatBox-list").fadeToggle(1);
        $(".chatBox-kuang").fadeToggle(1);
    });

    //      发送信息
    // $("#chat-fasong").click(function () {
    //     var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
    //     if (textContent != "") {
    //         $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
    //             "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
    //             "<div class=\"right\"> <div class=\"chat-message\"> " + textContent + " </div> " +
    //             "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
    //         //发送后清空输入框
    //         $(".div-textarea").html("");
    //         //聊天框默认最底部
    //         $(document).ready(function () {
    //             $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
    //         });
    //     }
    // });




</script>
<script type="text/javascript">
    $(function() {
        var websocket;
        if('WebSocket' in window) {
            console.log("此浏览器支持websocket");
            websocket = new WebSocket("ws://localhost:8088/EdibleFungusSMS/websocket/88");
        } else if('MozWebSocket' in window) {
            alert("此浏览器只支持MozWebSocket");
        } else {
            alert("此浏览器只支持SockJS");
        }
        websocket.onopen = function(evnt) {
            $(".chatBox-head-one").find("span").text("..在线")

            // $(".chatBox-head-one").append("链接服务器成功!")
        };
        websocket.onmessage = function(evnt) {
            var us=evnt.data;
            var u=new Array();
            var boo=false;
            u=us.split(",");
            var userids=$(".chatBox-list").find(".h_userid");
            userids.each(function(){
                if ($(this).val()==u[3]){
                    boo = true;
                }
            });

               // 不相同说明是新的人发来消息就加到列表
               if (boo==false) {

                   //追加人
                   $(".chatBox-list").append(
                        '<div class="chat-list-people" id="clp'+u[3]+'" onclick="goPel(\''+u[3]+'\',\''+u[4]+'\',\''+u[0]+'\');">'+
                        // '<div class="chat-list-people" id="clp'+u[3]+'">'+
                        '<input type="hidden" class="h_userid" value="'+u[3]+'">'+
                            '<div><img src="..'+u[0]+'" alt="头像"/></div>'+
                            '<div class="chat-name">'+
                                '<p>'+u[4]+'</p>'+
                            ' </div>'+
                            ' <div class="message-num">1</div>'+
                        '</div>'
                   );
                   //追加聊天记录
                   $(".chatBox-content").append(
                        '<div class="chatBox-content-demo" id="'+u[3]+'">'+
                       '<div class=\"clearfloat\">' +
                       '<div class=\"author-name\"><small class=\"chat-date\">'+u[1]+'</small> </div>'  +
                       '<div class=\"left\"> ' +
                       '<div class=\"chat-avatars\"><img src="..'+u[0]+'" alt=\"头像\" /></div> '+
                       '<div class=\"chat-message\"> ' + u[2] + '</div> </div></div>'
               );
                    //信息小红点数字加一
                   var b=$(".chatContainer").find(".chat-message-num");
                   b.show();
                   var snum=Number(b.text());
                   b.text(snum+1);
               }else{

               //    否则是已经聊过的人发来信息，追加到对应的聊天记录上
                   $(".chatBox-content").find("#"+u[3]).append(
                       '<div class=\"clearfloat\">' +
                       '<div class=\"author-name\"><small class=\"chat-date\">'+u[1]+'</small> </div>'+
                       '<div class=\"left\"> ' +
                       '<div class=\"chat-avatars\"><img src="..'+u[0]+'" alt=\"头像\" /></div> '+
                       '<div class=\"chat-message\"> ' + u[2] + '</div> </div></div>'

                    );
                   if ($("#"+u[3]).is(":hidden")){
                       //列表个人小红点数字加一
                       var a=$(".chatBox-list").find("#clp"+u[3]).find(".message-num");
                       a.show();
                       var num=Number(a.text());
                       a.text(num+1);
                       //信息小红点数字加一
                       var b=$(".chatContainer").find(".chat-message-num");
                       b.show();
                       var snum=Number(b.text());
                       b.text(snum+1);
                   }

               }
            // $(document).ready(function () {
            //     $(".chatBox-content-demo").scrollTop($(".chatBox-content-demo")[0].scrollHeight);
            // });
        };
        websocket.onerror = function(evnt) {};
        websocket.onclose = function(evnt) {
            $(".chatBox-head-one").find("span").text("..离线")
            // $(".chatBox-head-one").find("span").text("与服务器断开了链接!")
        }

        $('#chat-fasong').bind('click', function() {
            var demo=$(this).parent().parent().parent().parent().find(".chatBox-content-demo");
            var userid;
            demo.each(function () {
               if (!$(this).is(":hidden")){
                   userid=$(this).attr("id");
               }
            });
            // var userid=$(this).parent().parent().parent().parent().find(".chatBox-content-demo").attr("id");
            // alert("userid :"+userid);
            var date=new Date();
            date=date.format("yyyy-MM-dd hh:mm:ss");
            var icon="/other/img/defaultavatar/customerService.jpeg";
            var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>');
            if (textContent != "") {
                $(".chatBox-content").find("#"+userid).append(
                    '<div class=\"clearfloat\">' +
                    '<div class=\"author-name\"><small class=\"chat-date\">'+
                    date+
                    '</small> </div> ' +
                    '<div class=\"right\"> <div class=\"chat-message\"> ' +  textContent + '</div> ' +
                    '<div class=\"chat-avatars\"><img src="'+'..'+icon+'" alt=\"头像\" /></div> </div> </div>'
                );
                //聊天框默认最底部
                // $(document).ready(function () {
                //     $(".chatBox-content-demo").scrollTop($(".chatBox-content-demo")[0].scrollHeight);
                // });
                $(document).ready(function () {
                    $(".chatBox-content-demo").scrollTop($(".chatBox-content-demo")[0].scrollHeight);
                });
            }
            send(userid);
        });

        function send(userid) {
            if(websocket != null) {
                var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>');
                if (textContent != "") {
                    var message = textContent;
                    $.ajax({
                        url:"../message/TestWS?userId="+userid+"&message="
                            +message+"&uid="
                            +"",
                        type:"GET",
                        success: function(result){

                        }
                    });

                    // $.ajax({
                    //     url:"../message/TestWS?userId=66&message="
                    //         +message,
                    //     type:"GET",
                    //     success: function(result){
                    //
                    //     }
                    // });
                    $(".div-textarea").html("");

                }

            } else {
                alert('未与服务器链接.');
            }
        }
    });
</script>
<!-- 显示对应用户的聊天界面 -->
<script>
    //显示对应用户的聊天界面
    function goPel(u,name,icon){
        $(".chatBox-head-one").toggle();
        $(".chatBox-head-two").toggle();
        $(".chatBox-list").fadeToggle();
        $(".chatBox-kuang").fadeToggle();
        $(".chatBox-content-demo").each(function () {
                $(this).hide();
            }
        );
        $("#"+u).show();
        $(".ChatInfoName").text(name);
            $(".ChatInfoHead>img").attr("src", ".."+icon);
        //个人小红点
        var a=$(".chatBox-list").find("#clp"+u).find(".message-num");
        var num=Number(a.text());
        a.text(0);
        a.hide();

        //信息小红点数字减
        var b=$(".chatContainer").find(".chat-message-num");
        b.show();
        var snum=Number(b.text());
        b.text(snum-num);
        if (b.text()=='0'){
            b.hide();
        }
        //聊天框默认最底部
        $(document).ready(function () {
            $(".chatBox-content-demo").scrollTop($(".chatBox-content-demo")[0].scrollHeight);
        });
    }

    // $('.chat-list-people').each(function (){
    //    $(this).on('click', function(){
    //        alert("1");
    //        var userid=$(this).find(".h_userid").val();
    //        alert("1:"+userid);
    //        var name=$(this).find("p").text();
    //        var img=$(this).find("img").attr("src");
    //
    //        $(".chatBox-head-one").toggle();
    //        $(".chatBox-head-two").toggle();
    //        $(".chatBox-list").fadeToggle();
    //        $(".chatBox-kuang").fadeToggle();
    //        // $(".chatBox-content-demo").each(function () {
    //        //         $(this).hide();
    //        //     }
    //        // );
    //        $("#"+userid).show();
    //        $(".ChatInfoName").text(name);
    //        $(".ChatInfoHead>img").attr("src", img);
    //        //个人小红点
    //        var a=$(".chatBox-list").find("#clp"+userid).find(".message-num");
    //        var num=Number(a.text());
    //        a.text(0);
    //        a.hide();
    //
    //        //信息小红点数字减
    //        var b=$(".chatContainer").find(".chat-message-num");
    //        b.show();
    //        var snum=Number(b.text());
    //        b.text(snum-num);
    //        if (b.text()=='0'){
    //            b.hide();
    //        }
    //        //聊天框默认最底部
    //        $(document).ready(function () {
    //            $(".chatBox-content-demo").scrollTop($(".chatBox-content-demo")[0].scrollHeight);
    //        });
    //
    //
    //    }) ;
    // });


</script>

<script>
    layui.use(['element', 'layer', 'jquery'], function () {
        var element = layui.element;
        // var layer = layui.layer;
        var $ = layui.$;

        // 配置tab实践在下面无法获取到菜单元素
        $('.site-demo-active').on('click', function () {
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在
                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                })
                FrameWH(); //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
        };
        function FrameWH() {
            var h = $(window).height();
            // $("iframe").css("height",h+"px");
            $("iframe").css("height","630px");
        }
    });
</script>
<!--jq时间转换-->
<script>
    //jq时间转换
    Date.prototype.format = function(fmt)
    {
        var o = {
            "M+" : this.getMonth()+1, //月份
            "d+" : this.getDate(), //日
            "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
            "H+" : this.getHours(), //小时
            "m+" : this.getMinutes(), //分
            "s+" : this.getSeconds(), //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S" : this.getMilliseconds() //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }

</script>
</body>
</html>
