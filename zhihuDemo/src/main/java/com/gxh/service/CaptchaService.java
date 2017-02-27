package com.gxh.service;

import com.gxh.utils.CaptchaUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class CaptchaService {

    private static final Logger logger = LoggerFactory.getLogger(CaptchaService.class);
    public static final int CAPTCHA_WIDTH = 120;
    public static final int CAPTCHA_HEIGHT = 30;

    @Autowired
    private RedisService<String> redisService;

    public String createCaptcha(){
        String captcha = CaptchaUtil.generateCaptchaCode(4);
        String captchaKey = UUID.randomUUID().toString().replace("-", "");               //使用uuid作为captchaKey
        redisService.setCacheObject(captchaKey, captcha).expire(3, TimeUnit.MINUTES);       //存储到redis并设置过期时间为3分钟
        return captchaKey;
    }

    public String getCaptcha(String captchaKey){
        String captcha = redisService.getCacheObject(captchaKey);
        return captcha;
    }

    public void sendCaptchaJPG(String captcha, OutputStream os){
        try {
            CaptchaUtil.outputImage(CAPTCHA_WIDTH, CAPTCHA_HEIGHT, os, captcha);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
    }


}
