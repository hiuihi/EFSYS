package cn.fungus.controller;

import cn.fungus.bean.ResponseResult;
import cn.fungus.domain.Cart;
import cn.fungus.domain.Goods;
import cn.fungus.service.CartService;
import cn.fungus.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("cart")
public class CartController extends BaseController{
//        extends BaseController

   @Autowired
    private CartService cartService;

    @Autowired
    private GoodsService goodsService;

    // 添加到购物车
    @RequestMapping("addCart")
    @ResponseBody
    public ResponseResult<Void> addCart(HttpSession session,Integer goodsId,Integer quantity,String spec){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        Goods goods=goodsService.selectGoodsByGid(goodsId,0);
        double total=0;
        if (quantity==null){
            quantity=1;
        }
        if (spec==null){
            String str =goods.getSpec();
            String[] split = str.split(",");
            spec=split[0];
        }
        if (goods.getPromotionPrice()!=0 && goods.getDiscountStatus()==1){
            total=quantity*goods.getPromotionPrice();
        }else{
            total=quantity*goods.getPrice();
        }
        Cart cart=new Cart(this.getId(session),goods.getGoodsId(),goods.getGoodsName(),goods.getIcon(),goods.getPrice(),goods.getPromotionPrice(),quantity,total,spec);

        cartService.addCart(cart);

        rr.setState(1);
        rr.setMessage("添加成功！");
        return rr;
    }


    //   显示购物车页面
    @RequestMapping("showCart.do")
    public String showCart(HttpSession session, ModelMap modelMap){
        //System.out.println("se:"+this.getId(session));
        Long uid=this.getId(session);
        //System.out.println("u:"+uid);
        List<Cart> list = cartService.getCartByUid(uid);
        modelMap.addAttribute("cartList",list);
        return "front/cart";
    }

    // 删除购物车商品
    @RequestMapping("delCart")
    @ResponseBody
    public ResponseResult<Void> delCart(HttpSession session,Long id,String cb){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        if (cb==null){
            cartService.deleteCartById(id);
        }else{
            String[] split = cb.split(",");
            for (String idd:split){
                cartService.deleteCartById(Long.parseLong(idd));
            }
        }
        rr.setState(1);
        rr.setMessage("删除成功！");
        return rr;
    }
    // 修改购物车商品(数量，总价)
    @RequestMapping("updCart")
    @ResponseBody
    public ResponseResult<Void> updCart(HttpSession session,Integer total,double quantity,Long id){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        cartService.updateCartByGoodsId(total,quantity,id);
        rr.setState(1);
        rr.setMessage("修改成功！");
        return rr;
    }

}

