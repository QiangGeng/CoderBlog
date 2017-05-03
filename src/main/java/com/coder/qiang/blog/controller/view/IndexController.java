package com.coder.qiang.blog.controller.view;

import com.coder.qiang.blog.controller.BaseController;
import com.coder.qiang.blog.modal.User;
import com.coder.qiang.blog.service.UserService;
import com.coder.qiang.common.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Controller
@RequestMapping("")
public class IndexController extends BaseController{
    @Autowired
    private UserService userService;

    @RequestMapping("index.html")
    public String showIndex(){
        return VIEW_PREFIX+"index";
    }


    /**
     * 展示用户的博客
     * @param name
     * @return
     */
    @RequestMapping("blog/{name}")
    public String showBlog(@PathVariable("name")String name, Model model)
    {
        User user=userService.selectByLoginName(name);
        if(ObjectUtils.isNotNull(user))
        {
            model.addAttribute("uid",user.getId());
        }
        return VIEW_PREFIX+"index";
    }

}
