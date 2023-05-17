package com.bitnc4.controller;


import com.bitnc4.dto.HotelDto;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hotel")
public class HotelController {

    @Autowired
    HotelService hotelService;

    @Autowired
    AdminHnRService adminHnRService;

    @GetMapping("/hotellist")
    @ResponseBody
    public List<HotelDto> hotelList() {
        List<HotelDto> list = adminHnRService.getHotels();
        return list;
    }
    // 상세 페이지로 이동
    @GetMapping("/hoteldetail")
    public String hotelDetail(int num, Model model) {
        List<Map<String, String>> detail = hotelService.getHotelData(num);
        List<String> roomphoto = hotelService.dividePhoto(detail);
        for(int i = 0; i < detail.size(); i++) {
            for(String key : detail.get(i).keySet()) {
                System.out.println("key: " + key + ", value: " + String.valueOf(detail.get(i).get(key)));
            }
        }
        List<Integer> leftIndex = new ArrayList<>();
        // 시작값 구하기
        int a = 160;
        for(int i = 0; i < roomphoto.size() + 1; i++) {

            leftIndex.add(a);
            a -= 90;
            System.out.println(leftIndex.get(i));
        }
        model.addAttribute("leftIndex", leftIndex);
        model.addAttribute("detail", detail);
        model.addAttribute("roomphoto", roomphoto);
        return "/main/hotel/hoteldetail";
    }
}
