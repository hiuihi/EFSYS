package cn.fungus.service;

import cn.fungus.domain.Cart;
import java.util.List;

public interface CartService {
    /**
     * 添加购物车数据
     * @param cart
     */
    void addCart(Cart cart);
    /**
     * 查询购物车表中的所有数据
     * @param
     */
    List<Cart> getCartByUid(Long userId);

    /**
     * 根据id查询购物车表
     * @param
     * @return
     */
    Cart selectCartById(Long id);

    /**
     * 根据id删除购物车商品
     * @param
     */
    void deleteCartById(Long id);
    /**
     * 修改购物车商品(数量，总价)
     * @param
     */
    void updateCartByGoodsId(Integer stock,double totalPrice,Long id);
}
