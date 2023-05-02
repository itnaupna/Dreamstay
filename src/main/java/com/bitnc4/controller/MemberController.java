package com.bitnc4.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.bitnc4.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller

public class MemberController {

    @Autowired
    MemberService memberService;

    HashMap<String, String> auth = new HashMap<String, String>();

    // 로그인 페이지
    @GetMapping("/login")
    public String login() {
        return "/main/signup/login";
    }
    
    // 회원가입 페이지
    @GetMapping("/signup")
    public String signup() {
        return "/main/signup/signup";
    }

    // 111111 ~ 999999 자리 인증코드 발송
    @PostMapping("/sendemail")
    @ResponseBody
    public void sendCode(String email) {
        String code = String.valueOf((int)(Math.random() * (999999 - 100000 + 1) + 100000));
        memberService.mailCode(email, code);
        auth.put(email, code);
    }
    
    // 이메일 인증
    @PostMapping("/checkemail")
    @ResponseBody
    public boolean chkemail(String email, String email_code) {
        boolean check = memberService.codeAuth(auth ,email, email_code);
        System.out.println(check);
        System.out.println(auth.size());
        System.out.println(auth.get(email));
        return check;
    }

    @GetMapping("/overlapid")
    @ResponseBody
    public boolean overlapid() {
        return memberService.overlapId();
    }
}
