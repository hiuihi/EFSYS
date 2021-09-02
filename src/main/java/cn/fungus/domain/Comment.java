package cn.fungus.domain;

import java.util.Date;

//商品评价实体类
public class Comment {
    private Long id;
    private Long userId;                  //用户id
    private String orderSn;              // 订单编号
    private Long goodsId;                //商品id
    private String goodsSpec;            //购买时的商品属性
    private String userIcon;            //评论用户头像
    private String content;              //评价内容
    private String pics;                 //评价图片，以逗号隔开，第一个为路径，后续为文件名
    private Integer rating;              //评价级别（默认0 1~5）
    private Integer isShow;             //是否显示（0否, 1是）
    private Integer isAnonymous;        // 是否匿名（0否，1是）
    private String reply;                //回复内容
    private Integer isReply;            //是否回复（0否，1是）
    private Date commentTime;          //评价时间
    private Date replyTime;            //回复时间
    private Date updTime;             //更新时间

    public Comment() {
        super();
    }
    public Comment(Long userId, String orderSn, Long goodsId, String goodsSpec, String userIcon, String content, Integer rating,Integer isShow, Integer isAnonymous, Date commentTime) {
        this.userId = userId;
        this.orderSn = orderSn;
        this.goodsId = goodsId;
        this.goodsSpec = goodsSpec;
        this.userIcon = userIcon;
        this.content = content;
        this.rating = rating;
        this.isShow=isShow;
        this.isAnonymous = isAnonymous;
        this.commentTime = commentTime;
    }
    public Comment(Long userId, String orderSn, Long goodsId, String goodsSpec, String userIcon, String content, String pics, Integer rating,Integer isShow, Integer isAnonymous, Date commentTime) {
        this.userId = userId;
        this.orderSn = orderSn;
        this.goodsId = goodsId;
        this.goodsSpec = goodsSpec;
        this.userIcon = userIcon;
        this.content = content;
        this.pics = pics;
        this.rating = rating;
        this.isShow=isShow;
        this.isAnonymous = isAnonymous;
        this.commentTime = commentTime;
    }

    public Comment(Long id, Long userId, String orderSn, Long goodsId, String goodsSpec, String userIcon, String content, String pics, Integer rating, Integer isShow, Integer isAnonymous, String reply, Integer isReply, Date commentTime, Date replyTime, Date updTime) {
        this.id = id;
        this.userId = userId;
        this.orderSn = orderSn;
        this.goodsId = goodsId;
        this.goodsSpec = goodsSpec;
        this.userIcon = userIcon;
        this.content = content;
        this.pics = pics;
        this.rating = rating;
        this.isShow = isShow;
        this.isAnonymous = isAnonymous;
        this.reply = reply;
        this.isReply = isReply;
        this.commentTime = commentTime;
        this.replyTime = replyTime;
        this.updTime = updTime;
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

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsSpec() {
        return goodsSpec;
    }

    public void setGoodsSpec(String goodsSpec) {
        this.goodsSpec = goodsSpec;
    }

    public String getUserIcon() {
        return userIcon;
    }

    public void setUserIcon(String userIcon) {
        this.userIcon = userIcon;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPics() {
        return pics;
    }

    public void setPics(String pics) {
        this.pics = pics;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public Integer getIsAnonymous() {
        return isAnonymous;
    }

    public void setIsAnonymous(Integer isAnonymous) {
        this.isAnonymous = isAnonymous;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Integer getIsReply() {
        return isReply;
    }

    public void setIsReply(Integer isReply) {
        this.isReply = isReply;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", orderSn='" + orderSn + '\'' +
                ", goodsId=" + goodsId +
                ", goodsSpec='" + goodsSpec + '\'' +
                ", userIcon='" + userIcon + '\'' +
                ", content='" + content + '\'' +
                ", pics='" + pics + '\'' +
                ", rating=" + rating +
                ", isShow=" + isShow +
                ", isAnonymous=" + isAnonymous +
                ", reply='" + reply + '\'' +
                ", isReply=" + isReply +
                ", commentTime=" + commentTime +
                ", replyTime=" + replyTime +
                ", updTime=" + updTime +
                '}';
    }
}
