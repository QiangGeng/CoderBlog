package com.coder.qiang.blog.controller.admin;

import com.coder.qiang.blog.controller.BaseController;
import com.coder.qiang.blog.modal.Topic;
import com.coder.qiang.blog.service.TopicService;
import com.coder.qiang.common.data.PageRequest;
import com.coder.qiang.common.data.PageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by CoderQiang on 2017/4/21.
 */
@Controller
@RequestMapping("/admin/api/topic/")
public class TopicApiController extends BaseController {

    @Autowired
    private TopicService topicService;

    @RequestMapping(value = "list",method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Topic> getTopicList(Topic topic, PageRequest pageRequest)
    {
        PageResponse<Topic> result=topicService.selectPageList(topic,pageRequest);
        return result;
    }
}
