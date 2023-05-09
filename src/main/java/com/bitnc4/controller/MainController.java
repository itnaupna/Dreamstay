package com.bitnc4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @GetMapping("/")
    public String main(Model m, HttpSession s){
        m.addAttribute("user",s.getAttribute("loginuser"));
        return "/main";
    }

}
