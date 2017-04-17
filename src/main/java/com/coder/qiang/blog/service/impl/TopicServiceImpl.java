package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.dao.TopicMapper;
import com.coder.qiang.blog.modal.Topic;
import com.coder.qiang.blog.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Service
public class TopicServiceImpl extends BaseServiceImpl<Topic> implements TopicService {
    @Autowired
    private TopicMapper mapper;

    @Override
    public BaseMapper<Topic> getMapper() {
        return mapper;
    }
}
