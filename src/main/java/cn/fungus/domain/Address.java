package cn.fungus.domain;

import java.util.Date;

public class Address {
    private Long id;
    private Long userId;                        //用户id
    private String userAddressName;           //姓名
    private String tel;                         //电话
    private String province;                    //所在省
    private String city;                        //所在市
    private String county;                      //所在县/区
    private String address;                     //详细地址
    private Integer isDefault;                 //是否默认地址（0否, 1是）默认0
    private Integer isDeleteTime;            //是否删除（0否，1是）默认0
    private String alias;                       //别名
    private Date updTime;                      //更新时间

    public Address() {
        super();
    }

    public Address(Long userId, String userAddressName, String tel, String province, String city, String county, String address, Integer isDefault) {
        this.userId = userId;
        this.userAddressName = userAddressName;
        this.tel = tel;
        this.province = province;
        this.city = city;
        this.county = county;
        this.address = address;
        this.isDefault = isDefault;
    }

    public Address(Long id, Long userId, String userAddressName, String tel, String province, String city, String county, String address, Integer isDefault, Integer isDeleteTime, String alias, Date updTime) {
        this.id = id;
        this.userId = userId;
        this.userAddressName = userAddressName;
        this.tel = tel;
        this.province = province;
        this.city = city;
        this.county = county;
        this.address = address;
        this.isDefault = isDefault;
        this.isDeleteTime = isDeleteTime;
        this.alias = alias;
        this.updTime = updTime;
    }
    public Address(Long id, String userAddressName, String province, String city, String county, String address,String tel,  Integer isDefault, Integer isDeleteTime) {
        this.id = id;
        this.userAddressName = userAddressName;
        this.tel = tel;
        this.province = province;
        this.city = city;
        this.county = county;
        this.address = address;
        this.isDefault = isDefault;
        this.isDeleteTime = isDeleteTime;
    }
    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", userId=" + userId +
                ", userAddressName='" + userAddressName + '\'' +
                ", tel='" + tel + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", county='" + county + '\'' +
                ", address='" + address + '\'' +
                ", isDefault=" + isDefault +
                ", isDeleteTime=" + isDeleteTime +
                ", alias='" + alias + '\'' +
                ", updTime=" + updTime +
                '}';
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

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public Integer getIsDeleteTime() {
        return isDeleteTime;
    }

    public void setIsDeleteTime(Integer isDeleteTime) {
        this.isDeleteTime = isDeleteTime;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }
}
