package com.odev.entities;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;
import com.odev.*;

public class Forum {
    private UUID id;
    private UUID userId;
    private Timestamp createTime;
    private String title;
    private String comment;

    private String userName;
    private String userPicture;

    // id
    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }
    
    // userId
    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }
    
    // create time
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    
    // title
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    // comment
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    // userName
    public String getUserName() {
        return userName;
    }

    public void setUserName(UUID userId) throws ClassNotFoundException, SQLException {
    	UsersAppService userAppService = new UsersAppService();
    	
        this.userName =  userAppService.getUser(userId).getName();
    }

    // user Picture
    public String getUserPicture() {
        return userPicture;
    }

    public void setUserPicture(UUID userId) throws ClassNotFoundException, SQLException {
    	UsersAppService userAppService = new UsersAppService();
    	
        this.userPicture =  userAppService.getUser(userId).getPicture();
    }
}
