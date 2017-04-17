package com.coder.qiang.blog.dao;

import com.coder.qiang.blog.modal.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by CoderQiang on 2017/4/12.
 */
public interface UserMapper extends BaseMapper<User> {
    /**
     * 根据用户名查询
     *
     * @param loginName
     * @return
     */
    User selectByLoginName(@Param("loginName") String loginName);
}
