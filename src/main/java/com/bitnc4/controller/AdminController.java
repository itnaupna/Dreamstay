package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.repo.ChatRoomRepository;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.AdminNoticeService;
import com.bitnc4.service.AdminQnaServeice;
import lombok.extern.slf4j.Slf4j;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    @Autowired
    AdminHnRService adminHnRService;
    @Autowired
    AdminNoticeService adminNoticeService;
    @Autowired
    AdminQnaServeice adminQnaServeice;
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

    @PostMapping("/uploadp")
    @ResponseBody
    public List<String> uploadp(List<MultipartFile> file){
        List<String> result = new ArrayList<>();
        if(!file.get(0).getOriginalFilename().equals("")){
            file.forEach(f-> result.add(ncp.uploadFile(bucketName,"room",f)));
            return result;
        }

        //System.out.println(file.getOriginalFilename());
        //return file.getOriginalFilename();
        return null;
    }
    @PostMapping("/deletep")
    @ResponseBody
    public boolean deletep(String name){
        log.info("name : {}",name);
        return ncp.deleteFile(bucketName,"room",name);
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
        return adminHnRService.insertRoom(roomDto);
    }

    @PostMapping("/hotel/deleteroom/{roomnum}")
    @ResponseBody
    public int deleteRoom(@PathVariable int roomnum){
        return adminHnRService.deleteRoom(roomnum);
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


    @GetMapping("/qna")
    public String qna(Model model)
    {
        model.addAttribute("qnaList",adminQnaServeice.getQnaList(1));
        model.addAttribute("page",adminQnaServeice.getQnaCount(1));

        return "/admin/qna/list";
    }

    @GetMapping("/qna/list/{page}")
    @ResponseBody
    public List<Object> getQnaList(@PathVariable int page)
    {
        List<Object> result = new ArrayList<>();
        result.add(adminQnaServeice.getQnaList(page));
        result.add(adminQnaServeice.getQnaCount(page));
        return result;
    }

    @GetMapping("/qna/content")
    public String content(int num, Model model) {
        {
            QnaBoardDto dto = adminQnaServeice.getQna(num);

            model.addAttribute("dto", dto);

            return "/admin/qna/content";

        }

    }

    @PostMapping("/qna/answerupdate")
    public String answerupdate(QnaBoardDto dto)
    {
        adminQnaServeice.upateQnaAnswer(dto);
        return "redirect:/admin/qna/content?num="+dto.getNum();

    }

    @GetMapping("/getSearchQna")
    @ResponseBody
    private List<QnaBoardDto> searchQnaList(String searchtype,String keyword, Model model, String qna_type, int category, String answer)
    {
        QnaBoardDto dto = new QnaBoardDto();
        dto.setAnswer(answer);
        dto.setQna_type(qna_type);
        dto.setCategory(category);
        dto.setSearchtype(searchtype);
        dto.setKeyword(keyword);

        return adminQnaServeice.searchQnaList(dto);

    }

}

