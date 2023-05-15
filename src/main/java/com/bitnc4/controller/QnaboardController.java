package com.bitnc4.controller;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.service.QnaBoardService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
public class QnaboardController {

    @Autowired
    private QnaBoardService qnaBoardService;

    @Autowired
    private NcpObjectStorageService storageService;
    String bucketName="dreamsstaybucket";

    @GetMapping("/mypage/qnaboard")
    public String quaboard(Model model, HttpSession session){
        // 세션에 저장된 id
        String writer = (String) session.getAttribute("userid");
        // 비회원일 경우 공란
        if (writer == null || writer.isEmpty()) {
            return "/mypage/qnaboard/qnaform";
        }
        MemberDto memberDto = qnaBoardService.searchIdOfinfo(writer);
        model.addAttribute("memberDto", memberDto);
        return "/mypage/qnaboard/qnaform";
    }
    @PostMapping("/insertqna")
    public String insertqna(QnaBoardDto dto,
                            HttpServletRequest request,
                            HttpSession session,
                            MultipartFile photo)
    {

        String filename="";
        //업로드를 한 경우만 버킷에 이미지 저장
        if(!photo.getOriginalFilename().equals("")){
           filename = storageService.uploadFile(bucketName, "qnaboard", photo);
        }

        // dto에 photo 저장\
        dto.setQna_photo(filename);

       // 아이디 저장 세션에 저장된 id
        String writer=(String)session.getAttribute("userid");

        // 비회원일시 nomember로 저장
       if (writer == null || writer.isEmpty()) {
            writer = "nomember";
       }
        //dto에 id 저장
        dto.setWriter(writer);

       //radio 값 저장
        String qnaType = request.getParameter("qna_type");
        dto.setQna_type(qnaType);

        // 사용일자 파싱
        String usedayStr = request.getParameter("useday");
        System.out.println(usedayStr);

        qnaBoardService.insertqna(dto);

        return "redirect:/mypage/qnalist";
    }

   @GetMapping("/mypage/qnalist")
   public String qnalist(QnaBoardDto dto, HttpSession session, HttpServletResponse response, Model model){
       //세션에 저장된 id
       String writer=(String)session.getAttribute("userid");

       // 비회원으로 로그인 시 로그인 페이지로 이동
       if (writer == null || writer.isEmpty()) {
            return "/main/signup/login";
       }
       //dto에 id 저장
       dto.setWriter(writer);

      List<QnaBoardDto> qnaBoardList = qnaBoardService.qnaList(writer);
      model.addAttribute("qnaBoardList", qnaBoardList);

         return "/mypage/qnaboard/qnalist";
     }

     @GetMapping("/mypage/qnadetail")
        public String detail(int num, Model model)
     {
         QnaBoardDto dto = qnaBoardService.getQna(num);
         model.addAttribute("dto",dto);

         return "/mypage/qnaboard/qnadetail";
     }

     @GetMapping("/mypage/deleteqna")
        public String deleteqna(int num, QnaBoardDto dto)
     {
         //db 삭제 전에 저장된 이미지 버켓에서 지운다
         String filename = qnaBoardService.getQna(num).getQna_photo();
         if (filename != null && !filename.equals("")) {
             storageService.deleteFile(bucketName, "qnaboard", filename);
         }
         //db 삭제
        qnaBoardService.deleteQna(num);

         return "redirect:/mypage/qnalist";
     }


   }
