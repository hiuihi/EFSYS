package cn.fungus.controller;

import cn.fungus.bean.ResponseResult;
import cn.fungus.config.AlipayConfig;
import cn.fungus.domain.*;
import cn.fungus.service.AddressService;
import cn.fungus.service.CartService;
import cn.fungus.service.OrderService;
import cn.fungus.utils.RandomNumberGenerator;
import cn.fungus.utils.Result;
import cn.fungus.vo.OGoodsReimburserVo;
import cn.fungus.vo.OrderGoodsVo;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderConttroller extends BaseController{

    @Autowired
    private AddressService addressService;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    //显示订单结算页
    @RequestMapping("/showOrderConfirmation.do")
    public String showOrderConfirmation(ModelMap modelMap, HttpSession session, HttpServletRequest request){
        String ids=request.getParameter("ids");
        String[] split;
        List<Cart> cartList=new ArrayList<>();
        if (ids!=null){
            session.setAttribute("ids",ids);
            split =ids.split(",");
        }else {
            String idss=(String) session.getAttribute("ids");
//            System.out.println("id:"+idss);
            split =idss.split(",");
        }
        for(String id:split){
            Cart cart=cartService.selectCartById(Long.parseLong(id));
            cartList.add(cart);
        }
        List<Address> addressList=addressService.getAddressByUid(this.getId(session));

        //System.out.println("cartList:"+cartList);
        modelMap.addAttribute("addressList",addressList);
        modelMap.addAttribute("cartList",cartList);
        return "front/orderConfirmation";
    }

    //显示支付
    @RequestMapping("/showPay.do")
    public String showPay(String orderSn,String totalPrice,HttpServletRequest request){
        request.setAttribute("orderSn",orderSn);
        request.setAttribute("totalPrice",totalPrice);
        return "front/pay";
    }

    //显示支付成功
    @RequestMapping("/showPaySuccess.do")
    public String showPaySuccess(){
        return "front/paySuccess";
    }

    //显示支付失败
    @RequestMapping("/showPayFail.do")
    public String showPayFail(){
        return "front/payFail";
    }
    //显示退款
    @RequestMapping("/showReimburse.do")
    public String showReimburse(String orderSn,HttpServletRequest request){
        System.out.println("o:"+orderSn);
        Order order=orderService.selectOrderByUidSn(orderSn);
        List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(orderSn);
        OrderGoodsVo orderGoodsVo=new OrderGoodsVo(order,orderGoods);
        Reimburse reimburse =orderService.selectReimburseByOrderSn(orderSn);
        System.out.println("re:"+reimburse);
        if (reimburse!=null){
            if (!this.isNull(reimburse.getDelivery())){
                List<String> deliveryList=this.getDelivery(reimburse.getDeliveryCompany(),reimburse.getDelivery());
                Collections.reverse(deliveryList);
                request.setAttribute("deliveryList",deliveryList);
            }
        }
        request.setAttribute("orderGoodsVo",orderGoodsVo);
        request.setAttribute("reimburse",reimburse);
        return "front/reimburse";
    }
    //显示订单详情
    @RequestMapping("/showOrderDetails.do")
    public String showOrderDetails(HttpServletRequest request){
       String orderSn= request.getParameter("orderSn");
       Order order=orderService.selectOrderByUidSn(orderSn);
       List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(orderSn);
       OrderGoodsVo orderGoodsVo=new OrderGoodsVo(order,orderGoods);

       if (!this.isNull(order.getDeliverySn())){
           List<String> deliveryList=this.getDelivery(order.getDeliveryCompany(),order.getDeliverySn());
           Collections.reverse(deliveryList);
           request.setAttribute("deliveryList",deliveryList);
       }
       request.setAttribute("orderGoodsVo",orderGoodsVo);
        return "front/orderDetails";
    }
    // 根据订单号查询订单
    @RequestMapping("/selectOrder")
    @ResponseBody
    public ResponseResult<OrderGoodsVo> selectOrder(String orderSn){
        ResponseResult<OrderGoodsVo> rr=new ResponseResult<OrderGoodsVo>();
        Order order=orderService.selectOrderByUidSn(orderSn);
        List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(orderSn);
        OrderGoodsVo orderGoodsVo=new OrderGoodsVo(order,orderGoods);
        rr.setData(orderGoodsVo);
        rr.setState(1);
        rr.setMessage("查询成功!");
        return rr;
    }
    // 删除订单
    @RequestMapping("/delOrder")
    @ResponseBody
    public ResponseResult<Void> delOrder(String orderSn){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        System.out.println("od:"+orderSn);
        orderService.delOrderByUidSn(orderSn);
        rr.setState(1);
        rr.setMessage("删除成功！");
        return rr;
    }
    // 取消订单
    @RequestMapping("/cancelOrder")
    @ResponseBody
    public ResponseResult<Void> cancelOrder(String orderSn, HttpServletRequest request, HttpServletResponse response) throws IOException, AlipayApiException {
        ResponseResult<Void> rr=new ResponseResult<Void>();
        System.out.println("orL:"+orderSn);
        orderService.updOrderStatusByOrderSn(5,orderSn);
        rr.setState(1);
        rr.setMessage("取消成功！");
        return rr;
    }
    // 确认收货
    @RequestMapping("/confirmReceipt")
    @ResponseBody
    public ResponseResult<Void> confirmReceipt(String orderSn, HttpServletRequest request, HttpServletResponse response) throws IOException, AlipayApiException {
        ResponseResult<Void> rr=new ResponseResult<Void>();
        orderService.updOrderStatusByOrderSn(3,orderSn);
        rr.setState(1);
        rr.setMessage("确认收货成功！");
        return rr;
    }
    //退款
    @RequestMapping("/reimburse")
    @ResponseBody
    public ResponseResult<String> reimburse(String orderSn,String ids,Double money,String comment_image,Integer his_received_goods,String his_retutn_goods,Integer h_select_goods,String reimburse_reason,String reimburse_text) throws IOException, AlipayApiException {
        ResponseResult<String> rr=new ResponseResult<String>();
//        System.out.println("or:"+orderSn+" :ids:"+ids+" :money:"+money+" :comment_image:"+comment_image+" :his_received_goods:"+his_received_goods+" :his_retutn_goods:"+his_retutn_goods+" :h_select_goods:"+h_select_goods+" :reimburse_reason:"+reimburse_reason+" :reimburse_text:"+reimburse_text);
        Order o=orderService.selectOrderByUidSn(orderSn);
        System.out.println("O:"+o);
        Integer orderStatus=o.getOrderStatus();
        System.out.println("os:"+orderStatus);
        Reimburse reimburse;
        if (!"1".equals(his_retutn_goods)){
            his_retutn_goods="0";
        }
        if(comment_image!="0"){
            reimburse=new Reimburse(orderSn,ids,his_received_goods,Integer.parseInt(his_retutn_goods),h_select_goods,money,reimburse_reason,reimburse_text,comment_image,0,orderStatus);
        }else{
            reimburse=new Reimburse(orderSn,ids,his_received_goods,Integer.parseInt(his_retutn_goods),h_select_goods,money,reimburse_reason,reimburse_text,0,orderStatus);
        }
//        System.out.println("re:"+reimburse);
        orderService.updOrderStatusByOrderSn(6,orderSn);
        orderService.insertReimburse(reimburse);
        rr.setState(1);
        rr.setData(orderSn);
        rr.setMessage("提交成功！");
        return rr;
    }
    //查询退款
    @RequestMapping("/selreimburse")
    @ResponseBody
    public ResponseResult<OGoodsReimburserVo> selreimburse(String orderSn) {
        ResponseResult<OGoodsReimburserVo> rr=new ResponseResult<OGoodsReimburserVo>();
//        System.out.println("o:"+orderSn);

        Reimburse reimburse;
        reimburse=orderService.selectReimburseByOrderSn(orderSn);
        List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(orderSn);
        OGoodsReimburserVo oGoodsReimburserVo=new OGoodsReimburserVo(reimburse,orderGoods);
        System.out.println("o:"+oGoodsReimburserVo);
        rr.setData(oGoodsReimburserVo);
        rr.setState(1);
        rr.setMessage("查询成功！");
        return rr;
    }
    //取消退款请求
    @RequestMapping("/cancelRefund")
    @ResponseBody
    public ResponseResult<OGoodsReimburserVo> cancelRefund(String orderSn) {
        ResponseResult<OGoodsReimburserVo> rr=new ResponseResult<OGoodsReimburserVo>();
        Reimburse reimburse =orderService.selectReimburseByOrderSn(orderSn);
        orderService.updOrderStatusByOrderSn(reimburse.getOrderStatus(),orderSn);
        orderService.delRByOrderSn(orderSn);
        rr.setState(1);
        rr.setMessage("取消成功！");
        return rr;
    }
    //用户上传快递单号
    @RequestMapping("/updReimburseDelivery")
    @ResponseBody
    public ResponseResult<String> updReimburseDelivery(String orderSn,String delivery,String deliverycompany) {
        ResponseResult<String> rr=new ResponseResult<String>();
        Reimburse reimburse=new Reimburse();
//        System.out.println("od:"+orderSn+"   :d:"+delivery);
        reimburse.setOrderSn(orderSn);
        reimburse.setDelivery(delivery);
        reimburse.setDeliveryCompany(deliverycompany);
        orderService.updRDeliveryByOrderSn(reimburse);
        rr.setData(orderSn);
        rr.setState(1);
        rr.setMessage("查询成功！");
        return rr;
    }
    // 取消订单
    @RequestMapping("/showOrder.do")
    public String showOrder(String orderSn, HttpServletRequest request, HttpServletResponse response) throws IOException, AlipayApiException {
        String sn=request.getParameter("orderSn");
        System.out.println(
                "orderSn:"+ orderSn+"    Sn:"+ sn
        );


        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();
        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = sn;
        //支付宝交易号
//        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //请二选一设置
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"}");
        //请求
        String result = alipayClient.execute(alipayRequest).getBody();


        return result;
    }

    // 退款
    @RequestMapping("/refund")
    public String refund(String orderSn,String tradeNo,String price, HttpServletRequest request, HttpServletResponse response) throws IOException, AlipayApiException {
        //String sn=request.getParameter("orderSn");
        System.out.println(
                "orderSn:"+ orderSn+"    tradeNo:"+ tradeNo+"    price:"+ price
        );

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();

        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = orderSn;
        //支付宝交易号
        String trade_no = tradeNo;
        //请二选一设置
        //需要退款的金额，该金额不能大于订单金额，必填
        String refund_amount = price;
        //退款的原因说明
        String refund_reason = "不想要";
        //标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
        String out_request_no = orderSn;

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"trade_no\":\""+ trade_no +"\","
                + "\"refund_amount\":\""+ refund_amount +"\","
                + "\"refund_reason\":\""+ refund_reason +"\","
                + "\"out_request_no\":\""+ out_request_no +"\"}");

        //请求
        String result = alipayClient.execute(alipayRequest).getBody();
        System.out.println("re:"+result);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(result);//直接将完整的表单html输出到页面
        response.getWriter().close();
        return result;
    }
    //上传图片
    @RequestMapping("/updPice")
    @ResponseBody
    public Result updPice(@RequestParam(value="file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request, String goodsId){
//        String folder=IdUtil.simpleUUID();
//        String folder="1";
        String  uploadAbsolutePath = request.getSession().getServletContext().getRealPath("/other/img/reimburse/")+this.getId(session);
        File file = new File(uploadAbsolutePath);
        //System.out.println("user:"+userid);
        if (!file.exists() && !file.mkdirs()) {
            // 如果file对象不存在，那么就将该对象的路径名中不存在的文件夹目录建立出来
            return Result.newFailureResult("文件上传路径不存在");
        }
        //原文件名
        String names = multipartFile.getOriginalFilename();
        System.out.println("name:"+names);
        // 文件扩展名
        String fileExt = names.substring(names.lastIndexOf(".") + 1).toLowerCase();
        // 文件上传后的新名
        String newName = RandomNumberGenerator.generateNumber()+ "." + fileExt;
        String icon="/other/img/reimburse/"+this.getId(session)+ "/" +newName;
        //文件的绝对路径File
        File uploadFile = new File(uploadAbsolutePath + "/" + newName);
        try {
            // 将上传的图片二进制流保存为文件
            FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadFile));
        } catch (IOException ioException) {
            System.out.println("图片保存到文件夹中出错！");
            Result.newFailureResult("文件上传失败");
        } catch (Exception e) {
            System.out.println("文件没有复制到指定的目录下");
        }
//        Map<String, Object> result = new HashMap<>(3);
//        result.put("oldName", names);
//        result.put("newName", newName);
        //如果不使用封装返回方式，也可以直接返回map对象，可根据自己喜好和业务做修改
//        return Result.newResult(0,"上传文件成功",icon);
        return Result.newResult(0,"",icon);
    }

}