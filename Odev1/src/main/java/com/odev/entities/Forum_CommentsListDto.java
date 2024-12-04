package com.odev.entities;

import java.util.List;

public class Forum_CommentsListDto {
    private List<Forum_Comments> forumComments;
    private int rowCount;
    
    public Forum_CommentsListDto(List<Forum_Comments> forumComments, int rowCount) {
    	setForum_Comments(forumComments);
    	setRowCount(rowCount);
    }
    
    // Forums
    public List<Forum_Comments> getForum_Comments() {
        return forumComments;
    }

    public void setForum_Comments(List<Forum_Comments> forumComments) {
        this.forumComments = forumComments;
    }

    // RowCount
    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }
}
