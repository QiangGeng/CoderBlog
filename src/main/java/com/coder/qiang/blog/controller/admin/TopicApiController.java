package com.coder.qiang.blog.controller.admin;

import com.coder.qiang.blog.controller.BaseController;
import com.coder.qiang.blog.modal.Topic;
import com.coder.qiang.blog.service.TopicService;
import com.coder.qiang.common.data.JsonResult;
import com.coder.qiang.common.data.PageRequest;
import com.coder.qiang.common.data.PageResponse;
import com.coder.qiang.common.utils.ObjectUtils;
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

    /**
     * 获取文章列表
     *
     * @param topic
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Topic> getTopicList(Topic topic, PageRequest pageRequest) {
        PageResponse<Topic> result = topicService.selectPageList(topic, pageRequest);
        return result;
    }

    /**
     * 撰写博客
     *
     * @param topic
     * @return
     */
    @RequestMapping(value = "addOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addOrUpdateTopic(Topic topic) {
        JsonResult result = new JsonResult();
        if (ObjectUtils.isNull(topic.getTitle())) {
            result.markError("标题不能为空！");
        } else if (ObjectUtils.isNull(topic.getDecoration())) {
            result.markError("摘要不能为空！");
        } else if (ObjectUtils.isNull(topic.getContent())) {
            result.markError("正文不能为空！");
        } else {
            if (ObjectUtils.isNotNull(topic.getId())) {
                if (topicService.updateByPrimaryKeySelective(topic)) {
                    result.markSuccess("更新成功", null);
                } else {
                    result.markSuccess("更新失败", null);
                }
            } else {
                topic.setCreateId(currentUser().getId());
                if (topicService.insert(topic)) {
                    result.markSuccess("添加成功", null);
                } else {
                    result.markSuccess("添加失败", null);
                }
            }
        }
        return result;
    }

    /**
     * 更新博客
     *
     * @param topic
     * @return
     */
    @RequestMapping(value = "updateTopic", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateTopic(Topic topic)
    {
        JsonResult result = new JsonResult();
        if (ObjectUtils.isNotNull(topic.getId())) {
            if (topicService.updateByPrimaryKeySelective(topic)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markSuccess("更新失败", null);
            }
        }
        return result;
    }
}
