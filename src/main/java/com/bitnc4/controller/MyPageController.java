package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.MemberDto;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

    @Autowired
    AdminHnRService adminHnRService;

    @Autowired
    private MypageService mypageService;

    @GetMapping("")
    public String mypage(HttpSession session, Model model)
    {
        String id = String.valueOf(session.getAttribute("userid"));
        model.addAttribute("memberDto",mypageService.selectInfoToId(id));
        List<HotelDto> list = adminHnRService.getHotels();
        model.addAttribute("list",list);
        return "/mypage/mypage";
    }

    @GetMapping("/updateinfo")
    public String updateinfo(HttpSession session,Model model)
    {
        MemberDto dto = mypageService.selectInfoToId(String.valueOf(session.getAttribute("userid")));
        String[] fnFn = dto.getUser_name().split("/");
        dto.setUser_name(dto.getUser_name().replaceAll("/", ""));
        model.addAttribute("memberDto", dto);
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);
        return "/mypage/updateinfo";
    }

    @PostMapping("/changeinfo")
    @ResponseBody
    public void changeinfo(HttpSession session,Model model,MemberDto dto)
    {
        dto.setId(String.valueOf(session.getAttribute("userid")));
        mypageService.updateUserInfo(dto);
    }

    @GetMapping("/updatepass")
    public String updatepass(HttpSession session,Model model)
    {
        String id = String.valueOf(session.getAttribute("userid"));
        model.addAttribute("memberDto",mypageService.selectInfoToId(id));
        return "/mypage/updatepass";
    }

    @PostMapping("/changepw")
    @ResponseBody
    public int changepw(HttpSession session, String chpw)
    {
        String id = String.valueOf(session.getAttribute("userid"));
        return mypageService.updateUserPass(id,chpw);
    }

    @GetMapping("/deleteform")
    public String deleteform(HttpSession session, Model model) {
        String id = String.valueOf(session.getAttribute("userid"));
        model.addAttribute("memberDto",mypageService.selectInfoToId(id));
    return "/mypage/deleteform";
    }


    @PostMapping("/chkidpw")
    @ResponseBody
    public int chkidpw(HttpSession session, String pw) {
        String id = String.valueOf(session.getAttribute("userid"));
        return mypageService.matchForIdPw(id, pw);
    }

    @GetMapping("/deleteuser")
    public String deleteuser(HttpSession session)
    {
        mypageService.deleteUser(String.valueOf(session.getAttribute("userid")));
        session.removeAttribute("userid");
        return "redirect:/";
    }

    @GetMapping("/membership")
    public String myreservation(HttpSession session, Model model)
    {
        String id = String.valueOf(session.getAttribute("userid"));
        model.addAttribute("memberDto",mypageService.selectInfoToId(id));
        return "/mypage/membership";
    }

    @GetMapping("/kakao")
    public String mypagelg()
    {
        return "/mypage/kakao";
    }


}
