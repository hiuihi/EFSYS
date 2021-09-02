package cn.fungus.vo;

import cn.fungus.domain.Order;
import cn.fungus.domain.OrderGoods;
import cn.fungus.domain.Reimburse;

import java.util.List;

public class OGoodsReimburserVo {
    private Reimburse reimburse;
    private List<OrderGoods> orderGoods;

    public OGoodsReimburserVo() {
        super();
    }

    public OGoodsReimburserVo(Reimburse reimburse, List<OrderGoods> orderGoods) {
        this.reimburse = reimburse;
        this.orderGoods = orderGoods;
    }

    public Reimburse getReimburse() {
        return reimburse;
    }

    public void setReimburse(Reimburse reimburse) {
        this.reimburse = reimburse;
    }

    public List<OrderGoods> getOrderGoods() {
        return orderGoods;
    }

    public void setOrderGoods(List<OrderGoods> orderGoods) {
        this.orderGoods = orderGoods;
    }

    @Override
    public String toString() {
        return "OGoodsReimburserVo{" +
                "reimburse=" + reimburse +
                ", orderGoods=" + orderGoods +
                '}';
    }
}

