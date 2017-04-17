package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.dao.UserInfoMapper;
import com.coder.qiang.blog.modal.UserInfo;
import com.coder.qiang.blog.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Service
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfo> implements UserInfoService {
    @Autowired
    private UserInfoMapper mapper;

    @Override
    public BaseMapper<UserInfo> getMapper() {
        return mapper;
    }
}
