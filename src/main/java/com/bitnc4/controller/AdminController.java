package com.bitnc4.controller;


import com.bitnc4.dto.RoomDto;
import com.bitnc4.mapper.ChatMapper;
import com.bitnc4.service.AdminHnRService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    @Autowired
    AdminHnRService adminHnRService;


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
        lst.add(adminHnRService.getHotelByRoomHotelNum(hotelnum));
        lst.add(adminHnRService.getRoomsByHotelNum(hotelnum));
        return lst;
    }
}
