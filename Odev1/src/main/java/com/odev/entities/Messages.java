package com.odev.entities;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;
import com.odev.*;

public class Messages {
    private UUID id;
    private Timestamp createTime;
    private UUID commentId;
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
    
    // create time
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    
    // commentId
    public UUID getCommentId() {
        return commentId;
    }

    public void setCommentId(UUID commentId) {
        this.commentId = commentId;
    }
    
    // creatorId
    public UUID getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(UUID creatorId) {
        this.creatorId = creatorId;
    }

    // comment
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    // creatorName
    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(UUID creatorId) throws ClassNotFoundException, SQLException {
    	UserAppService userAppService = new UserAppService();
    	
        this.creatorName =  userAppService.getUser(creatorId).getName();
    }

 // creator Picture
    public String getCreatorPicture() {
        return creatorPicture;
    }

    public void setCreatorPicture(UUID creatorId) throws ClassNotFoundException, SQLException {
    	UserAppService userAppService = new UserAppService();
    	
        this.creatorPicture =  userAppService.getUser(creatorId).getPicture();
    }
}
