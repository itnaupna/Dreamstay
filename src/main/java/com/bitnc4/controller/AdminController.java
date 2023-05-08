package com.bitnc4.controller;


import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.service.AdminHnRService;
import lombok.extern.slf4j.Slf4j;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    @Autowired
    AdminHnRService adminHnRService;
    String bucketName="dreamsstaybucket";
    @Autowired
    NcpObjectStorageService ncp;



    @GetMapping("/chat")
    public String chatList(Model m){
//        m.addAttribute("dto",cm.test());
//        log.info(cm.test().toString());
        return "/admin/chat/list";
    }

    @GetMapping({"/","/dashboard",""})
    public String dashboard(){
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
        List<Object> lst = new ArrayList<>();
        lst.add(adminHnRService.getHotelByHotelNum(hotelnum));
        lst.add(adminHnRService.getRoomsByHotelNum(hotelnum));
        return lst;
    }

    @PostMapping("/hotel/update")
    @ResponseBody
    public boolean updateHotel(HotelDto data, MultipartFile file) {

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

    @GetMapping("/hotel/getroomtype/{hotelnum}")
    @ResponseBody
    public List<String> getRoomTypesOfHotel(@PathVariable int hotelnum){
        System.out.println(hotelnum);
        return adminHnRService.getRoomTypesOfHotel(hotelnum);
    }

    @PostMapping("/hotel/uploadroom/{hotelnum}")
    @ResponseBody
    public boolean uploadroom(RoomDto roomDto){


        return adminHnRService.insertRoom(roomDto);
    }


}

