package com.odev.entities;

import java.util.List;
import java.util.UUID;

public class PagedResultRequestDto {
    private List<User> users;
    private int rowCount;
    
    public PagedResultRequestDto(List<User> users, int rowCount) {
    	setUsers(users);
    	setRowCount(rowCount);
    }
    
    // Users
    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    // RowCount
    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }
}
