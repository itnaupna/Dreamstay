package com.bitnc4.controller;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.service.MemberService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        System.out.println(auth.size());
    }
    
    // 시간 초과시 이메일에 해당하는 인증번호 삭제
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
    
    // 회원가입 -> db저장 후 메인
    @PostMapping("/joinmember")
    public String joinmember(MemberDto dto, String addrdetail) {
        dto.setAddr(dto.getAddr() + addrdetail);
        memberService.joinMember(dto);
        return "/main";
    }

    // 로그인
    @PostMapping("/access")
    @ResponseBody
    public boolean idpwChk(String id, String pw, String saveid, HttpSession session, HttpServletResponse response, Model model) {
        Cookie cookie;
        if(memberService.access(id, pw) == 1) {
            session.setAttribute("userid", id);
            model.addAttribute("userid", id);
            System.out.println(saveid);
            if(saveid.equals("true")) {
                cookie = new Cookie("saveid", id);
                cookie.setDomain("localhost");
                cookie.setPath("/");
                cookie.setMaxAge(60 * 60);
                cookie.setSecure(true);
                response.addCookie(cookie);
            } else if(saveid.equals("false")) {
                cookie = new Cookie("saveid", null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            return true;
        } else {
            return false;
        }
    }
    
    // 로그아웃클릭 시 세션 지우고 홈으로
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userid");
        return "/";
    }
    
    // 아이디 비밀번호찾기로 이동
    @GetMapping("/findidpw")
    public String findidpw() {
        return "/main/signup/findidpw";
    }
    
    @PostMapping("/searchidpw")
    @ResponseBody
    public int chkIdPw(String email, String id) {
        return memberService.overlapEmail(email, id);
    }

    @PostMapping("/findid")
    public String findId(String email, Model model) {
        model.addAttribute("mDto", memberService.searchInfoToEmail(email));
        return "/main/signup/findid";
    }

    @PostMapping("/changepassword")
    public String findPw(String email, Model model) {
        model.addAttribute("mDto", memberService.searchInfoToEmail(email));
        return "/main/signup/changepassword";
    }

}
