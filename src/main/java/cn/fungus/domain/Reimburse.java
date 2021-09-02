package cn.fungus.domain;

import java.util.Date;

//退款实体类
public class Reimburse {
    private Long id;
    private String orderSn;                         //订单编号
    private String goodsIds;                        //商品id：逗号分隔
    private Integer isReceivedGoods;              //是否收到货，0：否；1：是
    private Integer isRetutnGoods;               //是否退货，0：否；1：是
    private Integer isAllReimburse;              //是否全部退款，0：否；1：是
    private Double price;                          //退款金额
    private String reason;                       //退款理由
    private String caption;                      //退款说明
    private String images;                      //照片凭证,首个路径,后续为文件名,逗号分隔
    private Integer sellerOpinion;               //卖家意见:0:不同意，1：同意
    private String sellerCaption;               //卖家说明
    private String delivery;                      //物流单号
    private String deliveryCompany;                      //物流单号
    private String address;                      //地址
    private Integer deliveryStatus;               //退款状态：0:买家发起请求，1：商家处理，2:买家退货，3：退款成功
    private Integer orderStatus;               //原订单状态


    public Reimburse() {
        super();
    }

    public Reimburse(String orderSn, String goodsIds, Integer isReceivedGoods, Integer isRetutnGoods, Integer isAllReimburse, Double price, String reason, String caption, Integer deliveryStatus, Integer orderStatus) {
        this.orderSn = orderSn;
        this.goodsIds = goodsIds;
        this.isReceivedGoods = isReceivedGoods;
        this.isRetutnGoods = isRetutnGoods;
        this.isAllReimburse = isAllReimburse;
        this.price = price;
        this.reason = reason;
        this.caption = caption;
        this.deliveryStatus = deliveryStatus;
        this.orderStatus=orderStatus;
    }

    public Reimburse(String orderSn, String goodsIds, Integer isReceivedGoods, Integer isRetutnGoods, Integer isAllReimburse, Double price, String reason, String caption, String images, Integer deliveryStatus, Integer orderStatus) {
        this.orderSn = orderSn;
        this.goodsIds = goodsIds;
        this.isReceivedGoods = isReceivedGoods;
        this.isRetutnGoods = isRetutnGoods;
        this.isAllReimburse = isAllReimburse;
        this.price = price;
        this.reason = reason;
        this.caption = caption;
        this.images = images;
        this.deliveryStatus = deliveryStatus;
        this.orderStatus=orderStatus;
    }

    public Reimburse(Long id, String orderSn, String goodsIds, Integer isReceivedGoods, Integer isRetutnGoods, Integer isAllReimburse, Double price, String reason, String caption, String images, Integer sellerOpinion, String sellerCaption, String delivery, String address, Integer deliveryStatus, Integer orderStatus) {
        this.id = id;
        this.orderSn = orderSn;
        this.goodsIds = goodsIds;
        this.isReceivedGoods = isReceivedGoods;
        this.isRetutnGoods = isRetutnGoods;
        this.isAllReimburse = isAllReimburse;
        this.price = price;
        this.reason = reason;
        this.caption = caption;
        this.images = images;
        this.sellerOpinion = sellerOpinion;
        this.sellerCaption = sellerCaption;
        this.delivery = delivery;
        this.address = address;
        this.deliveryStatus = deliveryStatus;
        this.orderStatus = orderStatus;
    }

    public String getDeliveryCompany() {
        return deliveryCompany;
    }

    public void setDeliveryCompany(String deliveryCompany) {
        this.deliveryCompany = deliveryCompany;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getSellerOpinion() {
        return sellerOpinion;
    }

    public void setSellerOpinion(Integer sellerOpinion) {
        this.sellerOpinion = sellerOpinion;
    }

    public String getSellerCaption() {
        return sellerCaption;
    }

    public void setSellerCaption(String sellerCaption) {
        this.sellerCaption = sellerCaption;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public Integer getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(Integer deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
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

    public String getGoodsIds() {
        return goodsIds;
    }

    public void setGoodsIds(String goodsIds) {
        this.goodsIds = goodsIds;
    }

    public Integer getIsReceivedGoods() {
        return isReceivedGoods;
    }

    public void setIsReceivedGoods(Integer isReceivedGoods) {
        this.isReceivedGoods = isReceivedGoods;
    }

    public Integer getIsRetutnGoods() {
        return isRetutnGoods;
    }

    public void setIsRetutnGoods(Integer isRetutnGoods) {
        this.isRetutnGoods = isRetutnGoods;
    }

    public Integer getIsAllReimburse() {
        return isAllReimburse;
    }

    public void setIsAllReimburse(Integer isAllReimburse) {
        this.isAllReimburse = isAllReimburse;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Reimburse{" +
                "id=" + id +
                ", orderSn='" + orderSn + '\'' +
                ", goodsIds='" + goodsIds + '\'' +
                ", isReceivedGoods=" + isReceivedGoods +
                ", isRetutnGoods=" + isRetutnGoods +
                ", isAllReimburse=" + isAllReimburse +
                ", price=" + price +
                ", reason='" + reason + '\'' +
                ", caption='" + caption + '\'' +
                ", images='" + images + '\'' +
                ", sellerOpinion=" + sellerOpinion +
                ", sellerCaption='" + sellerCaption + '\'' +
                ", delivery='" + delivery + '\'' +
                ", address='" + address + '\'' +
                ", deliveryStatus=" + deliveryStatus +
                ", orderStatus=" + orderStatus +
                '}';
    }
}
