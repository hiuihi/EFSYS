package cn.fungus.domain;

import java.util.Date;

//商品分类表实体类
public class GoodsCategory {
    private Integer id;
    private Integer pid;                   //父id
    private String icon;                   //icon图标
    private String name;                   //名称
    private String viceName;              //  副标题
    private String describe;               //描述
    private Integer isHome;               //是否首页推荐（0否, 1是）
    private Integer sort;                  //排序号排序
    private Integer isEnable;             //是否启用（0否，1是）
    private Date updTime;                  //更新时间



    public GoodsCategory() {
        super();
    }

    public GoodsCategory(Integer id, Integer pid, String icon, String name, String viceName, String describe, Integer isHome, Integer sort, Integer isEnable, Date updTime) {
        this.id = id;
        this.pid = pid;
        this.icon = icon;
        this.name = name;
        this.viceName = viceName;
        this.describe = describe;
        this.isHome = isHome;
        this.sort = sort;
        this.isEnable = isEnable;
        this.updTime = updTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getViceName() {
        return viceName;
    }

    public void setViceName(String viceName) {
        this.viceName = viceName;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Integer getIsHome() {
        return isHome;
    }

    public void setIsHome(Integer isHome) {
        this.isHome = isHome;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
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
        return "GoodsCategory{" +
                "id=" + id +
                ", pid=" + pid +
                ", icon='" + icon + '\'' +
                ", name='" + name + '\'' +
                ", viceName='" + viceName + '\'' +
                ", describe='" + describe + '\'' +
                ", isHome=" + isHome +
                ", sort=" + sort +
                ", isEnable=" + isEnable +
                ", updTime=" + updTime +
                '}';
    }
}
