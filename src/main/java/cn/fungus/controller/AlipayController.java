package cn.fungus.controller;

import cn.fungus.config.AlipayConfig;
import cn.fungus.domain.Cart;
import cn.fungus.domain.Goods;
import cn.fungus.domain.Order;
import cn.fungus.domain.OrderGoods;
import cn.fungus.service.CartService;
import cn.fungus.service.GoodsService;
import cn.fungus.service.OrderService;
import cn.fungus.utils.RandomNumberGenerator;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * @author MAC
 */
@Controller
@RequestMapping("/alipay")
public class AlipayController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private CartService cartService;
    /**
     *
     * @Title: AlipayController.java
     * @Package com.sihai.controller
     * @Description: 前往支付宝第三方网关进行支付
     * Copyright:
     * Company:FURUIBOKE.SCIENCE.AND.TECHNOLOGY
     *
     * @author sihai
     * @date
     * @version V1.0
     */
    @RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String goAlipay(
//            String totalPrice, Long addressId,
            HttpSession session, HttpServletResponse response,HttpServletRequest request) throws Exception {
        Double totalPrice=Double.parseDouble(request.getParameter("totalPrice"));
        Long addressId=Long.parseLong(request.getParameter("addressId")) ;
//        购物车id
        String ids=(String)session.getAttribute("ids");
        String[] id = ids.split(",");
        String goodsIds="";
        for(String i : id){
            Cart cart=cartService.selectCartById(Long.parseLong(i));
            Integer goodsid=cart.getGoodsId();
            Goods goods=goodsService.selectGoodsByGid(goodsid,1);
            goodsIds+=goods.getGoodsId()+",";
        }
        goodsIds=goodsIds.substring(0,goodsIds.length()-1);
        String orderSn= RandomNumberGenerator.generateNumber();
        orderService.createOrder(addressId,totalPrice,goodsIds,ids,orderSn);
        Order order=orderService.selectOrderByUidSn(orderSn);
        List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(orderSn);
        String goosdName = "";
        for (OrderGoods orderGood:orderGoods){
            goosdName+=orderGood.getGoodsName()+" ";
        }
        //System.out.println("goo:"+goosdName+order+orderGoods);
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = orderSn;
        //付款金额，必填
        String total_amount = totalPrice.toString();
        //订单名称，必填
        String subject = goosdName;
        //商品描述，可空
        String body = "商品个数：" + id.length;

        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "1c";

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\""+ timeout_express +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
//        String result = alipayClient.pageExecute(alipayRequest).getBody();
        String form="";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(form);//直接将完整的表单html输出到页面
        response.getWriter().close();
        return form;
       
    }

    @RequestMapping(value = "/continueToPay", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String continueToPay(
//            String totalPrice, Long addressId,
            HttpSession session, HttpServletResponse response,HttpServletRequest request) throws Exception {
//        System.out.println("to:"+totalPrice+"  id:"+addressId);

        Double totalPrice=Double.parseDouble(request.getParameter("totalPrice"));
        String orderSn=request.getParameter("orderSn");
//        Long addressId=Long.parseLong(request.getParameter("addressId")) ;
//        //System.out.println("ss:"+totalPrice+"  :"+addressId);
//        String ids=(String)session.getAttribute("ids");
//        String[] id = ids.split(",");
//        String orderSn= RandomNumberGenerator.generateNumber();
//        orderService.createOrder(addressId,totalPrice,ids,orderSn);
        Order order=orderService.selectOrderByUidSn(orderSn);
        List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(orderSn);
        String goosdName = "";
        for (OrderGoods orderGood:orderGoods){
            goosdName+=orderGood.getGoodsName()+" ";
        }
        //System.out.println("goo:"+goosdName+order+orderGoods);
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = orderSn;
        //付款金额，必填
        String total_amount = totalPrice.toString();
        //订单名称，必填
        String subject = goosdName;
        //商品描述，可空
//        String body = "商品个数：" + id.length;
        String body = "" ;

        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "1c";

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\""+ timeout_express +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
//        String result = alipayClient.pageExecute(alipayRequest).getBody();
        String form="";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(form);//直接将完整的表单html输出到页面
        response.getWriter().close();
        return form;

    }

    //
    @RequestMapping("/aliNotify")
    public void aliNotify(HttpServletResponse response,HttpServletRequest request) throws AlipayApiException, IOException {
        //获取支付宝POST过来反馈信息
        //System.out.println("aliNotify");
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——

	/* 实际验证过程建议商户务必添加以下校验：
	1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
	2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
	3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
	4、验证app_id是否为该商户本身。
	*/
        if(signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

            if(trade_status.equals("TRADE_FINISHED")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
            }else if (trade_status.equals("TRADE_SUCCESS")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
            }

            response.getWriter().write("success");

        }else {//验证失败
            response.getWriter().write("fail");

            //调试用，写文本函数记录程序运行情况是否正常
            //String sWord = AlipaySignature.getSignCheckContentV1(params);
            //AlipayConfig.logResult(sWord);
        }
    }

    //
    @RequestMapping("/aliReturn")
    public String aliReturn(ModelMap modelMap,HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, IOException {
        //获取支付宝GET过来反馈信息
        //System.out.println("aliReturn");

        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
            //System.out.println("trade_no:"+trade_no+"    <br/>out_trade_no:"+out_trade_no+"     <br/>total_amount:"+total_amount);
            Order order = new Order();
            order.setOrderSn(out_trade_no);
            order.setOrderStatus(1);
            order.setTradeNo(trade_no);
            order.setPaymentTime(new Date());
            //System.out.println("od:"+order);
            orderService.updOrderStatusByUidSn(order);
            modelMap.addAttribute("orderSn",out_trade_no);
            return  "front/paySuccess";

//            response.getWriter().write("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
        }else {
            response.getWriter().write("验签失败");
            return "front/payFail";
        }
    }


    //显示修改密码
    @RequestMapping("/3")
    public String showChangePassword(){
        return "WebContent/alipay.trade.page.pay";
    }
    //显示修改密码
    @RequestMapping("/2")
    public String showChangd(){
        return "WebContent/alipay.trade.close";
    }

    //显示修改密码
    @RequestMapping("/1")
    public String shgd(){
        return "WebContent/alipay.trade.fastpay.refund.query";
    }

    //显示修改密码
    @RequestMapping("/4")
    public String showChange4(){
        return "WebContent/alipay.trade.query";
    }
    //显示修改密码
    @RequestMapping("/5")
    public String showCh4(){
        return "WebContent/alipay.trade.refund";
    }
    //显示我的收藏
    @RequestMapping("/index")
    public String showCollect(){
        return "WebContent/index";
    }
    //显示修改密码
    @RequestMapping("/6")
    public String showChangy(){
        return "WebContent/notify_url";
    }
    //显示修改密码
    @RequestMapping("/7")
    public String showChan5(){
        return "WebContent/return_url";
    }




}
