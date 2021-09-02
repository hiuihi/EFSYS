package cn.fungus.domain;

import java.util.Date;

//订单商品详情实体类
public class OrderGoods {
    private Long id;
    private String orderSn;                  // 订单编号
    private Long userId;                    //用户id
    private Long goodsId;                   //商品id
    private String goodsName;               //商品名
    private String images;                   //封面图片
    private String spec;                    //规格
    private Double price;                   //价格
    private Integer stock;                   //购买数量
    private Double totalPrice;            //总价
    private Date updTime;                   //更新时间

    public OrderGoods() {
        super();
    }
    public OrderGoods(String orderSn,Cart cart) {
        this.orderSn = orderSn;
        this.userId = cart.getUserId();
        this.goodsId = cart.getGoodsId().longValue();
        this.goodsName = cart.getGoodsName();
        this.images = cart.getImages();
        this.spec = cart.getSpec();
        if (cart.getPromotionPrice()!=0){
            this.price = cart.getPromotionPrice();
        }else{
            this.price = cart.getPrice();
        }

        this.stock = cart.getStock();
        this.totalPrice = cart.getTotalPrice();
    }
    public OrderGoods(Long id, String orderSn, Long userId, Long goodsId, String goodsName, String images, String spec, Double price, Integer stock, Double totalPrice, Date updTime) {
        this.id = id;

        this.orderSn = orderSn;
        this.userId = userId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.images = images;
        this.spec = spec;
        this.price = price;
        this.stock = stock;
        this.totalPrice = totalPrice;
        this.updTime = updTime;
    }

    @Override
    public String toString() {
        return "OrderGoods{" +
                "id=" + id +
                ", orderSn='" + orderSn + '\'' +
                ", userId=" + userId +
                ", goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", images='" + images + '\'' +
                ", spec='" + spec + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", totalPrice=" + totalPrice +
                ", updTime=" + updTime +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }
}
