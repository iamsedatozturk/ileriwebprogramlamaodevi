package com.odev.entities;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;
import com.odev.*;

public class Users_Comments {
    private UUID id;
    private Timestamp createTime;
    private UUID userId;
    private String type;
    private String media;
    private UUID creatorId;
    private String comment;

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
    
    // userId
    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }
    
    // type
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    // media
    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    // creatorId
    public UUID getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(UUID creatorId) {
        this.creatorId = creatorId;
    }

    // comment
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    // creatorName
    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(UUID creatorId) throws ClassNotFoundException, SQLException {
    	UsersAppService userAppService = new UsersAppService();
    	
        this.creatorName =  userAppService.getUser(creatorId).getName();
    }

 // creator Picture
    public String getCreatorPicture() {
        return creatorPicture;
    }

    public void setCreatorPicture(UUID creatorId) throws ClassNotFoundException, SQLException {
    	UsersAppService userAppService = new UsersAppService();
    	
        this.creatorPicture =  userAppService.getUser(creatorId).getPicture();
    }
}
