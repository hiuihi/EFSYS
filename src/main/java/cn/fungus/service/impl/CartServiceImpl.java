package cn.fungus.service.impl;

import cn.fungus.dao.CartDao;
import cn.fungus.domain.Cart;
import cn.fungus.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("cartService")
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDao cartDao;
    /**
     * 添加购物车数据
     * @param cart
     */
    @Override
    public void addCart(Cart cart) {
        Long uid=cart.getUserId();
        int stock=0;
        boolean is_eq=false;
        double totalPrice=0;
        List<Cart> List=cartDao.selectCartByUid(uid);
        for (Cart c : List){
            if (c.getGoodsId().equals(cart.getGoodsId())&&c.getSpec().equals(cart.getSpec())){
                stock=c.getStock()+cart.getStock();
                totalPrice=c.getTotalPrice()+cart.getTotalPrice();
                cartDao.updateCartByGoodsId(stock,totalPrice,c.getId());
                is_eq=true;
            }
        }
            if (!is_eq){
                cartDao.insertCart(cart);
            }


    }
    /**
     * 查询购物车表中的所有数据
     * @param
     */
    @Override
    public List<Cart> getCartByUid(Long userId) {
        //System.out.println("id:"+id);
        List<Cart> cart=cartDao.selectCartByUid(userId);
        return cartDao.selectCartByUid(userId);
    }

    /**
     * 根据id查询购物车表
     * @param
     * @return
     */
    @Override
    public Cart selectCartById(Long id) {
        return cartDao.selectCartById(id);
    }

    /**
     * 根据id删除购物车商品
     * @param
     */
    @Override
    public void deleteCartById(Long id) {
        cartDao.deleteCartById(id);
    }

    /**
     * 修改购物车商品(数量，总价)
     * @param
     */
    @Override
    public void updateCartByGoodsId(Integer stock, double totalPrice, Long id) {
        cartDao.updateCartByGoodsId(stock, totalPrice, id);
    }

}
