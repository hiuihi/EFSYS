package cn.fungus.controller;

import cn.fungus.bean.ResponseResult;
import cn.fungus.domain.*;
import cn.fungus.service.CommentService;
import cn.fungus.service.OrderService;
import cn.fungus.service.UserService;
import cn.fungus.utils.RandomNumberGenerator;
import cn.fungus.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController{

    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    //显示评价
    @RequestMapping("showComment.do")
    public String showOrder(ModelMap modelMap, HttpSession session, HttpServletRequest request){
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
        String orderStatus=request.getParameter("orderStatus");
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
        if (orderStatus==null || "".equals(orderStatus)){
            orderStatus="%"+""+"%";
        }else{
            status=orderStatus;
            orderStatus="%"+orderStatus+"%";
        }
//        if (condition==null || "".equals(condition)){
//            condition="0";
//        }
        //总记录数
//        Long totalCount=orderService.selectCount(orderStatus);
//        //总页数
//        Long row=Long.parseLong(rows);
//        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;
////        int totalPage=(totalCount % rows)==0?totalCount/rows:(totalCount/rows)+1;
//
//        List<Order> orders = orderService.selectAllOrder(orderStatus,Integer.parseInt(start),Integer.parseInt(rows));
//        List<OrderGoodsVo> orderGoodsVos=new ArrayList<>();
//        for (Order order : orders){
//            List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(order.getOrderSn());
//            OrderGoodsVo vo=new OrderGoodsVo(order,orderGoods);
//            orderGoodsVos.add(vo);
//        }
//        List<Long> result = new ArrayList<Long>();
//        for (int i = 0; i <7;i++){
//            String a ="%"+i+"%";
//            result.add(orderService.selectCount(a));
//        }
//        System.out.println("s:"+start+""+"   or:"+orderGoodsVos);
//        PageBean pageBean=new PageBean(totalCount,totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows));
//        request.setAttribute("orderGoodsVos",orderGoodsVos);
//        request.setAttribute("totalPage",totalPage);
//        request.setAttribute("pageBean",pageBean);
//        request.setAttribute("status",status);
//        request.setAttribute("result",result);

//        request.setAttribute("condition",condition);
        return "back/order";
    }
    //插入评价
    @RequestMapping("/insertComment")
    @ResponseBody
    public ResponseResult<Void> insertGoods(String content,String comment_image,String h_cb,String h_start,String comment_userId,String comment_orderSn,String comment_goodsId,String comment_goodsSpec) throws ParseException {
        ResponseResult<Void> rr=new ResponseResult<Void>();
        List<Comment> comments=new ArrayList<Comment>();
        String[] contents = content.split(",");
        String[] pics = comment_image.split(",");
        String[] isAnonymous = h_cb.split(",");
        String[] ratings = h_start.split(",");
        String[] userIds = comment_userId.split(",");
        String[] orderSns = comment_orderSn.split(",");
        String[] goodsIds = comment_goodsId.split(",");
        String[] goodsSpecs = comment_goodsSpec.split(",");
        String userIcon="";
        Comment comment;
        int len=ratings.length;
        for (int i=0;i<len;i++) {
            if (" ".equals(contents[i])) {
                contents[i]="此用户没有填写评价。";
            }
            if ("1".equals(isAnonymous[i])) {
                userIcon="/other/img/defaultavatar/anonymous.jpeg";
            }else{
                User user =userService.selectUserByUid(Long.parseLong(userIds[i]));
                userIcon=user.getIcon();
            }
            if ("0".equals(pics[i])) {
                comment=new Comment(Long.parseLong(userIds[i]),orderSns[i],Long.parseLong(goodsIds[i]),goodsSpecs[i],userIcon,contents[i],Integer.parseInt(ratings[i]),1,Integer.parseInt(isAnonymous[i]),new Date());
            }else{
                String pic=pics[i].replace(":", ",");
                comment=new Comment(Long.parseLong(userIds[i]),orderSns[i],Long.parseLong(goodsIds[i]),goodsSpecs[i],userIcon,contents[i],pic,Integer.parseInt(ratings[i]),1,Integer.parseInt(isAnonymous[i]),new Date());
            }
            commentService.insertComment(comment);

        }
        orderService.updOrderStatusByOrderSn(4,orderSns[0]);

        rr.setState(1);
        rr.setMessage("评价成功");
        return rr;
    }

    //上传图片
    @RequestMapping("/updIcon")
    @ResponseBody
    public Result updIcon(@RequestParam(value="file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request,String goodsId,String userId,String spec){
//        String folder=IdUtil.simpleUUID();
//        String folder="1";
        String  uploadAbsolutePath = request.getSession().getServletContext().getRealPath("/other/img/comment/")+goodsId+"/"+userId;
        File file = new File(uploadAbsolutePath);
        //System.out.println("user:"+userid);
        if (!file.exists() && !file.mkdirs()) {
            // 如果file对象不存在，那么就将该对象的路径名中不存在的文件夹目录建立出来
            return Result.newFailureResult("文件上传路径不存在");
        }
        //原文件名
        String names = multipartFile.getOriginalFilename();
        //System.out.println("name:"+names);
        // 文件扩展名
        String fileExt = names.substring(names.lastIndexOf(".") + 1).toLowerCase();
        // 文件上传后的新名
        String newName = RandomNumberGenerator.generateNumber()+ "." + fileExt;
        String icon="/other/img/comment/"+goodsId+"/"+userId+ "/" +newName;
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
        //System.out.println("f:"+uploadAbsolutePath);
       // System.out.println("ic:"+icon);
//        Map<String, Object> result = new HashMap<>(3);
//        result.put("oldName", names);
//        result.put("newName", newName);
        //如果不使用封装返回方式，也可以直接返回map对象，可根据自己喜好和业务做修改
//        return Result.newResult(0,"上传文件成功",icon);
        return Result.newResult(0,goodsId+spec,icon);
    }



}
