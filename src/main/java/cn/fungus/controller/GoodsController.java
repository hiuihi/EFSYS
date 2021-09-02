package cn.fungus.controller;

import cn.fungus.bean.PageBean;
import cn.fungus.domain.Comment;
import cn.fungus.domain.Goods;
import cn.fungus.domain.GoodsCategory;
import cn.fungus.service.CommentService;
import cn.fungus.service.GoodsCategoryService;
import cn.fungus.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("goods")
public class GoodsController {
//    @Autowired
//    private IGoodsService goodsService;
    @Autowired
    private GoodsService goodsService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private GoodsCategoryService goodsCategoryService;
    //商品列表页
    @RequestMapping("/showSearch.do")
    public String showSearch(ModelMap modelMap, HttpSession session, HttpServletRequest request){
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
        String goodsName=request.getParameter("goodsName");
        String categoryId=request.getParameter("categoryId");
        if(start==null || "".equals(start)){
            start="0";
        }
        if(rows==null || "".equals(rows)){
            rows="9";
        }
        if (currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }else{
            start=""+Integer.parseInt(rows)*(Integer.parseInt(currentPage)-1);
        }
        if (goodsName==null){
            goodsName="";
        }
        request.setAttribute("goodsName",goodsName);
        if (goodsName==null || "".equals(goodsName)){
            goodsName="%"+""+"%";
        }else{
            goodsName="%"+goodsName+"%";
        }
        if (categoryId==null || "".equals(categoryId)){
            categoryId="%"+""+"%";
        }else{
            categoryId="%"+categoryId+"%";
        }
        //总记录数
        Integer totalCount=goodsService.selectCount(goodsName,categoryId);
        //总页数
        Long row=Long.parseLong(rows);
        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;
        List<Goods> goods = goodsService.getGoods(goodsName,categoryId,Integer.parseInt(start),Integer.parseInt(rows));

        PageBean pageBean=new PageBean(totalCount.longValue(),totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows),Integer.parseInt(start));
        List<GoodsCategory> goodsCategories=goodsCategoryService.getCategory();
        request.setAttribute("goodsCategories",goodsCategories);
        request.setAttribute("goodslist",goods);
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("pageBean",pageBean);

        return "front/shop";
    }
    //商品详情页
    @RequestMapping("/showGoodsDetails.do")
    public String showGoodsDetails(String gid, ModelMap modelMap,HttpSession session){
//        System.out.println("ess2:"+session.getAttribute("user"));
        Integer goodsId = Integer.parseInt(gid);
        Integer grade=getStart(goodsId.longValue());
        goodsService.updGradeByGid(grade,goodsId);

        Goods goodsById = goodsService.selectGoodsByGid(goodsId,0);
        List<Goods> goods = goodsService.selectGoodsNoPagination();

        List<Comment> comments=commentService.selectCommentByGoodsId(goodsId.longValue(),0,10);
        Long count=commentService.selectCountByGid(goodsId.longValue());
        modelMap.addAttribute("goods",goodsById);
        modelMap.addAttribute("goodslist",goods);
        modelMap.addAttribute("comments",comments);
        modelMap.addAttribute("count",count);
        return "front/productDetails";
    }
    public Integer getStart(Long goodsId){
        Integer start=0;
        List<Comment> comments=commentService.selectCommentByGid(goodsId);
        Integer len=comments.size();
        if(len>0){
            for (Comment comment : comments){
                start+=comment.getRating();
            }
            start=start/len;
        }
        return start;
    }
}
