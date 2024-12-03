package com.odev.entities;

import java.util.List;

public class CommentListDto {
    private List<Comment> comments;
    private int rowCount;
    
    public CommentListDto(List<Comment> comments, int rowCount) {
    	setComments(comments);
    	setRowCount(rowCount);
    }
    
    // Comments
    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
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
