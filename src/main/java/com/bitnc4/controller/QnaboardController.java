package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.NoticeDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.service.AdminNoticeService;
import com.bitnc4.service.HotelService;
import com.bitnc4.service.QnaBoardService;
import lombok.extern.slf4j.Slf4j;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import java.util.Map;
import java.util.*;

@Slf4j
@Controller
public class QnaboardController {

    @Autowired
    private QnaBoardService qnaBoardService;

    @Autowired
    AdminNoticeService adminNoticeService;

    @Autowired
    private NcpObjectStorageService storageService;

    @Autowired
    HotelService hotelService;

    String bucketName = "dreamsstaybucket";

    @GetMapping("/qnaboard")
    public String quaboard(Model model, HttpSession session) {
        // 세션에 저장된 id
        String writer = (String) session.getAttribute("userid");
        // 비회원일 경우 공란
        if (writer == null || writer.isEmpty()) {
            writer = "nomember";
            model.addAttribute("writer",writer);
        }


        MemberDto memberDto = qnaBoardService.searchIdOfinfo(writer);
        model.addAttribute("memberDto", memberDto);

        if (session.getAttribute("loginuser")!=null ) {
            // info user name 출력 <상혁>
            if(session.getAttribute("loginuser") != null) {
                MemberDto dto = (MemberDto) session.getAttribute("loginuser");
                String[] fnFn = dto.getUser_name().split("/");
                model.addAttribute("familyname", fnFn[0]);
                model.addAttribute("firstname", fnFn[1]);
            }
        }
        // 호텔 데이터 가져오기
        List<HotelDto> hotelList = hotelService.getAllHotelData();
        model.addAttribute("hotelList", hotelList);

        return "/main/qnaboard/qnaform";

    }

    @PostMapping("/insertqna")
    public String insertqna(QnaBoardDto dto,
                            HttpServletRequest request,
                            HttpSession session,
                            List<MultipartFile> photo,
                            Model model) {

       // 사진 저장
       String fielname = "";

       List<String> photoNames=new ArrayList<>();

      if(!photo.get(0).getOriginalFilename().equals("")) {
/*          System.out.println("size:"+photo.size());*/
            for(MultipartFile file:photo)
            {//스토리지에 업로드하기
                String photoname=storageService.uploadFile(bucketName, "qnaboard", file);
                fielname+=photoname+",";
            }

            fielname=fielname.substring(0,fielname.length()-1);
        }

        dto.setQna_photo(fielname);

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

        String resrevenum = request.getParameter("resrevenum");
        dto.setReservenum(resrevenum);


        String qna_pass = request.getParameter("qna_pass");
        if(qna_pass != null && !qna_pass.isEmpty())
        {
            dto.setQna_pass(qna_pass);
            qnaBoardService.insertqna(dto);
            return "redirect:/qnanomemberlist";
        }

        qnaBoardService.insertqna(dto);


        return "redirect:/mypage/qnalist";
    }

