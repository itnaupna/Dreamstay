package com.bitnc4.controller;

import com.bitnc4.dto.BookDto;
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
import java.util.Map;

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
        if(session.getAttribute("loginuser") != null) {
            MemberDto dto = (MemberDto) session.getAttribute("loginuser");
            List<Map<String, String>> map = mypageService.getmemberBookData(String.valueOf(dto.getNum()));
            model.addAttribute("data", map);
            model.addAttribute("size", map.size());
            String[] fnFn = dto.getUser_name().split("/");
            model.addAttribute("familyname", fnFn[0]);
            model.addAttribute("firstname", fnFn[1]);

            List<BookDto> list = mypageService.selectForBookNum();
            model.addAttribute("list", list);
        }
        return "/mypage/mypage";
    }

    @GetMapping("/deletebook")
    public String deletebook(int num,HttpSession session,Model model)
    {
        mypageService.deleteMemberBook(num);
        MemberDto dto = (MemberDto)session.getAttribute("loginuser");
        List<Map<String, String>> map = mypageService.getmemberBookData(String.valueOf(dto.getNum()));
        model.addAttribute("data",map);
        String[] fnFn = dto.getUser_name().split("/");
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);

        return "redirect:/mypage";
    }

    @GetMapping("/updateinfo")
    public String updateinfo(HttpSession session,Model model)
    {
        if(session.getAttribute("loginuser") != null) {
            String id = ((MemberDto) (session.getAttribute("loginuser"))).getId();
            MemberDto dto = mypageService.selectInfoToId(id);
            System.out.println(dto.getUser_name());
            String[] fnFn = dto.getUser_name().split("/");

            model.addAttribute("memberDto", dto);
            model.addAttribute("familyname", fnFn[0]);
            model.addAttribute("firstname", fnFn[1]);
        }
        return "/mypage/updateinfo";
    }

    @PostMapping("/changeinfo")
    @ResponseBody
    public void changeinfo(HttpSession session,Model model,MemberDto dto)
    {
        dto.setId(((MemberDto)session.getAttribute("loginuser")).getId());
        mypageService.updateUserInfo(dto);
        dto.setNum(((MemberDto) session.getAttribute("loginuser")).getNum());
        session.setAttribute("loginuser", dto);
    }

    @GetMapping("/updatepass")
    public String updatepass(HttpSession session,Model model)
    {
        String id = ((MemberDto)session.getAttribute("loginuser")).getId();
        MemberDto dto = (MemberDto)session.getAttribute("loginuser");
        String[] fnFn = dto.getUser_name().split("/");
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);
        model.addAttribute("memberDto",mypageService.selectInfoToId(id));
        return "/mypage/updatepass";
    }

    @PostMapping("/changepw")
    @ResponseBody
    public int changepw(HttpSession session, String chpw)
    {
        String id = ((MemberDto)session.getAttribute("loginuser")).getId();
        return mypageService.updateUserPass(id,chpw);
    }

    @GetMapping("/deleteform")
    public String deleteform(HttpSession session, Model model) {
        MemberDto dto = (MemberDto)session.getAttribute("loginuser");
        String[] fnFn = dto.getUser_name().split("/");
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);
        model.addAttribute("memberDto", dto);
    return "/mypage/deleteform";
    }


    @PostMapping("/chkidpw")
    @ResponseBody
    public int chkidpw(HttpSession session, String pw) {
        String id = ((MemberDto)session.getAttribute("loginuser")).getId();
        return mypageService.matchForIdPw(id, pw);
    }

    @GetMapping("/deleteuser")
    public String deleteuser(HttpSession session)
    {
        mypageService.deleteUser(((MemberDto)session.getAttribute("loginuser")).getId());
        session.removeAttribute("loginuser");
        return "redirect:/";
    }

    @GetMapping("/membership")
    public String myreservation(HttpSession session, Model model)
    {
        if(session.getAttribute("loginuser") != null) {
        String id = ((MemberDto)session.getAttribute("loginuser")).getId();
        model.addAttribute("memberDto",mypageService.selectInfoToId(id));
        MemberDto dto = (MemberDto)session.getAttribute("loginuser");
        String[] fnFn = dto.getUser_name().split("/");
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);
        model.addAttribute("memberDto",mypageService.selectInfoToId(id));
        }
        return "/mypage/membership";
    }

    @GetMapping("/dining")
    public String test(HttpSession session,Model model)
    {
        MemberDto dto = (MemberDto)session.getAttribute("loginuser");
        String[] fnFn = dto.getUser_name().split("/");
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);
        return "/mypage/dining";
    }

}
