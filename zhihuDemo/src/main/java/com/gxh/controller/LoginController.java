package com.gxh.controller;


import com.gxh.service.CaptchaService;
import com.gxh.service.UserService;
import com.gxh.utils.CaptchaUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import java.util.Map;

/**
 * Created by 10412 on 2016/7/2.
 */

@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    UserService userService;

    @Autowired
    CaptchaService captchaService;

    @RequestMapping(path = {"/register"}, method = {RequestMethod.POST})
    public String register(Model model, @RequestParam("username") String username,
             @RequestParam("password") String password,
             @RequestParam("phone") String phone,
             @RequestParam("captcha") String captcha,
             @CookieValue("captchaKey") String captchaKey,
             HttpServletRequest request,
             HttpServletResponse response) {
        try {
            Map<String, Object> map = userService.register(username, password, phone, captcha, captchaKey);
            if (map.containsKey("token")){
                Cookie cookie = new Cookie("token", map.get("token").toString());
                cookie.setPath("/");
                response.addCookie(cookie);
                 return "redirect:/";
            } else {
                model.addAttribute("msg", map.get("msg"));
                model.addAttribute("username",username);
                model.addAttribute("phone",phone);
                model.addAttribute("index",0);   //表示是注册
                return "reglogin";
            }

        } catch (Exception e) {
            logger.error("注册异常" + e.getMessage());
            model.addAttribute("msg", "服务器错误");
            return "reglogin";
        }
    }

    @RequestMapping(path = {"/login"}, method = {RequestMethod.POST})
    public String login(Model model, @RequestParam("account") String account,
                        @RequestParam("password") String password,
                        @RequestParam("captcha") String captcha,
                        @CookieValue("captchaKey") String captchaKey,
                        HttpServletResponse response) {
        try {
            Map<String, Object> map = userService.login(account, password,captcha,captchaKey);
            if (map.containsKey("token")) {
                Cookie cookie = new Cookie("token", map.get("token").toString());
                cookie.setPath("/");
                response.addCookie(cookie);
                return "redirect:/";
            } else {
                model.addAttribute("msg", map.get("msg"));
                model.addAttribute("account",account);
                model.addAttribute("index",1);   //表示是登录
                return "reglogin";
            }

        } catch (Exception e) {
            logger.error("登陆异常" + e.getMessage());
            model.addAttribute("msg", "服务器内部错误");
            model.addAttribute("account",account);
            model.addAttribute("index",1);   //表示是登录
            return "reglogin";
        }
    }

    @RequestMapping("/reglogin")
    public String reglogin(HttpServletResponse response){
        return "reglogin";
    }

    @RequestMapping(path = {"/logout"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String logout(@CookieValue("token") String token) {
        userService.logout(token);
        return "reglogin";
    }

    @RequestMapping("/getCaptcha")
    public void getCaptcha(HttpServletResponse response){
        try {
            String captchaKey = captchaService.createCaptcha();
            String captcha = captchaService.getCaptcha(captchaKey);
            Cookie cookie = new Cookie("captchaKey", captchaKey);
            response.addCookie(cookie);
            OutputStream os = response.getOutputStream();
            captchaService.sendCaptchaJPG(captcha, os);
        }catch (Exception e){
            e.printStackTrace();
            logger.error("获取验证码图片异常，" + e.getMessage());
        }
    }

}