    @GetMapping("/mypage/qnalist")
    public String qnalist(QnaBoardDto dto, HttpSession session, HttpServletResponse response,
                          Model model, @RequestParam(defaultValue = "1") int currentPage){
        //세션에 저장된 id
        MemberDto writer= (MemberDto)session.getAttribute("loginuser");

        // 비회원으로 로그인 시 로그인 페이지로 이동
        if (writer == null || writer.getId().isEmpty()) {
            return "/main/signup/login";
        }
        //dto에 id 저장
        dto.setWriter(writer.getId());

        //게시판의 총 글갯수 얻기
        int totalCount= qnaBoardService.getQnaCount(writer.getId());
        int totalPage;//총 페이지수
        int perPage=5; //한 페이지당 보여질 글의 갯수
        int perBlock=10;//한 블럭당 보여질 페이지의 갯수
        int startNum;//각 페이지에서 보여질 글의 시작번호
        int startPage;//각 블럭에서 보여질 시작 페이지번호
        int endPage;//각 블럭에서 보여질 끝 페이지번호
        int no;//글 출력시 출력할 시작번호

        //총 페이지수
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
        //시작페이지
        startPage=(currentPage-1)/perBlock*perBlock+1;
        //끝페이지
        endPage=startPage+perBlock-1;
        //이때 문제점....endPage 가 totalpage 보다 크면 안된다
        if(endPage>totalPage)
            endPage=totalPage;

        //각 페이지의 시작번호(1페이지 : 0, 2페이지:3,3페이지 :6...)
        startNum=(currentPage-1)*perPage;
        //각 글마다 출력할 글번호(예:10개일경우 1페이지:10, 2페이지: 7...
        //no=totalCount-(currentPage-1)*perPage;
        no=totalCount-startNum;

        //각 페이지에 필요한 게스글 db 에서 가져오기
        List<QnaBoardDto> qnaBoardList = qnaBoardService.qnaList(startNum,perPage,writer.getId());

        //출력시 필요한 변수들을 model 에 몽땅 저장
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("qnaBoardList", qnaBoardList);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("no", no);

        // info user name 출력 <상혁>

        MemberDto dto1 = (MemberDto) session.getAttribute("loginuser");
        String[] fnFn = dto1.getUser_name().split("/");
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);

