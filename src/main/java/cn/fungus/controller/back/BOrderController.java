package cn.fungus.controller.back;

import cn.fungus.bean.PageBean;
import cn.fungus.bean.ParseData;
import cn.fungus.bean.ResponseResult;
import cn.fungus.config.AlipayConfig;
import cn.fungus.controller.BaseController;
import cn.fungus.domain.*;
import cn.fungus.service.AdminService;
import cn.fungus.service.OrderService;
import cn.fungus.utils.RandomNumberGenerator;
import cn.fungus.utils.Result;
import cn.fungus.vo.OrderGoodsVo;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeQueryRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;


/**
 * @author MAC
 */
@Controller
@RequestMapping("/border")
public class BOrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private AdminService adminService;
    //显示订单
    @RequestMapping("showOrder.action")
    public String showOrder(ModelMap modelMap, HttpSession session,HttpServletRequest request){
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
        String orderStatus=request.getParameter("orderStatus");
        String osn=request.getParameter("osn");
        String uid=request.getParameter("uid");
        String status="";
//        String condition=request.getParameter("condition");
        if(start==null || "".equals(start)){
            start="0";
        }
        if(rows==null || "".equals(rows)){
            rows="3";
        }
        if (currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }else{
            start=""+Integer.parseInt(rows)*(Integer.parseInt(currentPage)-1);
        }
        request.setAttribute("orderStatus",orderStatus);
        if (orderStatus==null || "".equals(orderStatus)){
            orderStatus="%"+""+"%";
        }else{
            status=orderStatus;
            orderStatus="%"+orderStatus+"%";
        }
        request.setAttribute("osn",osn);
        request.setAttribute("uid",uid);
        if (isNull(osn)){
            osn="%"+""+"%";
        }else{
            osn="%"+osn+"%";
        }
        if (isNull(uid)){
            uid="%"+""+"%";
        }else{
            uid="%"+uid+"%";
        }
//        if (condition==null || "".equals(condition)){
//            condition="0";
//        }
        //总记录数
        Long totalCount=orderService.selectCount(orderStatus,osn,uid);
        //总页数
        Long row=Long.parseLong(rows);
        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;
//        int totalPage=(totalCount % rows)==0?totalCount/rows:(totalCount/rows)+1;

        List<Order> orders = orderService.selectAllOrder(orderStatus,osn,uid,Integer.parseInt(start),Integer.parseInt(rows));
        List<OrderGoodsVo> orderGoodsVos=new ArrayList<>();
        for (Order order : orders){
            List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(order.getOrderSn());
            OrderGoodsVo vo=new OrderGoodsVo(order,orderGoods);
            orderGoodsVos.add(vo);
        }
        List<Long> result = new ArrayList<Long>();
        for (int i = 0; i <7;i++){
            String a ="%"+i+"%";
            result.add(orderService.selectCount(a,"%%","%%"));
        }
//        System.out.println("s:"+start+""+"   or:"+orderGoodsVos);
        PageBean pageBean=new PageBean(totalCount,totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows));
        request.setAttribute("orderGoodsVos",orderGoodsVos);
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("status",status);
        request.setAttribute("result",result);

