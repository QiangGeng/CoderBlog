package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.dao.FollowMapper;
import com.coder.qiang.blog.modal.Follow;
import com.coder.qiang.blog.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Service
public class FollowServiceImpl extends BaseServiceImpl<Follow> implements FollowService {
    @Autowired
    private FollowMapper mapper;

    @Override
    public BaseMapper<Follow> getMapper() {
        return mapper;
    }
}
