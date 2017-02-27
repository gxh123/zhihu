package com.gxh.controller;

import com.gxh.model.User;
import com.gxh.model.UserHolder;
import com.gxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = {"/user"})
public class UserController {

    @Autowired
    UserHolder userHolder;

    @Autowired
    UserService userService;

    @RequestMapping(path = {"/{id}"})
    public String get(Model model, @PathVariable("id") int id){
        if( id == userHolder.getUser().getId()) {
            User user = userHolder.getUser();
            model.addAttribute("user", user);            //访问自己的主页
            model.addAttribute("visitedUser", user);
        }else{
            User user = userService.getById(id);
            model.addAttribute("user", userHolder.getUser());
            model.addAttribute("visitedUser", user);      //访问别人的主页
            System.out.println(user);
        }
        return "user";
    }
}
