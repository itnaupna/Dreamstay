package com.bitnc4.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.bitnc4.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller

public class MemberController {

    @Autowired
    MemberService memberService;

    HashMap<String, String> auth = new HashMap<String, String>();

    @GetMapping("/login")
    public String login() {
        return "/main/signup/login";
    }

    @GetMapping("/signup")
    public String signup() {
        return "/main/signup/signup";
    }

    @PostMapping("/sendemail")
    @ResponseBody
    public void sendCode(String email) {
        String code = String.valueOf((int)(Math.random() * (999999 - 100000 + 1) + 100000));
        memberService.mailCode(email, code);
        auth.put(email, code);
        System.out.println(auth.get(email));
    }

    @PostMapping("/checkemail")
    @ResponseBody
    public boolean chkemail(String email, String email_code) {
        System.out.println(auth.size());
        System.out.println(auth.get(email));
        return memberService.codeAuth(auth ,email, email_code);
    }
}
