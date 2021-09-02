package cn.fungus.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//商品详情实体类
public class Goods {
    private Integer id;
    private Integer goodsId;                //商品id
    private String goodsName;               // 商品名
    private String icon;                      //封面图
    private String pic;                      //主图，以逗号分隔，第一个为路径，后续为文件名
    private String subPic;                  //副图，以逗号分隔
    private String title;                    //标题
    private Integer grade;                    //评分1-5，默认为0
    private String simpleDesc;              //简述
    private Double price;                   //价格
    private Integer stock;                   //库存
    private Integer lowStock;               //库存预警值
    private String spec;                     //规格，以逗号分隔
    private Integer sale;                    //销量
    private String unit;                    //单位，默认为克
    private Double weight;                  //商品重量
    private String description;              //商品描述
    private String albumPics;               //画册图片，限制为5张，以逗号分割
    private Double promotionPrice;         // 促销价格
    private Date promotionStartTime;       //促销开始时间
    private Date promotionEndTime;         //促销结束时间
    private Integer promotionPerLimit;     //活动限购数量
    private Integer deleteStatus;           //删除状态：0->未删除；1->已删除
    private Integer publishStatus;          //上架状态：0->下架；1->上架
    private Integer newStatus;              //新品状态:0->不是新品；1->新品
    private Integer recommandStatus;        //推荐状态；0->不推荐；1->推荐
    private Integer discountStatus;         // 折扣状态；0->无折扣；1->折扣
    private Integer categoryId;             //商品分类id
    private Date updTime;                   //更新时间

    public Goods() {
        super();
    }

    public Goods(Integer goodsId, String goodsName, String icon, String pic, String subPic, String title, String simpleDesc, Double price, Integer stock, Integer lowStock, String spec,  String unit, Double weight, String description, String albumPics, Double promotionPrice, String promotionStartTime, String promotionEndTime, Integer promotionPerLimit, Integer publishStatus, Integer newStatus, Integer recommandStatus, Integer discountStatus, Integer categoryId) throws ParseException {
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.icon = icon;
        this.pic = pic;
        this.subPic = subPic;
        this.title = title;
        this.simpleDesc = simpleDesc;
        this.price = price;
        this.stock = stock;
        this.lowStock = lowStock;
        this.spec = spec;
        this.unit = unit;
        this.weight = weight;
        this.description = description;
        this.albumPics = albumPics;
        this.promotionPrice = promotionPrice;
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (promotionStartTime!=null && !"".equals(promotionStartTime)){
            this.promotionStartTime = sdf.parse(promotionStartTime);
        }
        if (promotionEndTime!=null && !"".equals(promotionEndTime)){
            this.promotionEndTime = sdf.parse(promotionEndTime);
        }
        this.promotionPerLimit = promotionPerLimit;
        this.publishStatus = publishStatus;
        this.newStatus = newStatus;
        this.recommandStatus = recommandStatus;
        this.discountStatus = discountStatus;
        this.categoryId = categoryId;
    }

    public Goods(Integer id, Integer goodsId, String goodsName, String pic, String icon, String subPic, String title, Integer grade, String simpleDesc, Double price, Integer stock, Integer lowStock, String spec, Integer sale, String unit, Double weight, String description, String albumPics, Double promotionPrice, Date promotionStartTime, Date promotionEndTime, Integer promotionPerLimit, Integer deleteStatus, Integer publishStatus, Integer newStatus, Integer recommandStatus, Integer discountStatus, Integer categoryId, Date updTime) {
        this.id = id;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.pic = pic;
        this.icon = icon;
        this.subPic = subPic;
        this.title = title;
        this.grade = grade;
        this.simpleDesc = simpleDesc;
        this.price = price;
        this.stock = stock;
        this.lowStock = lowStock;
        this.spec = spec;
        this.sale = sale;
        this.unit = unit;
        this.weight = weight;
        this.description = description;
        this.albumPics = albumPics;
        this.promotionPrice = promotionPrice;
        this.promotionStartTime = promotionStartTime;
        this.promotionEndTime = promotionEndTime;
        this.promotionPerLimit = promotionPerLimit;
        this.deleteStatus = deleteStatus;
        this.publishStatus = publishStatus;
        this.newStatus = newStatus;
        this.recommandStatus = recommandStatus;
        this.discountStatus = discountStatus;
        this.categoryId = categoryId;
        this.updTime = updTime;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", pic='" + pic + '\'' +
                ", icon='" + icon + '\'' +
                ", subPic='" + subPic + '\'' +
                ", title='" + title + '\'' +
                ", grade=" + grade +
                ", simpleDesc='" + simpleDesc + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", lowStock=" + lowStock +
                ", spec='" + spec + '\'' +
                ", sale=" + sale +
                ", unit='" + unit + '\'' +
                ", weight=" + weight +
                ", description='" + description + '\'' +
                ", albumPics='" + albumPics + '\'' +
                ", promotionPrice=" + promotionPrice +
                ", promotionStartTime=" + promotionStartTime +
                ", promotionEndTime=" + promotionEndTime +
                ", promotionPerLimit=" + promotionPerLimit +
                ", deleteStatus=" + deleteStatus +
                ", publishStatus=" + publishStatus +
                ", newStatus=" + newStatus +
                ", recommandStatus=" + recommandStatus +
                ", discountStatus=" + discountStatus +
                ", categoryId=" + categoryId +
                ", updTime=" + updTime +
                '}';
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getSubPic() {
        return subPic;
    }

    public void setSubPic(String subPic) {
        this.subPic = subPic;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSimpleDesc() {
        return simpleDesc;
    }

    public void setSimpleDesc(String simpleDesc) {
        this.simpleDesc = simpleDesc;
    }



    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getLowStock() {
        return lowStock;
    }

    public void setLowStock(Integer lowStock) {
        this.lowStock = lowStock;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public Integer getSale() {
        return sale;
    }

    public void setSale(Integer sale) {
        this.sale = sale;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAlbumPics() {
        return albumPics;
    }

    public void setAlbumPics(String albumPics) {
        this.albumPics = albumPics;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Double getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(Double promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    public Date getPromotionStartTime() {
        return promotionStartTime;
    }

    public void setPromotionStartTime(Date promotionStartTime) {
        this.promotionStartTime = promotionStartTime;
    }

    public Date getPromotionEndTime() {
        return promotionEndTime;
    }

    public void setPromotionEndTime(Date promotionEndTime) {
        this.promotionEndTime = promotionEndTime;
    }

    public Integer getPromotionPerLimit() {
        return promotionPerLimit;
    }

    public void setPromotionPerLimit(Integer promotionPerLimit) {
        this.promotionPerLimit = promotionPerLimit;
    }

    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

    public Integer getPublishStatus() {
        return publishStatus;
    }

    public void setPublishStatus(Integer publishStatus) {
        this.publishStatus = publishStatus;
    }

    public Integer getNewStatus() {
        return newStatus;
    }

    public void setNewStatus(Integer newStatus) {
        this.newStatus = newStatus;
    }

    public Integer getRecommandStatus() {
        return recommandStatus;
    }

    public void setRecommandStatus(Integer recommandStatus) {
        this.recommandStatus = recommandStatus;
    }

    public Integer getDiscountStatus() {
        return discountStatus;
    }

    public void setDiscountStatus(Integer discountStatus) {
        this.discountStatus = discountStatus;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }
}
