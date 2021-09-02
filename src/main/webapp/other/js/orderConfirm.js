$(function() {

    //点击新增地址显示添加框
    $(".btn_addaddress").on('click',function(){  
         $(".addmodal").show();
    });
    //点击X隐藏框
    $(".btn_x").on('click',function(){
        $(this).parent().parent().parent().hide();
    });
    // 寻找div（clear）中第0个按钮并判断否拥有btn-name-select这个类名，有的话就删除这个类名，没有的话就添加
    //给第一个按钮添加右下角红勾
    $(".clear").find("button:eq(0)").toggleClass('btn-name-select');


    //<!-- 设置只能一个按钮右下角红勾 -->
    $('.btn-name').on('click',function(){   
        $("button").removeClass("btn-name-select");
        // $("btn-name-select").attr("class","btn-name")  ;     
        $(this).toggleClass('btn-name-select');
        //隐藏删除
        $(this).parent().find(".user_del").hide();

        //点击姓名按钮右下角配送地址与姓名切换
        //  var Name = $(this).val();
        var province=$(this).parent().find(".province").text();
        var city=$(this).parent().find(".city").text();
        var county=$(this).parent().find(".county").text();
        var address=$(this).parent().find(".address").text();
        var name=$(this).parent().find(".address_name").text();
        var phone=$(this).parent().find(".user_phone").text();

        //  alert(user_name_phone);
        //  alert(Name1);
        //  alert(Name);
        $(".cart__total__procced2").find("li").eq(0).find("span").eq(0).text(province);
        $(".cart__total__procced2").find("li").eq(0).find("span").eq(1).text(city);
        $(".cart__total__procced2").find("li").eq(0).find("span").eq(2).text(county);
        $(".cart__total__procced2").find("li").eq(0).find("span").eq(3).text(address);
        $(".cart__total__procced2").find("li").eq(1).find("span").eq(0).text(name);
        $(".cart__total__procced2").find("li").eq(1).find("span").eq(1).text(phone);
        // alert( $(".cart__total__procced2").find("li").length);
    });



    //如果base（用户地址）数量小于二，则隐藏more（更多地址）
    if($(".base").length < 2){
            $("#more").hide();
        }

    // 收起与展开更多地址
    $(".base").hide();
    $(".base").eq(0).show();
    $("#more").click(function(){
        if($(this).hasClass("upup")){
            $(".base").hide();
            $(".base").eq(0).show();
            $("#more").html("更多地址↓");
            $(this).removeClass("upup");
        }else{
            $(".base").show();
            $("#more").html("收起地址↑");
            $("#more").addClass("upup");
        }
    })

    // 当鼠标移动到<div> base上时
    $(document).on("mouseover",".base",function(){
        // 如果本base中的span标签（默认地址）为隐藏，显示本base中所有p标签
        if($(this).find("span").length==0){
        $(this).find("p").show();
        }else{ //如果默认地址显示,
            $(this).find("p").show();    //显示所有p标签
            $(this).find(".user_site").hide();     //隐藏user_site（设为默认地址）p标签
        }   
        //当该行被选中时（按钮为右下角红勾），隐藏删除
        if($(this).find(".btn-name-select").is(":visible")){
            // alert($(this).find(".btn-name-select").is(":visible"));
            $(this).find(".user_del").hide();
        }
    })

    //当鼠标离开到<div> base时，隐藏所有p标签
    $(document).on("mouseout",".base",function(){
        $(this).find("p").hide();
    })  




    //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
        
        //…
    });
    //Demo
    // layui.use('form', function(){
    //     var form = layui.form;
    //     //监听提交
    //     form.on('submit(formDemo)', function(data){
    //         layer.msg(JSON.stringify(data.field));
    //         return false;
    //     });
    // });

    layui.use(['form'], function(){
        var form = layui.form
        //   ,layer = layui.layer
        //   ,layedit = layui.layedit
        //   ,laydate = layui.laydate;
        //   //表单取值
        //   layui.$('#LAY-component-form-getval').on('click', function(){
        //     var data = form.val('example');
        //     alert(JSON.stringify(data));
        //   });

    });
}); 