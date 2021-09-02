package cn.fungus.controller;

import cn.fungus.bean.PageBean;
import cn.fungus.bean.ResponseResult;
import cn.fungus.domain.*;
import cn.fungus.service.*;
import cn.fungus.vo.OrderGoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountConttroller extends BaseController{

    @Autowired
    private AddressService addressService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CollectService collectService;

    @Autowired
    private GoodsService goodsService ;

    @Autowired
    private UserService userService ;

    //显示我的账号
    @RequestMapping("/showAccount.do")
    public String showAccount(HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User user=userService.selectUserByUid(this.getId(session));
        request.setAttribute("user",user);
        return "front/account";
    }

    //显示我的订单
    @RequestMapping("/showOrders.do")
    public String showOrders(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ParseException {
//        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" );
//        Date date = sdf.parse(sdf.format(new Date()));
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
        String orderStatus=request.getParameter("orderStatus");
        String condition=request.getParameter("condition");
        //搜索输入的词
        String term=request.getParameter("term");
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
            orderStatus="%"+orderStatus+"%";
        }
        if (condition==null || "".equals(condition)){
            condition="0";
        }
        if (term==null){
            term="";
        }
        request.setAttribute("term",term);
        if (isNull(term)){
            term="%"+""+"%";
        }else{
            term="%"+term+"%";
        }
        //总记录数
        Long totalCount=orderService.selectCountByUid(this.getId(session),orderStatus);
        //总页数
        Long row=Long.parseLong(rows);
        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;
//        int totalPage=(totalCount % rows)==0?totalCount/rows:(totalCount/rows)+1;
        System.out.println("te:"+term);
       List<Order> orders = orderService.selectOrderByUid(this.getId(session),orderStatus,"%%",Integer.parseInt(start),Integer.parseInt(rows));
        System.out.println("or:"+orders);
       List<OrderGoodsVo> orderGoodsVos=new ArrayList<>();
       for (Order order : orders){
           List<OrderGoods> og=orderService.getOrderGoodsByOrderSnAndTerm(order.getOrderSn(),term);
           System.out.println("og:"+og);
           if (og.size()!=0){
               List<OrderGoods> orderGoods=orderService.selectOrderGoodsByOrderSn(order.getOrderSn());
               OrderGoodsVo vo=new OrderGoodsVo(order,orderGoods);
               orderGoodsVos.add(vo);
           }
       }
//        System.out.println("s:"+start+""+"   or:"+orderGoodsVos);
        PageBean pageBean=new PageBean(totalCount,totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows));
//        System.out.println("or:"+orderGoodsVos);
        System.out.println("orderGoodsVos:"+orderGoodsVos);
        request.setAttribute("orderGoodsVos",orderGoodsVos);
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("pageBean",pageBean);

        request.setAttribute("condition",condition);
        return "front/orders";
    }
    //添加到我的收藏
    @RequestMapping("/addCollect")
    @ResponseBody
    public ResponseResult<Void> addCollect(HttpSession session,Integer goodsId,HttpServletRequest request,HttpServletResponse response){
        ResponseResult<Void> rr=new ResponseResult<Void>();
       boolean is_equals=false;
        List<Collect> collects= collectService.selectCollectByUid(this.getId(session));
        for (Collect collect:collects){
            if (collect.getGoodsId().equals(goodsId.longValue())) {
                is_equals=true;
            }
        }
        if (is_equals==true){
            rr.setState(0);
            rr.setMessage("添加失败！");
            return rr;
        }else{
            Goods goods=goodsService.selectGoodsByGid(goodsId,0);
            Collect collect=new Collect(this.getId(session),goods);
            collectService.insertCollect(collect);
            rr.setState(1);
            rr.setMessage("添加成功！");
            return rr;
        }

    }
    //显示我的收藏
    @RequestMapping("/showCollect.do")
    public String showCollect(HttpSession session,String id,HttpServletRequest request,HttpServletResponse response){
        List<Collect> collects=collectService.selectCollectByUid(this.getId(session));
        request.setAttribute("collects",collects);
        return "front/collect";
    }
    //取消收藏
    @RequestMapping("/delCollect")
    @ResponseBody
    public ResponseResult<Void> delCollect(Long collectId){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        collectService.deleteCollectById(collectId);
        rr.setState(1);
        rr.setMessage("取消成功！");
        return rr;
    }
    //显示我的地址
    @RequestMapping("/showAddress.do")
    public String showAddress(ModelMap modelMap, HttpSession session){
        Long uid=this.getId(session);
        Long sum=addressService.selectCountByUid(uid);
        List<Address> addressList=addressService.getAddressByUid(uid);
        modelMap.addAttribute("addressList",addressList);
        modelMap.addAttribute("addressSum",sum);
        return "front/address";
    }

    //显示修改密码
    @RequestMapping("/showChangePassword.do")
    public String showChangePassword(){
        return "front/personalPassword";
    }


}
