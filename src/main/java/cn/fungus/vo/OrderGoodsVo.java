package cn.fungus.vo;

import cn.fungus.domain.Order;
import cn.fungus.domain.OrderGoods;
import java.util.List;

public class OrderGoodsVo {
    private Order order;
    private List<OrderGoods> orderGoods;

    public OrderGoodsVo() {
        super();
    }

    public OrderGoodsVo(Order order, List<OrderGoods> orderGoods) {
        this.order = order;
        this.orderGoods = orderGoods;
    }

    @Override
    public String toString() {
        return "OrderGoodsVo{" +
                "order=" + order +
                ", orderGoods=" + orderGoods +
                '}';
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderGoods> getOrderGoods() {
        return orderGoods;
    }

    public void setOrderGoods(List<OrderGoods> orderGoods) {
        this.orderGoods = orderGoods;
    }
}

