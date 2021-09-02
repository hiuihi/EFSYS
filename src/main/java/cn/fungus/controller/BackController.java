package cn.fungus.controller;

import cn.fungus.bean.PageBean;
import cn.fungus.bean.ParseData;
import cn.fungus.bean.ResponseResult;
import cn.fungus.domain.Admin;
import cn.fungus.domain.Goods;
import cn.fungus.domain.OrderGoods;
import cn.fungus.domain.User;
import cn.fungus.service.AdminService;
import cn.fungus.service.GoodsService;
import cn.fungus.service.OrderService;
import cn.fungus.service.UserService;
import cn.fungus.utils.Result;
import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONObject;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.util.Comparator.comparing;

/**
 * @author MAC
 */
@Controller
@RequestMapping("/back")
public class BackController extends BaseController{

    @Autowired
    private OrderService orderService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private AdminService adminService;

    //显示登录界面
    @RequestMapping("/showLogin.action")
    public String showLogin(){
        return "back/login";
    }

    //显示主页
    @RequestMapping("showIndex.action")
    public String showIndex(ModelMap modelMap, HttpSession session){
        return "back/index";
    }
    //显示主页1
    @RequestMapping("showIndex1.action")
    public String showIndex1(ModelMap modelMap, HttpSession session){
        return "back/index1";
    }
    //显示销售统计
    @RequestMapping("showSalesStatistics.action")
    public String showSalesStatistics(ModelMap modelMap, HttpSession session,HttpServletRequest request) throws ParseException {
        List<OrderGoods> orderGoodsList=orderService.selectAllOrderGoods();
        List<OrderGoods> orderGoodss=new ArrayList<OrderGoods>();
        int len=orderGoodsList.size();
        orderGoodss.add(orderGoodsList.get(0));
        for(OrderGoods orderGood:orderGoodsList){
            boolean a=false;
            OrderGoods og=orderGood;
                for (OrderGoods orderGoods:orderGoodss){
                    if (!orderGood.getGoodsId().equals(orderGoods.getGoodsId())){
                        a=true;
                    }else{
                        a=false;
                        break;
                    }
                }
            if(a){
                orderGoodss.add(og);
            }
        }
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
        String days=request.getParameter("days");
        System.out.println("d:"+days);
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");

        if(start==null || "".equals(start)){
            start="0";
        }
        if(rows==null || "".equals(rows)){
            rows="6";
        }
        if (currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }else{
            start=""+Integer.parseInt(rows)*(Integer.parseInt(currentPage)-1);
        }
        String day1="";
        String day2="";
        List<Goods> goodsList=new ArrayList<Goods>();
        List<Goods> goodssList=new ArrayList<Goods>();
        for (OrderGoods orderGood:orderGoodss){
            Date date=orderGood.getUpdTime();
            String day = sdf.format(date);
            if (!isNull(days)){
                String[] split = days.split("-");
                day1=split[0]+"-"+split[1]+"-"+split[2].replace(" ","");
                day2=split[3].replace(" ","")+"-"+split[4]+"-"+split[5];
                if ((day.compareTo(day1)>0 || day.compareTo(day1)==0) && (day.compareTo(day2)<0|| day.compareTo(day2)==0)){
                    Goods goods=goodsService.selectGoodsByGid(orderGood.getGoodsId().intValue(),1);
                    goodsList.add(goods);
                }
            }else{
                Goods goods=goodsService.selectGoodsByGid(orderGood.getGoodsId().intValue(),1);
                goodsList.add(goods);
            }
        }
        goodsList.sort(comparing(Goods::getSale).reversed());
        //总记录数
        Integer totalCount=goodsList.size();
        //总页数
        Long row=Long.parseLong(rows);
        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;

        int si=Integer.parseInt(start)+Integer.parseInt(rows);
        if (si>totalCount){
            si=totalCount;
        }
        for (int i=Integer.parseInt(start);i<si;i++){
            goodssList.add(goodsList.get(i));
        }

        PageBean pageBean=new PageBean(totalCount.longValue(),totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows));
        request.setAttribute("day1",day1);
        request.setAttribute("day2",day2);
        request.setAttribute("days",days);
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("goodsList",goodssList);
        return "back/salesStatistics";
    }
    //登录
    @RequestMapping("/login")
    @ResponseBody
    public ResponseResult<Void> login(String adminName, String password, HttpSession session)  {
        ResponseResult<Void> rr=new ResponseResult<Void>();
        System.out.println("n:"+adminName+"  :p:"+password);
        Admin admin=adminService.login(adminName,password);
        System.out.println("a:"+admin);
        if (admin==null){
            rr.setState(0);
            rr.setMessage("登录失败！");
        }else{
            session.setAttribute("admin",admin);
            rr.setState(1);
            rr.setMessage("登录成功！");
        }
        System.out.println("rr:"+rr.getState());
        return rr;
    }

    //更换头像
    @RequestMapping("/updIcon")
    @ResponseBody
    public Result updIcon(@RequestParam(value="file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request,String userid){
        String  uploadAbsolutePath = request.getSession().getServletContext().getRealPath("/other/img/icon/")+userid;
        File file = new File(uploadAbsolutePath);
        //System.out.println("user:"+userid);
        if (!file.exists() && !file.mkdirs()) {
            // 如果file对象不存在，那么就将该对象的路径名中不存在的文件夹目录建立出来
            return Result.newFailureResult("文件上传路径不存在");
        }
        //原文件名
        String names = multipartFile.getOriginalFilename();
        // 文件扩展名
        String fileExt = names.substring(names.lastIndexOf(".") + 1).toLowerCase();
        // 文件上传后的新名
        String newName = IdUtil.simpleUUID() + "." + fileExt;
        String icon="/other/img/icon/"+userid+ "/" +newName;
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
        return Result.newResult(0,"上传文件成功",icon);
    }



}
