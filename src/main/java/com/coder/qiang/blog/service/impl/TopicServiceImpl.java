package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.dao.TopicMapper;
import com.coder.qiang.blog.modal.Topic;
import com.coder.qiang.blog.modal.TopicStat;
import com.coder.qiang.blog.service.TopicService;
import com.coder.qiang.blog.service.TopicStatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Service
public class TopicServiceImpl extends BaseServiceImpl<Topic> implements TopicService {
    @Autowired
    private TopicMapper mapper;
    @Autowired
    private TopicStatService topicStatService;

    @Override
    public BaseMapper<Topic> getMapper() {
        return mapper;
    }

    @Override
    public boolean insert(Topic record) {
        record.setComment(true);
        record.setCreateTime(new Date());
        if(super.insert(record))
        {
            TopicStat topicStat=new TopicStat();
            topicStat.setId(record.getId());
            return topicStatService.insert(topicStat);
        }
        return false;
    }
}
