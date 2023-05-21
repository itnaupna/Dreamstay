package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.NoticeDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.repo.ChatRoomRepository;
import com.bitnc4.service.*;
import lombok.extern.slf4j.Slf4j;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

@Autowired
    AdminBookService adminBookService;
    @Autowired
    AdminHnRService adminHnRService;
    @Autowired
    AdminNoticeService adminNoticeService;
    @Autowired
    AdminQnaServeice adminQnaServeice;
    @Autowired
    HotelService hotelService;
    String bucketName="dreamsstaybucket";
    @Autowired
    NcpObjectStorageService ncp;

    @Autowired
    ChatRoomRepository chatRoomRepository;


    @GetMapping("/chat")
    public String chatList(Model m){
        m.addAttribute("list",chatRoomRepository.getAll());
        return "/admin/chat/list";
    }

    @GetMapping({"/","/dashboard",""})
    public String dashboard(Model m){
        HashMap<String,Object> data = new HashMap<>();
        data.put("MemberCount",adminHnRService.getMemberCount(false));
        data.put("HotelCount",adminHnRService.getHotelCount());
        data.put("Notice",adminNoticeService.getList(1));
        QnaBoardDto d = new QnaBoardDto();
        d.setAnswer("답변대기");
        data.put("Qna",adminQnaServeice.getQnaList(-1,d));
        data.put("QnaAnanwer",adminQnaServeice.getUnanswerCount());
        m.addAttribute("data",data);

        return "/admin";
    }

    @GetMapping("/hotel")
    public String hotel(Model m)
    {
        m.addAttribute("hDto",adminHnRService.getHotels());
        return "/admin/hotel/list";
    }

    @GetMapping("/hotel/{hotelnum}")
    @ResponseBody
    public List<Object> rooms(@PathVariable int hotelnum){
        /*
        특정 호텔의 호텔정보와 객실목록 불러옴
        Return : [{호텔정보, List<RoomDto>()}]
         */
        List<Object> lst = new ArrayList<>();
        lst.add(adminHnRService.getHotelByHotelNum(hotelnum));
        lst.add(adminHnRService.getRoomsByHotelNum(hotelnum));
        return lst;
    }//

    @PostMapping("/hotel/update")
    @ResponseBody
    public int updateHotel(HotelDto data, MultipartFile file) {
        /*
        호텔정보 insert/update 호출
        Return : HotelDto.getNum();
         */
        if (!file.getOriginalFilename().equals("")) {
            if(data.getNum() != 0)
                ncp.deleteFile(bucketName,
                        "hotel",
                        adminHnRService.getHotelByHotelNum(data.getNum()).getPhoto()
                );
            data.setPhoto(ncp.uploadFile(bucketName, "hotel", file));
        }
        return data.getNum()==0 ? adminHnRService.insertHotel(data) : adminHnRService.updateHotelDetail(data);
    }
    //
    @PostMapping("/uploadp")
    @ResponseBody
    public List<String> uploadp(List<MultipartFile> file,String folder){
//        System.out.println(folder);
        List<String> result = new ArrayList<>();
        if(!file.get(0).getOriginalFilename().equals("")){
            file.forEach(f-> result.add(ncp.uploadFile(bucketName,folder,f)));
            return result;
        }
        return null;
    }
    @PostMapping("/deletep")
    @ResponseBody
    public boolean deletep(String name,String folder){
//        log.info("name : {}",name);
        return ncp.deleteFile(bucketName,folder,name);
    }

    @PostMapping("/writeroom")
    @ResponseBody
    public boolean WriteRoom(RoomDto data){
        //log.info(data.toString());
        try {
            adminHnRService.updateRoomDetail(data);
            return true;
        }catch (Exception e) {
            log.info(data.toString());
            log.info(e.getMessage());
            return false;
        }
    }

    @GetMapping("/hotel/getroomtype/{hotelnum}")
    @ResponseBody
    public List<String> getRoomTypesOfHotel(@PathVariable int hotelnum){
        /*
        객실추가에서 객실타입 입력도움을 위해 추가
        Return : 해당 호텔에 등록된 객실의 타입들 반환
         */
        return adminHnRService.getRoomTypesOfHotel(hotelnum);
    }

    @PostMapping("/hotel/uploadroom/{hotelnum}")
    @ResponseBody
    public int uploadroom(RoomDto roomDto){
        /*
        객실 추가
        Return : 추가된 객실의 RoomDto.getNum()
         */
        log.info(roomDto.toString());
        if(roomDto.getNum() == 0)
            return adminHnRService.insertRoom(roomDto);
        else {
            adminHnRService.updateRoomSimpleInfo(roomDto);
            return roomDto.getNum();
        }
    }

    @PostMapping("/hotel/deleteroom/{roomnum}")
    @ResponseBody
    public int deleteRoom(@PathVariable int roomnum){
        return adminHnRService.deleteRoom(roomnum);
    }

    @GetMapping("/hotel/roomsimple/{roomnum}")
    @ResponseBody
    public RoomDto getSimpleInfo(@PathVariable int roomnum){
        return adminHnRService.getRoomSimpleInfo(roomnum);
    }

    @PostMapping("/hotel/roomsimple")
    @ResponseBody
    public boolean updateSimpleInfo(RoomDto dto){
        try{
            adminHnRService.updateRoomSimpleInfo(dto);
            return true;
        }catch (Exception e) {
            return false;
        }
    }

    @GetMapping("/notice")
    public String notice(Model m){
        m.addAttribute("list",adminNoticeService.getList(1));
        m.addAttribute("page",adminNoticeService.getCount(1));
        return "/admin/notice/list";
    }
    @GetMapping("/notice/list/{page}")
    @ResponseBody
    public List<Object> getNoticeList(@PathVariable int page){
        List<Object> result = new ArrayList<>();
        result.add(adminNoticeService.getList(page));
        result.add(adminNoticeService.getCount(page));
        return result;
    }

    @PostMapping("/notice/write")
    @ResponseBody
    public int writeNotice(NoticeDto dto){
        dto.setWriter("관리자");
        if(dto.getNum()==0)
            return adminNoticeService.writeNotice(dto);
        else
            return adminNoticeService.modifyNotice(dto);
    }
    @PostMapping("/notice/delete")
    @ResponseBody
    public boolean deleteNotice(int num){
        NoticeDto dto = adminNoticeService.readNotice(num);
        if(dto.getPhoto()!=null){
            log.info("1");
            if(!dto.getPhoto().equals("")){
                log.info("2");
                if(dto.getPhoto().contains(",")){
                    log.info("3-1");
                    for (String s : dto.getPhoto().split(",")) {
                        deletep(s,"notice");
                    }
                }else{
                    log.info("3-2");
                    deletep(dto.getPhoto(),"notice");
                }
            }
        }
        return adminNoticeService.deleteNotice(dto.getNum());
    }

    @GetMapping("/notice/detail")
    @ResponseBody
    public NoticeDto readNotice(int num){
        return adminNoticeService.readNotice(num);
    }


    @GetMapping("/qna")
    public String qna(Model model)
    {
        model.addAttribute("qnaList",adminQnaServeice.getQnaList(1,new QnaBoardDto()));
        model.addAttribute("page",adminQnaServeice.getQnaCount(1,new QnaBoardDto()));
        // 호텔 데이터 가져오기
        List<HotelDto> hotelList = hotelService.getAllHotelData();
        model.addAttribute("hotelList", hotelList);

        return "/admin/qna/list";
    }

    @GetMapping("/qna/content")
    public String content(int num, Model model, HttpSession session)
    {

        QnaBoardDto dto = adminQnaServeice.getQna(num);
        model.addAttribute("dto", dto);

        // 세션에 현재 페이지 정보 저장
        session.setAttribute("currentPage", session.getAttribute("currentPage"));


        return "/admin/qna/content";

    }

    @PostMapping("/qna/answerupdate")
    public String answerupdate(QnaBoardDto dto)
    {
        adminQnaServeice.upateQnaAnswer(dto);
        return "redirect:/admin/qna/content?num="+dto.getNum();

    }

    @GetMapping("/qna/list/{page}")
    @ResponseBody
    public List<Object> getQnaList(@PathVariable int page, String searchtype, String keyword, Model model,
                                   String qna_type, int category, String answer, String hotelname, HttpSession session)
    {
        List<Object> result = new ArrayList<>();
        QnaBoardDto dto = new QnaBoardDto();
        dto.setAnswer(answer);
        dto.setQna_type(qna_type);
        dto.setCategory(category);
        dto.setHotelname(hotelname);
        dto.setSearchtype(searchtype);
        dto.setKeyword(keyword);

        session.setAttribute("currentPage", page);

        /*System.out.println("page="+page);*/

        result.add(adminQnaServeice.getQnaList(page,dto));
        result.add(adminQnaServeice.getQnaCount(page, dto));



        return result;
    }

    @GetMapping("/qna/delete")
    public String deleteqna(QnaBoardDto dto)
    {
        adminQnaServeice.delQnaAnswer(dto);
        return "redirect:/admin/qna/content?num="+dto.getNum();

    }

    @GetMapping("/book")
    public String bookInit(Model m){
        m.addAttribute("blst",adminBookService.getAll());
        m.addAttribute("now",new Date());
        return "/admin/book/list";
    }

    @PostMapping("/book/delete")
    @ResponseBody
    public boolean deleteBook(int num){
        return adminBookService.deleteBook(num);
    }

    @PostMapping("/book/checkin")
    @ResponseBody
    public boolean checkinBook(int num){
        return adminBookService.checkinBook(num);
    }

}