//        request.setAttribute("condition",condition);
        return "back/order";
    }

    //显示订单详情
    @RequestMapping("/showOrderDetails.action")
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
        return "back/orderDetails";
    }

    //显示退款
    @RequestMapping("/showReimburse.action")
    public String showReimburse(String orderSn,HttpServletRequest request,HttpSession session){
        Order order=orderService.selectOrderByUidSn(orderSn);
        List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(orderSn);
        OrderGoodsVo orderGoodsVo=new OrderGoodsVo(order,orderGoods);
        Reimburse reimburse =orderService.selectReimburseByOrderSn(orderSn);
        Admin admin=(Admin) session.getAttribute("admin");
        if (reimburse!=null){
            if (!this.isNull(reimburse.getDelivery())){
                List<String> deliveryList=this.getDelivery(reimburse.getDeliveryCompany(),reimburse.getDelivery());
                Collections.reverse(deliveryList);
                request.setAttribute("deliveryList",deliveryList);
            }
        }

        request.setAttribute("orderGoodsVo",orderGoodsVo);
        request.setAttribute("reimburse",reimburse);
        request.setAttribute("admin",admin);
        return "back/reimburse";
    }
    //修改退款
    @RequestMapping("/updReimburse")
    @ResponseBody
    public ResponseResult<String> updReimburse(String orderSn, Integer sellerOpinion, String sellerCaption, String address, String isRetutnGoods) throws ParseException, AlipayApiException {
        ResponseResult<String> rr=new ResponseResult<String>();
        System.out.println("or:"+orderSn);
        Reimburse reimburse =new Reimburse();
        reimburse.setOrderSn(orderSn);
        //更新退款状态为商家处理
        reimburse.setDeliveryStatus(1);
        orderService.updRDeliveryStatusByOrderSn(reimburse);
        System.out.println("1");
        //如果卖家同意退款
        if (sellerOpinion==1){
            if ("不需要".equals(isRetutnGoods)){
                AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
                AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();
                //商户订单号，商户网站订单系统中唯一订单号
                String out_trade_no = orderSn;
                //支付宝交易号
//        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
                //请二选一设置
                alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"}");
                //请求
                alipayClient.execute(alipayRequest).getBody();
                //更新退款状态为退款成功
                reimburse.setDeliveryStatus(3);
                orderService.updRDeliveryStatusByOrderSn(reimburse);
                System.out.println("2");
            }else{

                reimburse.setAddress(address);
                reimburse.setDeliveryStatus(2);
                orderService.updRDeliveryStatusByOrderSn(reimburse);
                orderService.updRAddressByOrderSn(reimburse);
                System.out.println("3");
            }
        }else if (sellerOpinion==0){

            reimburse.setSellerCaption(sellerCaption);
            reimburse.setDeliveryStatus(1);
            //更新卖家说明
            orderService.updRSellerCaptionByOrderSn(reimburse);
            System.out.println("4");
        }
        System.out.println("5");
        reimburse.setSellerOpinion(sellerOpinion);
        orderService.updRSellerOpinionByOrderSn(reimburse);
        rr.setData(orderSn);
        rr.setState(1);
        return rr;
    }
    //卖家确认收货
    @RequestMapping("/confirmReceipt")
    @ResponseBody
    public ResponseResult<String> confirmReceipt(String orderSn) throws ParseException, AlipayApiException {
        ResponseResult<String> rr=new ResponseResult<String>();
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();
        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = orderSn;
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"}");
        //请求
        alipayClient.execute(alipayRequest).getBody();
        Reimburse reimburse =new Reimburse();
        reimburse.setOrderSn(orderSn);
        reimburse.setDeliveryStatus(3);
        orderService.updRDeliveryStatusByOrderSn(reimburse);
        rr.setData(orderSn);
        rr.setState(1);
        return rr;
    }
    //修改订单物流信息
    @RequestMapping("/updOrderDelivery")
    @ResponseBody
    public ResponseResult<String> updOrderDelivery(String orderSn, String deliveryCompany, String deliverySn) throws ParseException {
        ResponseResult<String> rr=new ResponseResult<String>();
        Order order=new Order();
        order.setOrderSn(orderSn);
        order.setDeliveryCompany(deliveryCompany);
        order.setDeliverySn(deliverySn);
        order.setDeliveryTime(new Date());
        orderService.updOrderDelivery(order);
        orderService.updOrderStatusByOrderSn(2,orderSn);
        rr.setState(0);
        return rr;
    }


    //修改账号状态
    @RequestMapping("/updStatus")
    @ResponseBody
    public ParseData<User> updUserStatus(Integer id, Integer status,String st)  {
        ParseData<User> pd=new ParseData<User>();
        //System.out.println("id:"+id+"   uss:"+userStatus);
//        userService.updUserStatusById(Integer.parseInt(userStatus),Integer.parseInt(id));
        Goods goods=new Goods();
        goods.setId(id);
        switch(st){
            case "P":
                goods.setPublishStatus(status);
//                goodsService.updPubStatusById(goods);
                break;
            case "N":
                goods.setNewStatus(status);
//                goodsService.updNewStatusById(goods);
                break;
            case "R":
                goods.setRecommandStatus(status);
//                goodsService.updRecStatusById(goods);
                break;
            case "D":
                goods.setDiscountStatus(status);
//                goodsService.updDisStatusById(goods);
                break;
            default:
                pd.setCode(1);
                break;

        }
        pd.setCode(0);
        return pd;
    }
    //更换图片
    @RequestMapping("/updIcon")
    @ResponseBody
    public Result updIcon(@RequestParam(value="file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request,String goodsId,String folder){
//        String folder=IdUtil.simpleUUID();
//        String folder="1";
        String  uploadAbsolutePath = request.getSession().getServletContext().getRealPath("/other/img/product/")+goodsId+"/"+folder;
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
        String icon="/other/img/product/"+goodsId+"/"+folder+ "/" +newName;
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

//    public List<Long> getStatus(){
//        List<Long> result = new ArrayList<Long>();
//        for (int i = 0; i <7;i++){
//            String status ="%"+i+"%";
//            result.add(orderService.selectCount(status));
//        }
//        return result;
//    }

}
