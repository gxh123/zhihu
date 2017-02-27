package com.gxh.controller;

import com.gxh.model.User;
import com.gxh.model.UserHolder;
import com.gxh.service.FeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by gxh on 2016/12/29.
 */
@Controller
public class CollectionController {

    @Autowired
    UserHolder userHolder;

    @RequestMapping("/collections")
    public String getFollowingCollections(Model model){ //just display
        User user = userHolder.getUser();
        model.addAttribute("user", user);
        return "collections";
    }

    @RequestMapping("/collections/mine")
    public String mine(Model model){         //just display
        User user = userHolder.getUser();
        model.addAttribute("user", user);
        return "collections_mine";
    }

    @RequestMapping("/collection/{id}")
    public String collection(@PathVariable("id") int id, Model model){ //just display
        User user = userHolder.getUser();
        model.addAttribute("user", user);
        return "collection";
    }

}
