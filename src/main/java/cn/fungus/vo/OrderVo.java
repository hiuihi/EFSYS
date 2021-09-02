package cn.fungus.vo;

import java.util.Date;

public class OrderVo {
    private Long OrderId;                           //订单编号
    private Long userId;                      //用户id
    private String orderSn;                   //订单编号
    private String goodsIds;                   //商品id：逗号分隔
    private Date createTime;                  //提交时间
    private Double totalAmount;               //订单总金额
    private Integer orderStatus;              //订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单
    private Date paymentTime;                 //支付时间
    private String deliveryCompany;           //物流公司(配送方式)
    private String deliverySn;                //物流单号
    private Long addressId;                  //用户地址id
    private String userAddressName;         //用户地址名
    private String tel;                       //电话
    private String province;                 //所在省
    private String city;                     //所在市
    private String county;                   //所在县/区
    private String address;                  //详细地址
    private Date deliveryTime;              //发货时间
    private Date receiveTime;               //确认收货时间
    private Date commentTime;               //评价时间
    private Double refundPrice;            //退款金额
    private Integer returnedQuantity;      //退货数量

    private Long orderGoodsId;              //订单商品id
    private Long goodsId;                   //商品id
    private String goodsName;               //商品名
    private String images;                   //封面图片
    private String spec;                    //规格
    private Double price;                   //价格
    private Integer stock;                   //购买数量
    private Double totalPrice;              //总价

}
