package com.springmvc.domain;

public class MemberVO {

    private String id;
    private String password;

    // getter, setter
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    

    // 생성자
    public MemberVO() {

    }

    // to String
    @Override
    public String toString() {
        return "MemberVO [id=" + id + ", password=" + password + "]";
    }

} 