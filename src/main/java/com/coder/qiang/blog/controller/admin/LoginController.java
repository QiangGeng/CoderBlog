package com.coder.qiang.blog.controller.admin;

import com.coder.qiang.blog.controller.BaseController;
import com.coder.qiang.blog.modal.User;
import com.coder.qiang.common.config.Keys;
import com.coder.qiang.common.utils.MD5;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by CoderQiang on 2017/4/27.
 */
@Controller
@RequestMapping("/admin/")
public class LoginController extends BaseController {


    /**
     * 显示登陆界面
     *
     * @return
     */
    @RequestMapping("login.html")
    public String showLogin() {
        return ADMIN_PREFIX + "login";
    }

    @RequestMapping("login")
    public String login(User user, String codevalidate, HttpServletRequest request, HttpSession session) {
        //登录失败返回登录页面
        String resultPageURL = ADMIN_PREFIX + "login";
        if (null == user || StringUtils.isEmpty(user.getLoginName()) || StringUtils.isEmpty(user.getPassword())) {
            return resultPageURL;
        }
        String code = (String) session.getAttribute("codeValidate");
        if (codevalidate == null || !codevalidate.equalsIgnoreCase(code)) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "验证码错误");
            return resultPageURL;
        }
        user.setPassword(MD5.MD5Encode(user.getPassword()));
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword());
        token.setRememberMe(true);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            currentUser.login(token);
        } catch (UnknownAccountException uae) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名不存在");
        } catch (IncorrectCredentialsException ice) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "密码不正确");
        }
        // 验证是否登录成功
        if (currentUser.isAuthenticated()) {
            return "redirect:/admin/index.html";
        } else {
            token.clear();
            return resultPageURL;
        }
    }
}
