package cn.fungus.domain;

import java.util.Date;

//购物车实体类
public class Cart {
    private Long id;
    private Long userId;                        //用户id
    private Integer goodsId;                       //商品id
    private String goodsName;                 //商品名
    private String images;                    //封面图片
    private Double price;                     //销售价格
    private Double promotionPrice;           //促销价格
    private Integer stock;                   //购买数量
    private Double totalPrice;              //总价
    private String spec;                    //规格
    private Integer isEnable;               //是否显示（0否，1是）
    private Date updTime;                  // 更新时间

    public Cart() {
        super();
    }

    public Cart(Long id, Long userId, Integer goodsId, String goodsName, String images, Double price, Double promotionPrice, Integer stock, Double totalPrice, String spec, Integer isEnable, Date updTime) {
        this.id = id;
        this.userId = userId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.images = images;
        this.price = price;
        this.promotionPrice = promotionPrice;
        this.stock = stock;
        this.totalPrice = totalPrice;
        this.spec = spec;
        this.isEnable = isEnable;
        this.updTime = updTime;
    }

    public Cart(Long userId, Integer goodsId, String goodsName, String images, Double price, Double promotionPrice, Integer stock, Double totalPrice, String spec) {
        this.userId = userId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.images = images;
        this.price = price;
        this.promotionPrice = promotionPrice;
        this.stock = stock;
        this.totalPrice = totalPrice;
        this.spec = spec;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", userId=" + userId +
                ", goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", images='" + images + '\'' +
                ", price=" + price +
                ", promotionPrice=" + promotionPrice +
                ", stock=" + stock +
                ", totalPrice=" + totalPrice +
                ", spec='" + spec + '\'' +
                ", isEnable=" + isEnable +
                ", updTime=" + updTime +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(Integer isEnable) {
        this.isEnable = isEnable;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(Double promotionPrice) {
        this.promotionPrice = promotionPrice;
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

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }
}
