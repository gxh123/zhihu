package com.gxh.service;

import com.gxh.model.UserHolder;
import com.gxh.mq.ObjectType;
import com.gxh.search.UserRepository;
import com.gxh.utils.MD5Util;
import com.gxh.model.User;
import com.gxh.dao.UserDao;
//import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.TimeUnit;

@Service
public class UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserDao userDAO;

    @Autowired
    private RedisService<Long> redisService;

    @Autowired
    FollowService followService;

    @Autowired
    UserHolder userHolder;


    @Autowired
    private UserRepository repository;

    public Map<String, Object> register(String username, String password, String phone, String captcha, String captchaKey) {
        Map<String, Object> map = new HashMap<String, Object>();

        if (!captcha.equalsIgnoreCase(redisService.getCacheObject(captchaKey))) {
            map.put("msg", "验证码错误");
            return map;
        }
        redisService.delete(captchaKey);

        User user = userDAO.selectByName(username);
        if (user != null) {
            map.put("msg", "用户名已经被注册");
            return map;
        }

        user = userDAO.selectByPhone(phone);
        if (user != null) {
            map.put("msg", "电话已经被注册");
            return map;
        }

        // 创建用户
        user = new User();
        user.setName(username);
        user.setSalt(UUID.randomUUID().toString().substring(0, 5));
        String head = String.format("http://images.nowcoder.com/head/%dt.png", new Random().nextInt(1000));
        user.setAvatar(head);
        user.setPassword(MD5Util.MD5(password + user.getSalt()));
        user.setPhone(phone);
        userDAO.insert(user);

        // 产生token
        long userId = userDAO.selectByName(username).getId();   //利用数据库产生userId
        String token = createToken(userId);
        map.put("token", token);
        return map;
    }

    public Map<String, Object> login(String account, String password, String captcha, String captchaKey) {
        Map<String, Object> map = new HashMap<String, Object>();

        if (!captcha.equalsIgnoreCase(redisService.getCacheObject(captchaKey))) {
            map.put("msg", "验证码错误");
            return map;
        }
        redisService.delete(captchaKey);

        User user;
        if(account.indexOf("@") != -1) {   //邮箱
            user = userDAO.selectByEmail(account);
        }else{                             //手机
            user = userDAO.selectByPhone(account);
        }
        if (user == null) {
            map.put("msg", "账号不存在");
            return map;
        }

        if (!MD5Util.MD5(password + user.getSalt()).equals(user.getPassword())) {
            map.put("msg", "密码不正确");
            return map;
        }

        String token = createToken(user.getId());
        map.put("token", token);
        map.put("userId", user.getId());
        return map;
    }

    public void logout(String token) {
        deleteToken(token);
    }

    public String createToken(long userId) {
        String token = UUID.randomUUID().toString().replace("-", "");               //使用uuid作为源token
        redisService.setCacheObject(token, userId).expire(2, TimeUnit.HOURS);       //存储到redis并设置过期时间为2个小时
        return token;
    }

    public boolean checkToken(String token) {
        if (token == null) {
            return false;
        }
        Long userId = redisService.getCacheObject(token);
        if (userId == null ) {
            return false;
        }
        //如果验证成功，说明此用户进行了一次有效操作，延长token的过期时间
        redisService.setCacheObject(token, userId).expire(2, TimeUnit.HOURS);
        return true;
    }

    public long getUserId(String token){
        return redisService.getCacheObject(token);
    }

    public void deleteToken(String token) {
        redisService.delete(token);
    }

    public User getById(long id){
        User user =  userDAO.selectById(id);
        boolean isFollowed = followService.isFollower(userHolder.getUser().getId(), ObjectType.USER, id);
        user.setIsFollowed(isFollowed);
        return user;
    }

    public List<User> searchUser(String params, Pageable pageable) {
        List<User> users = repository.findTop3ByName(params, pageable);
        return users;
    }

}
