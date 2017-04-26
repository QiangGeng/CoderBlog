package com.coder.qiang.blog.controller;

import com.coder.qiang.common.data.JsonResult;
import com.coder.qiang.common.data.kindeditor.UploadResult;
import com.coder.qiang.common.utils.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 文件上传和下载controller
 * Created by CodingQiang on 2016/11/7.
 */
@Controller
@RequestMapping(value = {"/file"})
public class FileController extends BaseController {
    /**
     * 自定义目录结构
     */
        private static String DATEDIRECTORYPATTERN="yyMMdd";

    /**
     * 处理kindeditor图片上传
     * @param imgFile: 文件form名称
     * @param dir: 上传类型，分别为image、flash、media、file
     * @return
     */
    @RequestMapping(value = "/kindeditor/u")
    @ResponseBody
    public UploadResult uploadKindEditorFile(HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile, @RequestParam("dir") String dir) {
        UploadResult res = new UploadResult();
        FileUtil util = new FileUtil();
        JsonResult jsonResult = util.saveFile(request,imgFile,util.SAVEURL_ARTICLE_IMAGE,false);
        if(jsonResult.isSuccess()){
            res.markSuccess(jsonResult.getData().toString());
        }else{
            res.markError(jsonResult.getMessage());
        }
        return res;
    }




    /**
     * 文件下载(从上传路径下载)
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/download")
    public void downloadFile(HttpServletRequest request,
                             HttpServletResponse response, String filePath ) {
        try
        {
            /*filePath = URLDecoder.decode(filePath, "UTF-8");*/
            logger.info(filePath);
        /*
         * 限制只有upload和download文件夹里的文件可以下载
         */
            String fileAbsolutePath = request.getSession().getServletContext()
                    .getRealPath("/")+
                    "/" + filePath;
            FileUtil.downloadFile(request, response, fileAbsolutePath);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }



}
