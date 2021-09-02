package cn.fungus.domain;

import java.util.Date;

//后台用户
public class Admin {
    private Long id;
    private String adminName;                  //用户名
    private String password;                 //密码
    private String nickName;                 //昵称
    private String icon;                    //头像
    private String note;                    //备注信息
    private Integer adminStatus;            //帐号启用状态:0禁用；1启用
    private Date createTime;               //注册时间
    private String address;                 //地址
    private Date loginTime;                //最后登录时间

    public Admin() {
        super();
    }

    public Admin(Long id, String adminName, String password, String nickName, String icon, String note, Integer adminStatus, Date createTime, Date loginTime) {
        this.id = id;
        this.adminName = adminName;
        this.password = password;
        this.nickName = nickName;
        this.icon = icon;
        this.note = note;
        this.adminStatus = adminStatus;
        this.createTime = createTime;
        this.loginTime = loginTime;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", adminName='" + adminName + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", icon='" + icon + '\'' +
                ", note='" + note + '\'' +
                ", adminStatus=" + adminStatus +
                ", createTime=" + createTime +
                ", address='" + address + '\'' +
                ", loginTime=" + loginTime +
                '}';
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Integer getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(Integer adminStatus) {
        this.adminStatus = adminStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }
}
