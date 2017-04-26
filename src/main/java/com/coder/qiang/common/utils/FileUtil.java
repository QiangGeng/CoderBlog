package com.coder.qiang.common.utils;

import com.coder.qiang.common.data.JsonResult;
import net.coobird.thumbnailator.Thumbnails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Gong on 2016/5/25.
 */
public class FileUtil {
    Logger logger = LoggerFactory.getLogger(FileUtil.class);

    private String[] imageType = {".png", ".jpg", "jpeg", ".gif"};
    private String[] videoType = {".mp4", ".avi", ".3gp", ".rmvb", "wav", "mpg", "vob", "mov", "flv", "swf"};

    public String SAVEURL_AVATAR = "/file/img/avatar/";
    public String SAVEURL_ARTICLE_IMAGE = "/file/img/article/";
    public String SAVEURL_MODULEMES_IMAGE = "/file/img/moduleMes/";

    /**
     * @param request 文件路径
     * @param file    文件
     * @param saveUrl url路径
     * @return
     */
    public JsonResult saveFile(HttpServletRequest request, MultipartFile file, String saveUrl, boolean createThumbnail) {

        String savePath = getPhysicalPath(request);

        JsonResult res = new JsonResult();
        if (!file.isEmpty()) {
            String originalName = file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString().replace("-", "");
            String fileName = uuid + originalName.substring(originalName.lastIndexOf("."));
            String dateDir = new SimpleDateFormat("yyMMdd").format(new Date());
            File fileDir = new File(savePath + saveUrl + dateDir);
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }
            String filePath = savePath + saveUrl + dateDir + File.separator + fileName;
            String thumbnailsPath = savePath + saveUrl + dateDir + File.separator + uuid + "_200_300" + originalName.substring(originalName.lastIndexOf("."));
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
                stream.write(bytes);
                stream.close();
                res.markSuccess("保存成功", saveUrl + String.format("%s/%s", dateDir, fileName));
                //生成缩略图
                if (createThumbnail) {
                    try {
                        createThumbnails(filePath, 200, 300, thumbnailsPath);
                    } catch (Exception e) {
                        //生成失败，不是图片
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                logger.error("保存过程出现异常", e);
                res.markError("保存过程出现异常");
            }
        } else {
            res.markError("文件内容为空");
        }
        return res;
    }


    public JsonResult saveFile(HttpServletRequest request, MultipartFile file, String saveUrl, boolean createThumbnail, Integer thumbnailWidth, Integer thumbnailHeight) {

        String savePath = getPhysicalPath(request);

        JsonResult res = new JsonResult();
        if (!file.isEmpty()) {
            String originalName = file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString().replace("-", "");
            String fileName = uuid + originalName.substring(originalName.lastIndexOf("."));
            String dateDir = new SimpleDateFormat("yyMMdd").format(new Date());
            File fileDir = new File(savePath + saveUrl + dateDir);
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }
            String filePath = savePath + saveUrl + dateDir + File.separator + fileName;
            String thumbnailsPath = savePath + saveUrl + dateDir + File.separator + uuid + "_"+thumbnailWidth+"_"+thumbnailHeight+ originalName.substring(originalName.lastIndexOf("."));
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
                stream.write(bytes);
                stream.close();
                res.markSuccess("保存成功", saveUrl + String.format("%s/%s", dateDir, fileName));
                //生成缩略图
                if (createThumbnail) {
                    try {
                        createThumbnails(filePath, thumbnailWidth, thumbnailHeight, thumbnailsPath);
                    } catch (Exception e) {
                        //生成失败，不是图片
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                logger.error("保存过程出现异常", e);
                res.markError("保存过程出现异常");
            }
        } else {
            res.markError("文件内容为空");
        }
        return res;
    }

    public boolean isImage(String fileName) {
        if (fileName != null) {
            String fileAffix = fileName.substring(fileName.lastIndexOf("."));
            if (Arrays.asList(imageType).contains(fileAffix)) {
                return true;
            }

        }
        return false;
    }

    public boolean isVideo(String fileName) {
        if (fileName != null) {
            String fileAffix = fileName.substring(fileName.lastIndexOf("."));
            if (Arrays.asList(videoType).contains(fileAffix)) {
                return true;
            }

        }
        return false;
    }

    private String getPhysicalPath(HttpServletRequest request) {
        return request.getSession().getServletContext().getRealPath("");
    }

    /**
     * 下载文件时指定下载名
     *
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @param filePath 文件全路径
     * @param fileName 指定客户端下载时显示的文件名
     * @throws IOException
     */
    public static void downloadFile(HttpServletRequest request,
                                    HttpServletResponse response, String filePath, String fileName)
            throws IOException {
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;

        bis = new BufferedInputStream(new FileInputStream(filePath));
        bos = new BufferedOutputStream(response.getOutputStream());

        long fileLength = new File(filePath).length();

        response.setCharacterEncoding("UTF-8");
        response.setContentType("multipart/form-data");
    /*
     * 解决各浏览器的中文乱码问题
     */
        String userAgent = request.getHeader("User-Agent");
        byte[] bytes = userAgent.contains("MSIE") ? fileName.getBytes()
                : fileName.getBytes("UTF-8"); // fileName.getBytes("UTF-8")处理safari的乱码问题
        fileName = new String(bytes, "ISO-8859-1"); // 各浏览器基本都支持ISO编码
        response.setHeader("Content-disposition",
                String.format("attachment; filename=\"%s\"", fileName));

        response.setHeader("Content-Length", String.valueOf(fileLength));
        byte[] buff = new byte[2048];
        int bytesRead;
        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
            bos.write(buff, 0, bytesRead);
        }
        bis.close();
        bos.close();

    }

    /**
     * 下载文件时不指定下载文件名称
     *
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @param filePath 文件全路径
     * @throws IOException
     */
    public static void downloadFile(HttpServletRequest request,
                                    HttpServletResponse response, String filePath) throws IOException {
        File file = new File(filePath);
        downloadFile(request, response, filePath, file.getName());
    }


    /**
     * 生成缩略图
     *
     * @param imagePath      原图地址
     * @param width
     * @param height
     * @param thumbnailsPath 保存地址
     * @throws Exception
     */
    public static void createThumbnails(String imagePath, Integer width, Integer height, String thumbnailsPath) throws Exception {
        Thumbnails.of(imagePath)
                .size(width, height)
                .toFile(new File(thumbnailsPath));
    }


    //


}

