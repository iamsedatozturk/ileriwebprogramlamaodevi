package com.odev.entities;

import java.util.List;
import java.util.UUID;

public class Users {
    private UUID id;
    private String email;
    private String name;
    private List<String> hobbies;
    private String city;
    private String password;
    private String linkName;
    private String address;
    private String phone;
    private String schoolName;
    private String business;
    private String webSite;
    private String facebookName;
    private String twitterName;
    private String role;
    private Integer gender;
    private String picture;
    
    // id
    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    // email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // hobies
    public List<String> getHobbies() {
        return hobbies;
    }

    public void setHobbies(List<String> hobbies) {
        this.hobbies = hobbies;
    }
    
    // city
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    // password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // linkName
    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }
    
    // address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
    	this.address = address;
    }
    
    // phone
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
    	this.phone = phone;
    }
    
    // webSite
    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
    	this.webSite = webSite;
    }
    
    // facebookName
    public String getFacebookName() {
        return facebookName;
    }

    public void setFacebookName(String facebookName) {
      	this.facebookName = facebookName;
    }    

    // twitterName
    public String getTwitterName() {
        return twitterName;
    }

    public void setTwitterName(String twitterName) {
      	this.twitterName = twitterName;
    }  
    
    // schoolName
    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
      	this.schoolName = schoolName;
    }  
    
    // business
    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
      	this.business = business;
    } 
    
    // role
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
 // gender
    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }
    
 // pictıre
    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