        return "/mypage/qnaboard/qnalist";
    }


    @GetMapping("/mypage/qnadetail")
    public String detail(int num, Model model, HttpSession session) {
        QnaBoardDto dto = qnaBoardService.getQna(num);
        model.addAttribute("dto", dto);

        // info user name 출력 <상혁>
        MemberDto dto1 = (MemberDto) session.getAttribute("loginuser");
        String[] fnFn = dto1.getUser_name().split("/");
        model.addAttribute("familyname", fnFn[0]);
        model.addAttribute("firstname", fnFn[1]);

        return "/mypage/qnaboard/qnadetail";
    }

    @GetMapping("/qnanomemberlist")
    public String nomemberlist(QnaBoardDto dto, HttpSession session, HttpServletResponse response,
                               Model model, @RequestParam(defaultValue = "1") int currentPage){
        //비회원은 nomember로 저장
        String writer="nomember";
        dto.setWriter(writer);

        //게시판의 총 글갯수 얻기
        int totalCount= qnaBoardService.getQnaCount(writer);
        int totalPage;//총 페이지수
        int perPage=5; //한페이지당 글갯수
        int perBlock=10;//한 블럭당 보여질 페이지의 갯수
        int startNum;//시작번호
        int startPage;//블럭에서 시작 페이지번호
        int endPage;//블럭 끝 페이지번호
        int no;//글 출력시 출력할 시작번호

        //총 페이지수
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
        //시작페이지
        startPage=(currentPage-1)/perBlock*perBlock+1;
        //끝페이지
        endPage=startPage+perBlock-1;

        if(endPage>totalPage)
            endPage=totalPage;

        startNum=(currentPage-1)*perPage;

        no=totalCount-startNum;

        //게시글 db 에서 가져오기
        List<QnaBoardDto> qnaBoardList = qnaBoardService.qnaList(startNum,perPage,writer);

        //출력시 필요한 변수들을 model 에 몽땅 저장
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("qnaBoardList", qnaBoardList);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("no", no);

        return "/main/qnaboard/qnanolist";
    }



    @GetMapping("/mypage/deleteqna")
    public String deleteqna(int num, HttpSession session, Model model) {
        //db 삭제 전에 저장된 이미지 버켓에서 지운다
        //String filename = qnaBoardService.getQna(num).getQna_photo();

        // 이미지 파일 이름 리스트 가져오기
        List<String> photoNames = Arrays.asList(qnaBoardService.getQna(num).getQna_photo().split(","));

        // 버킷에서 이미지 삭제
        for (String photoName : photoNames) {
            if (photoName!= null && !photoName.equals("")) {
                storageService.deleteFile(bucketName, "qnaboard", photoName);
            }
        }

        //db 삭제
        qnaBoardService.deleteQna(num);

        // info user name 출력 <상혁>2
        if(session.getAttribute("loginuser")!=null) {
            MemberDto dto = (MemberDto) session.getAttribute("loginuser");
            String[] fnFn = dto.getUser_name().split("/");
            model.addAttribute("familyname", fnFn[0]);
            model.addAttribute("firstname", fnFn[1]);

            if(dto.getUser_level()==10)
            {
                return "redirect:/admin/qna";
            }

        }

        // 비회원
        if(session.getAttribute("loginuser")==null)
        {
            return "/qnanomemberlist";
        }

        return "redirect:/mypage/qnalist";
    }

    ////////////////////비회원 list/////////////////////


    @PostMapping("/searchQna")
    @ResponseBody
    public List<QnaBoardDto> searchQna(String writer, String keyword, String searchtype, HttpSession session,Model model,
                                 @RequestParam(defaultValue = "1") int currentPage)
    {
        writer = "nomember";
        List<QnaBoardDto> result = new ArrayList<>();
        QnaBoardDto dto = new QnaBoardDto();
        dto.setWriter(writer);

        // 세션에 검색 조건 저장
        session.setAttribute("searchtype", searchtype);
        session.setAttribute("keyword", keyword);

        // 세션에서 검색 조건 가져오기
        String savedSearchType = (String) session.getAttribute("searchtype");
        String savedKeyword = (String) session.getAttribute("keyword");

        dto.setSearchtype(savedSearchType);
        dto.setKeyword(savedKeyword);

        System.out.println("savedSearchType="+savedSearchType);
        System.out.println("savedKeyword="+savedKeyword);

        //게시판의 총 글갯수 얻기
        int totalCount= qnaBoardService.searchQnaCount(writer,keyword,searchtype);
        int totalPage;//총 페이지수
        int perPage=5; //한페이지당 글갯수
        int perBlock=10;//한 블럭당 보여질 페이지의 갯수
        int startNum;//시작번호
        int startPage;//블럭에서 시작 페이지번호
        int endPage;//블럭 끝 페이지번호
        int no;//글 출력시 출력할 시작번호

        //총 페이지수
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
        //시작페이지
        startPage=(currentPage-1)/perBlock*perBlock+1;
        //끝페이지
        endPage=startPage+perBlock-1;

        if(endPage>totalPage)
            endPage=totalPage;

        startNum=(currentPage-1)*perPage;

        no=totalCount-startNum;
        /*log.info("start {} / perpage {} / writer {}",startNum,perPage,writer);*/
        //게시글 db 에서 가져오기
        result = qnaBoardService.searchQna(startNum,perPage,writer,searchtype,keyword);

        //출력시 필요한 변수들을 model 에 몽땅 저장
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("no", no);

        return result;
    }


    @GetMapping("/qnapass")
    @ResponseBody
    public Map<String, Object> qnapass(int num, String qna_pass) {

        Map<String, Object> map=new HashMap<>();
        boolean b=qnaBoardService.isEqualQna(num, qna_pass);
        if(b) {
            map.put("result", "success");
        }else {
            map.put("result", "fail");
        }
        return map;
    }

    @GetMapping("/qnanodetail")
    public String qnadetail(int num, Model model, HttpSession session) {
        QnaBoardDto dto = qnaBoardService.getQna(num);
        model.addAttribute("dto", dto);

        return "/main/qnaboard/qnanodetail";
    }

    @GetMapping("/notice/noticeboard")
    public String noticeBoard(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "") String search ,Model model) {
        Map<String, Integer> paging = adminNoticeService.getCountData(currentPage, search);
        List<NoticeDto> data = adminNoticeService.getAllNotice(paging.get("start"), paging.get("perPage"), search);
        model.addAttribute("data", data);
        model.addAttribute("paging", paging);
        model.addAttribute("search", search);
        return "/main/qnaboard/noticeboard";
    }

    @PostMapping("/notice/viewcount")
    @ResponseBody
    public int viewCount(int num) {
        adminNoticeService.viewCount(num);
        return adminNoticeService.getViewCount(num);
    }

}