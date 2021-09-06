package sqltable;

public class SystemNum {
    private int story;
    private int user;
    private int scene;
    private int inquire;
    private int bk;
    private int comment;
    private int feedback;
    private int hero;

    public SystemNum(int story, int user, int scene, int inquire, int bk, int comment, int feedback, int hero) {
        this.story = story;
        this.user = user;
        this.scene = scene;
        this.inquire = inquire;
        this.bk = bk;
        this.comment = comment;
        this.feedback = feedback;
        this.hero = hero;
    }


    public SystemNum() {
    }

    public int getHero() {
        return hero;
    }

    public void setHero(int hero) {
        this.hero = hero;
    }

    public int getStory() {
        return story;
    }

    public void setStory(int story) {
        this.story = story;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getScene() {
        return scene;
    }

    public void setScene(int scene) {
        this.scene = scene;
    }

    public int getInquire() {
        return inquire;
    }

    public void setInquire(int inquire) {
        this.inquire = inquire;
    }

    public int getBk() {
        return bk;
    }

    public void setBk(int bk) {
        this.bk = bk;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public int getFeedback() {
        return feedback;
    }

    public void setFeedback(int feedback) {
        this.feedback = feedback;
    }


}