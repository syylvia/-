package sqltable;

import java.util.Arrays;

public class Hero {
    private int number;
    private String name;
    private String digest;
    private String content;

    @Override
    public String toString() {
        return "Hero{" +
                "number=" + number +
                ", name='" + name + '\'' +
                ", digest=" + digest +
                '}';
    }

    public Hero(){}
    public Hero(int number, String name, String digest,String content) {
        this.number = number;
        this.name = name;
        this.digest = digest;
        this.content=content;
    }
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

}
