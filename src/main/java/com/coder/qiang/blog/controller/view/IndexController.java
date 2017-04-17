package com.coder.qiang.blog.controller.view;

import com.coder.qiang.blog.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Controller
@RequestMapping("/view/")
public class IndexController extends BaseController{

    @RequestMapping("index.html")
    public String showIndex(){
        return VIEW_PREFIX+"index";
    }

}
