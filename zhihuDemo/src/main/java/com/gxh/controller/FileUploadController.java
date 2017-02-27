package com.gxh.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileUploadController {

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public void uploadFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //String fileName = (String)request.getAttribute("filename");
        MultipartHttpServletRequest multipartRequest =
                (MultipartHttpServletRequest) request;
        Iterator<String> fileNames = multipartRequest.getFileNames();
        MultipartFile multipartFile = multipartRequest.getFile(fileNames.next());
        //获得文件原始名称
        String name = multipartFile.getOriginalFilename();
        // 图片存放的真实路径
        String realPath = request.getSession().getServletContext().getRealPath("/uploadFiles") + "/" + name;
        saveFile(realPath, multipartFile.getBytes());
        // 返回图片的URL地址
        response.getWriter().write(request.getContextPath() + "/uploadFiles/" + name);
        return ;
    }

    //保存文件的方法
    public void saveFile(String filePath, byte[] content) throws IOException {
        BufferedOutputStream bos = null;
        try {
            File file = new File(filePath);
            //判断文件路径是否存在
            if (!file.getParentFile().exists()) {
                //文件路径不存在时，创建保存文件所需要的路径
                file.getParentFile().mkdirs();
            }
            //创建文件（这是个空文件，用来写入上传过来的文件的内容）
            file.createNewFile();
            bos = new BufferedOutputStream(new FileOutputStream(file));
            bos.write(content);
        } catch (FileNotFoundException e) {
            throw new FileNotFoundException("文件不存在");
        } finally {
            if (null != bos) {
                bos.close();
            }
        }
    }

}