package cn.fungus.controller;

import cn.fungus.domain.Goods;
import cn.fungus.domain.GoodsCategory;
import cn.fungus.service.GoodsCategoryService;
import cn.fungus.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("main")
public class MainController {
    @Autowired
    private GoodsCategoryService goodsCategoryService;
    @Autowired
    private GoodsService goodsService;
//    @Autowired
//    private IGoodsService goodsService;
    //显示主页
    @RequestMapping("showIndex.do")
    public String showIndex(ModelMap modelMap, HttpSession session){
            List<GoodsCategory> goodsCategories = goodsCategoryService.getCategory();
            List<Goods> goods = goodsService.selectGoodsNoPagination();
            modelMap.addAttribute("goodsCategorieslist",goodsCategories);
            modelMap.addAttribute("goodslist",goods);
        return "/front/index";
    }
    //显示主页内容
    @RequestMapping("showMain.do")
    public String showMain(ModelMap modelMap, HttpSession session){
        List<GoodsCategory> goodsCategories = goodsCategoryService.getCategory();
        List<Goods> goods = goodsService.selectGoodsNoPagination();
        modelMap.addAttribute("goodsCategorieslist",goodsCategories);
        modelMap.addAttribute("goodslist",goods);
        return "/front/main";
    }
}
