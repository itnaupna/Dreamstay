package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.MainHnRService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    AdminHnRService adminHnRService;

    @Autowired
    MainHnRService mainHnRService;

    @GetMapping("/")
    public String main(Model m){
        List<HotelDto> list = adminHnRService.getHotels();
        m.addAttribute("list",list);
        return "/main";
    }





}
