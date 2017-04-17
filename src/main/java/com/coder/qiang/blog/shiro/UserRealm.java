package com.coder.qiang.blog.shiro;

import com.coder.qiang.blog.modal.User;
import com.coder.qiang.blog.service.UserService;
import com.coder.qiang.common.config.Keys;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;


public class UserRealm extends AuthorizingRealm {

    static Logger logger = LoggerFactory.getLogger(UserRealm.class);

    @Autowired
    private UserService userService;

    /**
     * 为当前登录的Subject授予角色和权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        logger.info("doGetAuthorizationInfo...");
        //获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
        String currentUsername = (String) super.getAvailablePrincipal(principals);
        List<String> roleList = new ArrayList<>();
        List<String> permissionList = new ArrayList<>();
        //从数据库中获取当前登录用户的详细信息
        //为当前用户设置角色和权限
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        if (currentUsername != null) {
            simpleAuthorInfo.addRoles(roleList);
            simpleAuthorInfo.addStringPermissions(permissionList);
            return simpleAuthorInfo;
        }
        return null;
    }


    /**
     * 验证当前登录的Subject
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {

        logger.info("doGetAuthenticationInfo...");

        //获取基于用户名和密码的令牌
        //实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
        //两个token的引用都是一样的
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.selectByLoginName(token.getUsername());
        if (null != user) {
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getLoginName(), user.getPassword(), this.getName());
            this.setSession(user);
            return authcInfo;
        } else {
            return null;
        }
    }


    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     */
    private void setSession(Object value) {
        Subject currentUser = SecurityUtils.getSubject();
        if (null != currentUser) {
            Session session = currentUser.getSession();
            session.setTimeout(2 * 60 * 60 * 1000);
            logger.info("Session超时时间为[" + session.getTimeout() + "]毫秒");
            if (null != session) {
                session.setAttribute(Keys.LOGIN_USER, value);
            }
        }
    }

}
