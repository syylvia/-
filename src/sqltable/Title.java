package sqltable;

import org.w3c.dom.Text;

import java.sql.Date;
import java.util.Arrays;

public class Title {
    private int number;
    private String name;
    private char[] content;
    private String vedioLink;
    private Date date;
    private String digest;
    char lb;

    public String getPhotoLink() {
        return photoLink;
    }

    public void setPhotoLink(String photoLink) {
        this.photoLink = photoLink;
    }

    private String photoLink;



    public Title() {
    }
    public Title(int number, String name, char[] content, String vedioLink,Date date,String digest,char lb,String photoLink){
        this.number = number;
        this.name = name;
        this.content = content;
        this.vedioLink = vedioLink;
        this.date=date;
        this.digest=digest;
        this.lb=lb;
        this.photoLink=photoLink;

    }
    @Override
    public String toString() {
        return "Title{" +
                "number=" + number +
                ", name='" + name + '\'' +
                ", content=" + Arrays.toString(content) +
                ", link='" + vedioLink + '\'' +
                ", date=" + date +
                ", digest='" + digest + '\'' +
                ", lb=" + lb +
                '}';
    }
    public String getDigest(){
        return digest;
    }
    public void setDigest(String digest){
        this.digest=digest;
    }
    public Date getDate(){
        return date;
    }
    public void setDate(Date date){
        this.date=date;
    }

    public String getVediolink() {
        return vedioLink;
    }
    public void setVediolink(String link) {
        this.vedioLink = link;
    }
    public int getNumber() {
        return number;
    }
    public char getLb() {
        return lb;
    }

    public void setLb(String lb) {
        this.lb = lb.charAt(0);
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

    public char[] getContent() {
        return content;
    }

    public void setContent(char[] content) {
        this.content = content;
    }
}
