package com.bitnc4.controller;

import com.bitnc4.dto.MemberDto;
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
        String code = String.valueOf((int)(Math.random() * (99999 - 10000 + 1) + 10000));
        memberService.mailCode(email, code);
        auth.put(email, code);
    }

    @PostMapping("/deletemail")
    @ResponseBody
    public boolean deletemail(String email) {
        return memberService.deleteCode(auth, email);
    }

    // 이메일 중복검사
    @PostMapping("/overlapemail")
    @ResponseBody
    public int overlapEmail(String email) {
        return memberService.overlapEmail(email);
    }
    // 이메일 인증
    @PostMapping("/checkemail")
    @ResponseBody
    public boolean chkemail(String email, String email_code) {
        boolean check = memberService.codeAuth(auth ,email, email_code);
        System.out.println(auth.size());
        return check;
    }

    // ID 중복검사
    @GetMapping("/overlapid")
    @ResponseBody
    public int overlapid(String id) {
        return memberService.overlapId(id);
    }

    @PostMapping("/joinmember")
    public String joinmember(MemberDto dto, String addrdetail) {
        dto.setAddr(dto.getAddr() + addrdetail);
        memberService.joinMember(dto);

        return "/main";
    }



}
