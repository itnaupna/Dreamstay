package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.MemberDto;
import com.bitnc4.service.HotelService;
import com.bitnc4.service.MemberService;
import com.sun.tools.jconsole.JConsoleContext;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/signup")
public class MemberController {

    @Autowired
    MemberService memberService;

    @Autowired
    HotelService hotelService;

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
    public String joinmember(MemberDto dto, String addrdetail, String zipcode, String family_name, String email_domain) {
        dto.setUser_name(family_name + "/"+dto.getUser_name());
        dto.setAddr("(" + zipcode + ")" + dto.getAddr() + addrdetail);
        dto.setEmail(dto.getEmail() + "@" + email_domain);
        memberService.joinMember(dto);
        return "/main";
    }

    // 로그인
    @PostMapping("/access")
    @ResponseBody
    public int idpwChk(String id, String pw, String saveid, HttpSession session, HttpServletResponse response) {
        Cookie cookie;
        // 아이디만 맞을경우
        if(memberService.overlapId(id)== 1) {
            MemberDto loginuser = memberService.access(id,pw);
            // 아이디와 비밀번호가 모두 맞을경우
            if(loginuser != null) {
                memberService.resetLockCount(id);
                session.setAttribute("loginuser",loginuser);
                session.setAttribute("userid", ((MemberDto)session.getAttribute("loginuser")).getId());
                // 아이디 저장 체크여부  if 문 체크 시 쿠키 생성
                if(saveid.equals("true")) {
                    cookie = new Cookie("saveid", id);
                    cookie.setDomain("localhost");
                    cookie.setPath("/");
                    cookie.setMaxAge(60 * 60 * 24 * 7);
                    cookie.setSecure(true);
                    response.addCookie(cookie);
                } else {
                    cookie = new Cookie("saveid", "");
                    cookie.setDomain("localhost");
                    cookie.setPath("/");
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
                return 1;
            } else {
                return 0;
            }
        } else {
            return 34543643;
        }
    }
    
    // 로그아웃클릭 시 세션 지우고 홈으로
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        //HttpSession에 저장했던 모든값 삭제.
        Enumeration<String> em = session.getAttributeNames();
        while(em.hasMoreElements()){
            String k = em.nextElement();
            //log.info(k);
            session.removeAttribute(k);
        }

       return "redirect:/";
    }
    
    // 아이디 비밀번호찾기로 이동
    @GetMapping("/findidpw")
    public String findidpw() {
        return "/main/signup/findidpw";
    }
    
    // 아이디 비밀번호 찾기 페이지
    @PostMapping("/searchidpw")
    @ResponseBody
    public int chkIdPw(String email, String id) {
        return memberService.overlapEmail(email, id);
    }

    // 아이디 찾기 페이지
    @PostMapping("/findid")
    public String findId(String email, Model model) {
        MemberDto mDto = memberService.searchInfoToEmail(email);
        mDto.setUser_name(mDto.getUser_name().replaceAll("/", ""));
        model.addAttribute("mDto", mDto);
        return "/main/signup/findid";
    }

    // 비밀번호 변경 페이지
    @PostMapping("/changepassword")
    public String findPw(String email, Model model) {
        model.addAttribute("mDto", memberService.searchInfoToEmail(email));
        return "/main/signup/changepassword";
    }


    // 비밀번호 변경
    @PostMapping("/updatepassword")
    public String chgPass(String id, String pw){
        memberService.changePassword(id, pw);
        return "redirect:/signup/login";
    }

    // 계정 잠금
    @PostMapping("/lockcount")
    @ResponseBody
    public int lockcount(String id) {
        int lockCount = memberService.showLockCount(id) + 1;
        if (lockCount <= 5) {
            memberService.accountLockCount(id);
        }
        return lockCount;
    }

    // 카카오 로그인
    @PostMapping("/kakaologin")
    @ResponseBody
    public String kakaoLogin(MemberDto socialLogin, HttpSession session) {
        boolean memberChk = memberService.getSocialMember(socialLogin.getId(), String.valueOf(socialLogin.getIssocial()), socialLogin.getSocial() ) != null;
        System.out.println(memberChk);
        if(memberChk) {
            System.out.println("아이디 있음");
            session.setAttribute("loginuser", socialLogin);
            System.out.println(session.getAttribute("loginuser"));
        } else {
            System.out.println("아이디 없음");
            memberService.socialJoin(socialLogin);
            session.setAttribute("loginuser", socialLogin);
        }
        return "redirect:/";
    }

    // 네이버 팝업
    @GetMapping("/callbacknaver")
    public String callBackNaver() {
        return "/main/signup/callbacknaver";
    }

    // 네이버 로그인
    @PostMapping("/naverlogin")
    @ResponseBody
    public String naverLogin(MemberDto socialLogin, HttpSession session) {
        boolean memberChk = memberService.getSocialMember(socialLogin.getId() , String.valueOf(socialLogin.getIssocial()), socialLogin.getSocial()) != null;
        System.out.println(memberChk);
        if(memberChk) {
            System.out.println("아이디 있음");
            session.setAttribute("loginuser", socialLogin);
            System.out.println(session.getAttribute("loginuser"));
        } else {
            System.out.println("아이디 없음");
            memberService.socialJoin(socialLogin);
            session.setAttribute("loginuser", socialLogin);
        }
        return "redirect:/";
    }
}
