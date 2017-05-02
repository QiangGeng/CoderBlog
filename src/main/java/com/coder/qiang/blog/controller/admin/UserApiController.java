package com.coder.qiang.blog.controller.admin;

import com.coder.qiang.blog.controller.BaseController;
import com.coder.qiang.blog.modal.User;
import com.coder.qiang.blog.modal.UserInfo;
import com.coder.qiang.blog.service.UserInfoService;
import com.coder.qiang.blog.service.UserService;
import com.coder.qiang.common.data.JsonResult;
import com.coder.qiang.common.utils.FileUtil;
import com.coder.qiang.common.utils.MD5;
import com.coder.qiang.common.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

/**
 * Created by CoderQiang on 2017/5/2.
 */
@Controller
@RequestMapping("/admin/api/user/")
public class UserApiController extends BaseController {

    @Value("${server.media.url}")
    private String BASE_URL;
    @Autowired
    private UserService userService;

    @Autowired
    private UserInfoService userInfoService;

    /**
     * 更新用户信息
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateUser(HttpServletRequest request, UserInfo user) {

        JsonResult result = new JsonResult();
        User me = currentUser();
        if (userInfoService.updateByPrimaryKeySelective(user)) {
            if (ObjectUtils.isNotNull(user.getName()))
                me.setName(user.getName());
            if (ObjectUtils.isNotNull(user.getSex()))
                me.setSex(user.getSex());
            if (ObjectUtils.isNotNull(user.getBirthday()))
                me.setBirthday(user.getBirthday());
            if (ObjectUtils.isNotNull(user.getEmail()))
                me.setEmail(user.getEmail());
            if (ObjectUtils.isNotNull(user.getPhone()))
                me.setPhone(user.getPhone());
            if (ObjectUtils.isNotNull(user.getIntroduce()))
                me.setIntroduce(user.getIntroduce());
            setCurrentUser(request, me);
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 更新头像
     *
     * @param avatar
     * @return
     */
    @RequestMapping(value = "updateAvatar")
    @ResponseBody
    public JsonResult updateAvatar(HttpServletRequest request, MultipartFile avatar) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult saveResult = util.saveFile(request, avatar, util.SAVEURL_AVATAR, false);
        User me = currentUser();
        if (ObjectUtils.isNotNull(me)) {
            me.setAvatar(saveResult.getData().toString());
            if (userService.updateByPrimaryKeySelective(me)) {
                setCurrentUser(request, me);
                result.markSuccess("更新头像成功", BASE_URL + saveResult.getData().toString());
            } else {
                result.markError("更新头像失败");
            }
        } else {
            result.markError("更新头像失败");
        }
        return result;
    }


    /**
     * 更新密码
     *
     * @param id
     * @param currentPassword
     * @param newPassword
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "updateUserPwd", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateUserPwd(Integer id, String currentPassword, String newPassword) throws ParseException {
        if (id == null) {
            return null;
        }
        JsonResult result = new JsonResult();
        User user = new User();
        user.setId(id);
        User oldUser = userService.selectByPrimaryKey(id);
        if (oldUser != null && oldUser.getPassword().equals(MD5.MD5Encode(currentPassword))) {
            user.setPassword(MD5.MD5Encode(newPassword));
            if (userService.updateByPrimaryKeySelective(user)) {
                result.markSuccess("密码修改成功", null);
            } else {
                result.markError("密码修改失败");
            }
        } else {
            result.markError("当前密码错误");
        }
        return result;
    }


}
