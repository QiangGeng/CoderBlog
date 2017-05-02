package com.coder.qiang.blog.controller.admin;

import com.coder.qiang.blog.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CoderQiang on 2017/4/27.
 */
@Controller
@RequestMapping("/admin/")
public class AdminController extends BaseController {
    /**
     * 显示后台界面
     * @return
     */
    @RequestMapping("index.html")
    public String showLogin()
    {
        return ADMIN_PREFIX+"index";
    }

    /**
     * 显示个人中心
     * @return
     */
    @RequestMapping("profile.html")
    public String showProfile()
    {
        return ADMIN_PREFIX+"profile";
    }

}
