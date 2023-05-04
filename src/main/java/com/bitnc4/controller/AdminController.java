package com.bitnc4.controller;


import com.bitnc4.mapper.ChatMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
//    @Autowired
//    ChatMapper cm;

    @GetMapping("/chat")
    public String chatList(Model m){
//        m.addAttribute("dto",cm.test());
//        log.info(cm.test().toString());
        return "/admin/chat/list";
    }

    @GetMapping({"/","/dashboard",""})
    public String dashboard(){
        return "/admin";
    }
}
