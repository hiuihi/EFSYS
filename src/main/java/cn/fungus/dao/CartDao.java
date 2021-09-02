package cn.fungus.dao;

import cn.fungus.domain.Cart;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface CartDao {
    /**
     * 购物车表中插入数据
     * @param cart
     */
    void insertCart(Cart cart);

    /**
     * 查询购物车表中的所有数据
     * @param
     * @return
     */
    List<Cart> selectCartByUid(Long userId);

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
     * 根据id修改购物车商品(数量，总价)
     * @param
     */
    void updateCartByGoodsId(@Param("stock") Integer stock,@Param("totalPrice") double totalPrice, @Param("id")Long id);

}