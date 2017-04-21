package com.coder.qiang.blog.controller.admin;

import com.coder.qiang.blog.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CoderQiang on 2017/4/21.
 */
@Controller
@RequestMapping("/admin/topic")
public class TopicController extends BaseController{

    @RequestMapping("topic-list.html")
    public String showIndex(){
        return ADMIN_PREFIX+"topic-list";
    }
}
