package com.odev.entities;

import java.util.List;

public class Forum_ListDto {
    private List<Forum> forums;
    private int rowCount;
    
    public Forum_ListDto(List<Forum> forums, int rowCount) {
    	setForums(forums);
    	setRowCount(rowCount);
    }
    
    // Forums
    public List<Forum> getForums() {
        return forums;
    }

    public void setForums(List<Forum> forums) {
        this.forums = forums;
    }

    // RowCount
    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }
}
