package sqltable;

import java.util.Arrays;

public class Story {
    private int id;
    private String name;
    private String date;
    private char[]content;

    @Override
    public String toString() {
        return "Story{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", date='" + date + '\'' +
                ", content=" + Arrays.toString(content) +
                '}';
    }

    public Story(){
    }
    public Story(int id, String name, String date, char[] content) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public char[] getContent() {
        return content;
    }

    public void setContent(char[] content) {
        this.content = content;
    }


}
