package cn.fungus.bean;

import cn.fungus.domain.User;
import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
    private Long id;
    private String uid;
    private String messageText;
    private Date messageDate;
    private String lr;
    private User user;
//    private int fromId;
//    private String fromName;
//    private int toId;


    public Message() {
    }

    public Message(Long id, String uid, String messageText, User user) {
        this.id = id;
        this.uid = uid;
        this.messageText = messageText;
        this.user = user;
    }

    public Message(Long id, String messageText, User user) {
        this.id = id;
        this.messageText = messageText;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getMessageText() {
        return messageText;
    }

    public void setMessageText(String messageText) {
        this.messageText = messageText;
    }

    public Date getMessageDate() {
        return messageDate;
    }

    public void setMessageDate(Date messageDate) {
        this.messageDate = messageDate;
    }

    public String getLr() {
        return lr;
    }

    public void setLr(String lr) {
        this.lr = lr;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
