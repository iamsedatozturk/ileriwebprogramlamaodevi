package com.odev.entities;

import java.util.List;

public class Users_CommentsListDto {
    private List<Users_Comments> comments;
    private int rowCount;
    
    public Users_CommentsListDto(List<Users_Comments> comments, int rowCount) {
    	setComments(comments);
    	setRowCount(rowCount);
    }
    
    // Comments
    public List<Users_Comments> getComments() {
        return comments;
    }

    public void setComments(List<Users_Comments> comments) {
        this.comments = comments;
    }

    // RowCount
    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }
}
