package com.coder.qiang.blog.controller;

import com.coder.qiang.blog.modal.User;
import com.coder.qiang.common.config.Keys;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Gong on 2016/4/7.
 */
public class BaseController {
    public Logger logger = LoggerFactory.getLogger(BaseController.class);
    public final String ADMIN_PREFIX = "/admin/";
    public final String VIEW_PREFIX = "/view/";

    public final String UNAUTH_PAGE = "/unauth";

    protected User currentUser(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (User) request.getSession().getAttribute(Keys.LOGIN_USER);
    }


}
