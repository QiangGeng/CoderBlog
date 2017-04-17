package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.dao.TopicStatMapper;
import com.coder.qiang.blog.modal.TopicStat;
import com.coder.qiang.blog.service.TopicStatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Service
public class TopicStatServiceImpl extends BaseServiceImpl<TopicStat> implements TopicStatService {
    @Autowired
    private TopicStatMapper mapper;

    @Override
    public BaseMapper<TopicStat> getMapper() {
        return mapper;
    }
}
