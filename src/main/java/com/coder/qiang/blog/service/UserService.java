package com.coder.qiang.blog.service;

import com.coder.qiang.blog.modal.User;

/**
 * Created by CoderQiang on 2017/4/13.
 */
public interface UserService extends BaseService<User> {
    /**
     * 根据用户名查询
     *
     * @param loginName
     * @return
     */
    User selectByLoginName(String loginName);
}
