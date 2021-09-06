package sqltable;

import java.sql.Date;

public class Comment {
    private int id;
    private String titleType;
    private String titleName;
    private String username;
    private char[] content;
    private Date date;

    public Comment() {
    }

    public Comment(int id, String titleType, String titleName, String username, char[] content, Date date) {
        this.id = id;
        this.titleType = titleType;
        this.titleName = titleName;
        this.username = username;
        this.content = content;
        this.date = date;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitleType() {
        return titleType;
    }

    public void setTitleType(String titleType) {
        this.titleType = titleType;
    }

    public String getTitleName() {
        return titleName;
    }

    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public char[] getContent() {
        return content;
    }

    public void setContent(char[] content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }



}
