package com.bitnc4.controller;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.service.MemberService;
import com.bitnc4.service.QnaBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class QnaboardController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private QnaBoardService qnaBoardService;
    @GetMapping("/mypage/qnaboard")
    public String quaboard(QnaBoardDto dto, Model model, HttpSession session){
        // 세션에 저장된 id
        String id = (String) session.getAttribute("userid");

        // 로그인 안하면 못보게
        if (id == null || id.isEmpty()) {
            
            return "redirect:/login";
        }

        MemberDto memberDto = qnaBoardService.searchIdOfinfo(id);
        model.addAttribute("memberDto", memberDto);

        return "/main/qnaboard/qnaform";
    }
    @PostMapping("/insertqna")
    public String insertqna(QnaBoardDto dto,
                            HttpServletRequest request,
                            HttpSession session){

        //세션에 저장된 id
        String id=(String)session.getAttribute("userid");
        //dto에 id 저장
        dto.setWriter(id);

        qnaBoardService.insertqna(dto);

        return "redirect:/mypage/qnaboard";
    }

   @GetMapping("/mypage/qnalist")
   public String qnalist(QnaBoardDto dto, HttpSession session, HttpServletResponse response, Model model){
       //세션에 저장된 id
       String writer=(String)session.getAttribute("userid");
       //dto에 id 저장
       dto.setWriter(writer);

      QnaBoardDto qnaBoardDto = qnaBoardService.qnaList(writer);
        model.addAttribute("qnaBoardDto", qnaBoardDto);
         return "/main/qnaboard/qnalist";
     }

   }
