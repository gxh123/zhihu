package com.gxh.authorization.interceptior;

import com.gxh.dao.UserDao;
import com.gxh.model.User;
import com.gxh.model.UserHolder;
import com.gxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * 自定义拦截器，判断此次请求是否有权限
 * Created by gxh on 2017/1/1.
 */
@Component
public class AuthorizationInterceptor extends HandlerInterceptorAdapter{

    @Autowired
    private UserService userService;

    @Autowired
    private UserHolder userHolder;

    @Autowired
    private UserDao userDao;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = null;
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("token")) {
                    token = cookie.getValue();
                    break;
                }
            }
        }

        if (token != null) {
            if (userService.checkToken(token)) {
                //如果token验证成功，将token对应的用户存在userHolder中，便于之后使用
                User user = userDao.selectById(userService.getUserId(token));
                userHolder.setUser(user);
                return true;
            }
        }
        //没有tokenKey或者通过tokenKey获取的tokenModel不对，就返回登录/注册界面
        response.sendRedirect(request.getContextPath() + "/reglogin");
        return false;
    }



}
