package com.coder.qiang.blog.modal;

public class TopicStat {
    private Integer id;

    private Integer readCount;

    private Integer upVote;

    public TopicStat() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

    public Integer getUpVote() {
        return upVote;
    }

    public void setUpVote(Integer upVote) {
        this.upVote = upVote;
    }
}