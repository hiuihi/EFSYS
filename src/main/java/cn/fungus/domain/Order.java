package cn.fungus.domain;

import java.util.Date;

//订单实体类
public class Order {
    private Long id;
    private Long userId;                      //用户id
    private String orderSn;                   //订单编号
    private String goodsIds;                   //商品id：逗号分隔
    private Date createTime;                  //提交时间
    private Double totalAmount;               //订单总金额
    private Integer orderStatus;              //订单状态：0->待付款；1->待发货；2->已发货；3->已收货；4->已评价；5->已关闭；6->退货退款
    private Date paymentTime;                 //支付时间
    private String tradeNo;                 //交易号
    private String deliveryCompany;           //物流公司(配送方式)
    private String deliverySn;                //物流单号
    private Long addressId;                  //用户地址id
    private String userAddressName;         //用户地址名
    private String tel;                       //电话
    private String province;                 //所在省
    private String city;                     //所在市
    private String county;                   //所在县/区
    private String address;                  //详细地址
    private Integer isDel;                 //是否删除，0：否，1：是
    private Date deliveryTime;              //发货时间
    private Date receiveTime;               //确认收货时间
    private Date commentTime;               //评价时间
    private Double refundPrice;            //退款金额
    private Integer returnedQuantity;      //退货数量
    private Date updTime;                  //更新时间


    public Order() {
        super();
    }


    public Order(Long userId, String orderSn, String goodsIds, Date createTime, Double totalAmount, Integer orderStatus, Address address) {
        this.userId = userId;
        this.orderSn = orderSn;
        this.goodsIds = goodsIds;
        this.createTime = createTime;
        this.totalAmount = totalAmount;
        this.orderStatus = orderStatus;
        this.addressId = address.getId();
        this.userAddressName = address.getUserAddressName();
        this.tel = address.getTel();
        this.province = address.getProvince();
        this.city = address.getCity();
        this.county = address.getCounty();
        this.address = address.getAddress();

    }

    public Order(Long id, Long userId, String orderSn, String goodsIds, Date createTime, Double totalAmount, Integer orderStatus, Date paymentTime, String tradeNo, String deliveryCompany, String deliverySn, Long addressId, String userAddressName, String tel, String province, String city, String county, String address, Integer isDel, Date deliveryTime, Date receiveTime, Date commentTime, Double refundPrice, Integer returnedQuantity, Date updTime) {
        this.id = id;
        this.userId = userId;
        this.orderSn = orderSn;
        this.goodsIds = goodsIds;
        this.createTime = createTime;
        this.totalAmount = totalAmount;
        this.orderStatus = orderStatus;
        this.paymentTime = paymentTime;
        this.tradeNo = tradeNo;
        this.deliveryCompany = deliveryCompany;
        this.deliverySn = deliverySn;
        this.addressId = addressId;
        this.userAddressName = userAddressName;
        this.tel = tel;
        this.province = province;
        this.city = city;
        this.county = county;
        this.address = address;
        this.isDel = isDel;
        this.deliveryTime = deliveryTime;
        this.receiveTime = receiveTime;
        this.commentTime = commentTime;
        this.refundPrice = refundPrice;
        this.returnedQuantity = returnedQuantity;
        this.updTime = updTime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", orderSn='" + orderSn + '\'' +
                ", goodsIds='" + goodsIds + '\'' +
                ", createTime=" + createTime +
                ", totalAmount=" + totalAmount +
                ", orderStatus=" + orderStatus +
                ", paymentTime=" + paymentTime +
                ", tradeNo='" + tradeNo + '\'' +
                ", deliveryCompany='" + deliveryCompany + '\'' +
                ", deliverySn='" + deliverySn + '\'' +
                ", addressId=" + addressId +
                ", userAddressName='" + userAddressName + '\'' +
                ", tel='" + tel + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", county='" + county + '\'' +
                ", address='" + address + '\'' +
                ", isDel=" + isDel +
                ", deliveryTime=" + deliveryTime +
                ", receiveTime=" + receiveTime +
                ", commentTime=" + commentTime +
                ", refundPrice=" + refundPrice +
                ", returnedQuantity=" + returnedQuantity +
                ", updTime=" + updTime +
                '}';
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public String getDeliveryCompany() {
        return deliveryCompany;
    }

    public void setDeliveryCompany(String deliveryCompany) {
        this.deliveryCompany = deliveryCompany;
    }

    public String getDeliverySn() {
        return deliverySn;
    }

    public void setDeliverySn(String deliverySn) {
        this.deliverySn = deliverySn;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public String getUserAddressName() {
        return userAddressName;
    }

    public void setUserAddressName(String userAddressName) {
        this.userAddressName = userAddressName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Date getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Double getRefundPrice() {
        return refundPrice;
    }

    public void setRefundPrice(Double refundPrice) {
        this.refundPrice = refundPrice;
    }

    public Integer getReturnedQuantity() {
        return returnedQuantity;
    }

    public void setReturnedQuantity(Integer returnedQuantity) {
        this.returnedQuantity = returnedQuantity;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }
}
