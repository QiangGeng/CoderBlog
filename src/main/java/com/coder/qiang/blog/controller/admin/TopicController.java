package com.coder.qiang.blog.controller.admin;

import com.coder.qiang.blog.controller.BaseController;
import com.coder.qiang.blog.modal.Topic;
import com.coder.qiang.blog.service.TopicService;
import com.coder.qiang.common.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CoderQiang on 2017/4/21.
 */
@Controller
@RequestMapping("/admin/topic/")
public class TopicController extends BaseController {
    @Autowired
    private TopicService topicService;

    /**
     * 文章列表
     *
     * @return
     */
    @RequestMapping("topic-list.html")
    public String showList() {
        return ADMIN_PREFIX + "topic-list";
    }

    /**
     * 添加文章
     *
     * @return
     */
    @RequestMapping("topic-add.html")
    public String showAdd() {
        return ADMIN_PREFIX + "topic-add";
    }

    /**
     * 添加文章
     *
     * @return
     */
    @RequestMapping("topic-info.html/{id}")
    public String showInfo(@PathVariable("id") Integer id, Model model) {
        Topic topic = topicService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(topic))
            model.addAttribute("topic", topic);
        return ADMIN_PREFIX + "topic-add";
    }
}
