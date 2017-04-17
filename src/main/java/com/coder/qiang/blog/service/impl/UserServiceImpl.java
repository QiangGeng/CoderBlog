package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.dao.UserMapper;
import com.coder.qiang.blog.modal.User;
import com.coder.qiang.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    private UserMapper mapper;

    @Override
    public BaseMapper<User> getMapper() {
        return mapper;
    }

    @Override
    public User selectByLoginName(String loginName) {
        return null;
    }
}
