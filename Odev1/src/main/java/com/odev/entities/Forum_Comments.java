package com.odev.entities;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;
import com.odev.*;

public class Forum_Comments {
    private UUID id;
    private UUID forumId;
    private Timestamp createTime;
    private UUID creatorId;
    private String message;

    private String creatorName;
    private String creatorPicture;

    // id
    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }
    
    // forumId
    public UUID getForumId() {
        return forumId;
    }

    public void setForumId(UUID forumId) {
        this.forumId = forumId;
    }
    
    // create time
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    
    // creatorId
    public UUID getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(UUID creatorId) {
        this.creatorId = creatorId;
    }
    
    // message
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    
    // creator Name
    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(UUID creatorId) throws ClassNotFoundException, SQLException {
    	UsersAppService userAppService = new UsersAppService();
    	
        this.creatorName =  userAppService.getUser(creatorId).getName();
    }

 // creator Picture
    public String getUserPicture() {
        return creatorPicture;
    }

    public void setUserPicture(UUID creatorId) throws ClassNotFoundException, SQLException {
    	UsersAppService userAppService = new UsersAppService();
    	
        this.creatorPicture =  userAppService.getUser(creatorId).getPicture();
    }
}
