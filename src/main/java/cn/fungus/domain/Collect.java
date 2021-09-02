package cn.fungus.domain;

import java.util.Date;

//收藏实体类
public class Collect {
    private Long id;
    private Long userId;                        //用户id
    private Long goodsId;                    //商品id
    private String goodsName;                 //商品名
    private String images;                    //封面图片
    private Double price;                     //销售价格
    private Double promotionPrice;           //促销价格
    private Integer isEnable;               //是否显示（0否，1是）
    private Date updTime;                  // 更新时间

    public Collect() {
        super();
    }

    public Collect(Long userId, Long goodsId, String goodsName, String images, Double price, Double promotionPrice) {
        this.userId = userId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.images = images;
        this.price = price;
        this.promotionPrice = promotionPrice;
    }

    public Collect(Long id, Long userId, Long goodsId, String goodsName, String images, Double price, Double promotionPrice, Integer isEnable, Date updTime) {
        this.id = id;
        this.userId = userId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.images = images;
        this.price = price;
        this.promotionPrice = promotionPrice;
        this.isEnable = isEnable;
        this.updTime = updTime;
    }
    public Collect(Long uid,Goods goods) {

        this.userId = uid;
        this.goodsId = goods.getGoodsId().longValue();
        this.goodsName = goods.getGoodsName();
        this.images = goods.getIcon();
        this.price = goods.getPrice();
        this.promotionPrice = goods.getPromotionPrice();
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Integer getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(Integer isEnable) {
        this.isEnable = isEnable;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "id=" + id +
                ", userId=" + userId +
                ", goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", images='" + images + '\'' +
                ", price=" + price +
                ", promotionPrice=" + promotionPrice +
                ", isEnable=" + isEnable +
                ", updTime=" + updTime +
                '}';
    }
}
