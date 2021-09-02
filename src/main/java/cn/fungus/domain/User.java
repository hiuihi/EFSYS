package cn.fungus.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//用户实体类
public class User {
    private Integer id;
    private Long userid;
    private String username;                  //用户名
    private String password;                 //密码
    private String nickname;                 //昵称
    private Long phone;                    //手机号码
    private int userStatus;                //帐号启用状态:0禁用；1启用
    private Date createTime;               //注册时间
    private String icon;                    //头像
    private int gender;                     //性别：0未知；1男；2女
    private Date  birthday;                //生日
    private String city;                   //城市
    private String  job;                    //职业
    private String securityQuestion;       //密保问题
    private String  answer;                  //答案
    private Integer isDelete;             //是否删除：0->未删除；1->已删除

    public User() {
        super();
    }

    public User(Long userid, String username, String password, Long phone) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.phone = phone;
    }

    public User(Long userid, String username, String password, Long phone, String securityQuestion, String answer) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.securityQuestion = securityQuestion;
        this.answer = answer;
    }

    public User(Long userid, String username, String password, String nickname, Long phone, int userStatus, String icon, int gender, String birthday, String city, String job) throws ParseException {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.phone = phone;
        this.userStatus = userStatus;
        if (icon!=null && icon!=""){
            this.icon = icon;
        }
        this.gender = gender;
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
        if (birthday!=null && !"".equals(birthday)){
            this.birthday = sdf.parse(birthday);
        }
        this.city = city;
        this.job = job;
    }

    public User(Integer id, Long userid, String username, String password, String nickname, Long phone, int userStatus, String createTime, String icon, int gender, String birthday, String city, String job) throws ParseException {
        this.id = id;
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.phone = phone;
        this.userStatus = userStatus;
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (createTime!=null && !"".equals(createTime)){
            this.createTime = sdf.parse(createTime);
        }
        this.icon = icon;
        this.gender = gender;
        SimpleDateFormat sd =new SimpleDateFormat("yyyy-MM-dd");
        if (birthday!=null && !"".equals(birthday)){
            this.birthday = sd.parse(birthday);
        }
        this.city = city;
        this.job = job;
    }
    public User(Long userid, String nickname, String birthday, String city, int gender) throws ParseException {
        this.userid = userid;
        this.nickname = nickname;
        this.gender = gender;
        if (birthday!=null && !"".equals(birthday)){
            SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
            this.birthday = sdf.parse(birthday);
        }
        this.city = city;
    }

    public User(Integer id, Long userid, String username, String password, String nickname, Long phone, int userStatus, Date createTime, String icon, int gender, Date birthday, String city, String job, Integer isDelete) {
        this.id = id;
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.phone = phone;
        this.userStatus = userStatus;
        this.createTime = createTime;
        this.icon = icon;
        this.gender = gender;
        this.birthday = birthday;
        this.city = city;
        this.job = job;
        this.isDelete = isDelete;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", phone=" + phone +
                ", userStatus=" + userStatus +
                ", createTime=" + createTime +
                ", icon='" + icon + '\'' +
                ", gender=" + gender +
                ", birthday=" + birthday +
                ", city='" + city + '\'' +
                ", job='" + job + '\'' +
                ", securityQuestion='" + securityQuestion + '\'' +
                ", answer='" + answer + '\'' +
                ", isDelete=" + isDelete +
                '}';
    }

    public String getSecurityQuestion() {
        return securityQuestion;
    }

    public void setSecurityQuestion(String securityQuestion) {
        this.securityQuestion = securityQuestion;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }
}
