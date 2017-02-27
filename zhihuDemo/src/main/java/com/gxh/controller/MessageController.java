package com.gxh.controller;

import com.gxh.model.Message;
import com.gxh.model.User;
import com.gxh.model.UserHolder;
import com.gxh.service.MessageService;
import com.gxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MessageController {

    @Autowired
    UserHolder userHolder;

    @Autowired
    UserService userService;

    @Autowired
    MessageService messageService;

    @RequestMapping("/inbox")
    public String inbox(Model model){
        User user = userHolder.getUser();
        model.addAttribute("user", user);

        long localUserId = user.getId();
        List<Message> conversationList = messageService.getConversationList(localUserId);
        List<HashMap<String, Object>> conversations = new ArrayList<>();
        for (Message message : conversationList) {
            messageService.updateStatusByMessageId(message.getId(), 1);
            HashMap<String, Object> map = new HashMap();
            map.put("message", message);
            long targetId = message.getFromId() == localUserId ? message.getToId() : message.getFromId();
            map.put("user", userService.getById(targetId));
            map.put("unread", messageService.getConvesationUnreadCount(localUserId, message.getConversationId()));
            conversations.add(map);
        }
        model.addAttribute("conversations", conversations);
        return "inbox";
    }

    @RequestMapping("/inbox/conversation/{id}")
    public String conversation(Model model,@PathVariable("id") String conversationId){
        model.addAttribute("conversationId", conversationId);
        User user = userHolder.getUser();
        model.addAttribute("user", user);
        String[] ids = conversationId.split("_");
        long id = Long.parseLong(ids[0]);
        long anotherId = id == user.getId() ? Long.parseLong(ids[1]):id;
        User another = userService.getById(anotherId);
        model.addAttribute("another", another);

        List<Message> conversation = messageService.getMessageList(conversationId);
        model.addAttribute("conversation", conversation);

        messageService.updateStatusByConversationId(conversationId, 1);

        return "conversation";
    }

    @ResponseBody
    @RequestMapping(path = {"message/add"}, method = {RequestMethod.POST})
    public Message add(Model model, @RequestParam("to_id") long toId,
                        @RequestParam("conversation_id") String conversationId,
                        @RequestParam(value="message_content") String content,
                        @RequestParam("create_date") String time){
        Message message = new Message();
        message.setFromId(userHolder.getUser().getId());
        message.setToId(toId);
        message.setContent(content);
        // String转换为Date
        String pattern = "yyyy-MM-dd HH:mm:ss";
        java.util.Date date = null;
        try {
            date = new SimpleDateFormat(pattern).parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        message.setCreateDate(date);
        messageService.storeMessage(message);
        return message;
    }

}
