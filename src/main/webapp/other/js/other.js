$(function(){
        //弹出层显示商品删除成功等
        $.pop_up=function(a){
            if (!$('#pop_up').is(':visible')) {
                $('#pop_up').text(a);
                $('#pop_up').css({display: 'block', top: '-100px'}).animate({top: '+60'}, 500, function () {
                    setTimeout(out, 600);
                });

            }
        }
        function out() {
            $('#pop_up').animate({top: '0'}, 500, function () {
                $(this).css({display: 'none', top: '-100px'});
            });
        }



    //商品详情
    //点击加入心愿和取消
    $(".a_desire").on("click",function(){
        $(this).toggleClass("a_desired")
    });
    //商品详情结束


    // 购物车
    // 总价=价格x数量
    $(".pro-qtyy").on("click",function(){
        var price=$(this).parent().parent().siblings().eq(2).children().text();
        var count=$(this).find("input").val();
        var sum=price*count;
        $(this).parent().parent().siblings().eq(3).children().text(sum.toFixed(2));
       
        }
    );
    // 购物车结束

    // 我的账户
    

    // 点击展开当前的同时隐藏其他
    $('.hero__categories__all').on('click', function(){
        $(this).parent().siblings().find('ul').hide(400);
        $(this).parent().find('ul').slideToggle(400);
    });
    // 我的账户结束 
    
    // 订单详情
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

        //进度条
        $.processBar=function(orderStatus,bf){
         var f='../other/img/orderdetails/orderinfo_img';
         var img='';
         if (bf=='f'){
              img='_3.png';
         }
         if (bf=='b'){
              img='_2.png';
         }
            switch(orderStatus){
                case '0':
                    $('.process-wrap1').find('.img_orderinfo').eq(0).attr('src',f+'1'+img);
                    break;
                case '1':
                    $('.process-wrap1').find('.img_orderinfo').eq(0).attr('src',f+'1'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(1).attr('src',f+'2'+img);
                    $('.process-wrap1').find('.active').eq(0).addClass('actived');
                    break;
                case '2':
                    $('.process-wrap1').find('.img_orderinfo').eq(0).attr('src',f+'1'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(1).attr('src',f+'2'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(2).attr('src',f+'3'+img);
                    $('.process-wrap1').find('.active').eq(0).addClass('actived');
                    $('.process-wrap1').find('.active').eq(1).addClass('actived');
                    break;
                case '3':
                    $('.process-wrap1').find('.img_orderinfo').eq(0).attr('src',f+'1'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(1).attr('src',f+'2'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(2).attr('src',f+'3'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(3).attr('src',f+'4'+img);
                    $('.process-wrap1').find('.active').eq(0).addClass('actived');
                    $('.process-wrap1').find('.active').eq(1).addClass('actived');
                    $('.process-wrap1').find('.active').eq(2).addClass('actived');
                    break;
                case '4':
                    $('.process-wrap1').find('.img_orderinfo').eq(0).attr('src',f+'1'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(1).attr('src',f+'2'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(2).attr('src',f+'3'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(3).attr('src',f+'4'+img);
                    $('.process-wrap1').find('.img_orderinfo').eq(4).attr('src',f+'5'+img);
                    $('.process-wrap1').find('.active').eq(0).addClass('actived');
                    $('.process-wrap1').find('.active').eq(1).addClass('actived');
                    $('.process-wrap1').find('.active').eq(2).addClass('actived');
                    $('.process-wrap1').find('.active').eq(3).addClass('actived');
                    break;
            }
        }
        // 订单详情结束


        //我的订单
        // 当鼠标移动到订单上时，显示删除
        $(".shoping__cart__table2").on("mouseover",function(){
            $(this).find(".del_order").show();
        })
        //当鼠标离开订单时，隐藏删除
        $(".shoping__cart__table2").on("mouseout",function(){
            $(this).find(".del_order").hide();
        })
        //我的订单结束



    }
);