package cn.fungus.service.impl;

import cn.fungus.dao.AddressDao;
import cn.fungus.dao.CartDao;
import cn.fungus.dao.OrdersDao;
import cn.fungus.domain.*;
import cn.fungus.service.GoodsService;
import cn.fungus.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrdersDao ordersDao;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private CartDao cartDao;

    @Autowired
    private AddressDao addressDao;
    /**
     * 生成订单
     * @param
     */
    @Override
    public void createOrder(Long addressId, Double totalPrice, String goodsIds, String ids,String orderSn) throws Exception {
        List<Cart> carts=new ArrayList<>();
        OrderGoods orderGoods;
        Long userId = null;
        // 购物车id
        String[] idss = ids.split(",");
        for (String id:idss){
            Cart cart = cartDao.selectCartById(Long.parseLong(id));
            userId=cart.getUserId();
            carts.add(cart);
            orderGoods=new OrderGoods(orderSn,cart);
            ordersDao.insertOrderGoods(orderGoods);
            cartDao.deleteCartById(Long.parseLong(id));
        }
        // 更新库存
        String[] goodsIdss = goodsIds.split(",");
        for (String goodsId:goodsIdss){
            Integer gid=Integer.parseInt(goodsId);
            Goods goods=goodsService.selectGoodsByGid(gid,1);
            Integer stock=goods.getStock();
            Integer sales=goods.getSale();
            if (sales==null){
                sales=0;
            }
            goodsService.updStockByGid(stock-1,gid);
            goodsService.updSaleByGid(sales+1,gid);
        }
        Address address=addressDao.selectAddressById(addressId);
        Order order=new Order(userId,orderSn,goodsIds,new Date(),totalPrice,0,address);
        ordersDao.insertOrder(order);

    }

    /**
     * 插入订单信息
     * @param
     */
    @Override
    public void insertOrder(Order order) {
        ordersDao.insertOrder(order);
    }
    /**
     * 分页查询订单信息
     * @param
     */
    @Override
    public List<Order> selectOrderByUid(Long userId,String orderStatus,String term,Integer start,Integer rows) {
        return ordersDao.selectOrderByUid(userId,orderStatus,term,start,rows);
    }
    /**
     * 分页查询所有订单信息
     * @param
     */
    @Override
    public List<Order> selectAllOrder(String orderStatus,String orderSn,String userId, Integer start, Integer rows) {
        return ordersDao.selectAllOrder(orderStatus,orderSn,userId,start,rows);
    }

    /**
     * 查询订单条数
     * @param
     */
    @Override
    public Long selectCount(String orderStatus,String orderSn,String userId) {
        return ordersDao.selectCount(orderStatus,orderSn,userId);
    }

    /**
     * 根据订单号查询订单信息
     * @param
     */
    @Override
    public Order selectOrderByUidSn( String orderSn) {
        return ordersDao.selectOrderByUidSn(orderSn);
    }
    /**
     * 根据uid查询订单条数
     * @param
     */
    @Override
    public Long selectCountByUid(Long userId,String orderStatus) {
        return ordersDao.selectCountByUid(userId,orderStatus);
    }
    /**
     * 修改订单状态
     * @param order
     */
    @Override
    public void updOrderStatusByUidSn(Order order) {
        ordersDao.updOrderStatusByUidSn(order);
    }
    /**
     * 删除订单
     * @param orderSn
     */
    @Override
    public void delOrderByUidSn(String orderSn) {
        ordersDao.delOrderByUidSn(orderSn);
    }
    /**
     * 修改订单物流信息
     * @param order
     */
    @Override
    public void updOrderDelivery(Order order) {
        ordersDao.updOrderDelivery(order);
    }

    /**
     * 修改订单状态为待发货等
     * @param orderStatus,orderSn
     */
    @Override
    public void updOrderStatusByOrderSn(Integer orderStatus, String orderSn) {
        ordersDao.updOrderStatusByOrderSn(orderStatus, orderSn);
    }


    /**
     * 插入订单订单商品信息
     * @param
     */
    @Override
    public void insertOrderGoods(OrderGoods orderGoods) {
        ordersDao.insertOrderGoods(orderGoods);
    }
    /**
     * 查询订单商品信息
     * @param
     */
    @Override
    public List<OrderGoods> selectOrderGoodsByOrderSn(String orderSn) {
        return ordersDao.selectOrderGoodsByOrderSn(orderSn);
    }
    /**
     * 查询所有订单商品信息
     * @param
     */
    @Override
    public List<OrderGoods> selectAllOrderGoods() {
        return ordersDao.selectAllOrderGoods();
    }

    /**
     * 查询订单商品信息根据订单号和输入框的内容
     * @param
     */
    @Override
    public List<OrderGoods> getOrderGoodsByOrderSnAndTerm(String orderSn, String term) {
        return ordersDao.getOrderGoodsByOrderSnAndTerm(orderSn, term);
    }


    /**
     * 插入退款
     * @param reimburse
     */
    @Override
    public void insertReimburse(Reimburse reimburse) {
        ordersDao.insertReimburse(reimburse);
    }

    /**
     * 查询退款信息
     * @param orderSn
     * return Reimburse
     */
    @Override
    public Reimburse selectReimburseByOrderSn(String orderSn) {
        return ordersDao.selectReimburseByOrderSn(orderSn);
    }
    /**
     * 修改退款卖家意见
     * @param reimburse
     */
    @Override
    public void updRSellerOpinionByOrderSn(Reimburse reimburse) {
        ordersDao.updRSellerOpinionByOrderSn(reimburse);
    }
    /**
     * 修改退款卖家说明
     * @param reimburse
     */
    @Override
    public void updRSellerCaptionByOrderSn(Reimburse reimburse) {
        ordersDao.updRSellerCaptionByOrderSn(reimburse);
    }
    /**
     * 修改退款物流单号
     * @param reimburse
     */
    @Override
    public void updRDeliveryByOrderSn(Reimburse reimburse) {
        ordersDao.updRDeliveryByOrderSn(reimburse);
    }
    /**
     * 修改退款状态
     * @param reimburse
     */
    @Override
    public void updRDeliveryStatusByOrderSn(Reimburse reimburse) {
        ordersDao.updRDeliveryStatusByOrderSn(reimburse);
    }
    /**
     * 修改地址
     * @param reimburse
     */

    @Override
    public void updRAddressByOrderSn(Reimburse reimburse) {
        ordersDao.updRAddressByOrderSn(reimburse);
    }
    /**
     * 取消退款请求
     * @param orderSn
     */
    @Override
    public void delRByOrderSn(String orderSn) {
        ordersDao.delRByOrderSn(orderSn);
    }
}
