package com.odev.entities;

import java.util.List;

public class Users_ListDto {
    private List<Users> users;
    private int rowCount;
    
    public Users_ListDto(List<Users> users, int rowCount) {
    	setUsers(users);
    	setRowCount(rowCount);
    }
    
    // Users
    public List<Users> getUsers() {
        return users;
    }

    public void setUsers(List<Users> users) {
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
