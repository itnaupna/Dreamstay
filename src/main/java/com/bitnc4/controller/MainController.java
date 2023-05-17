package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.MainHnRService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    AdminHnRService adminHnRService;

    @Autowired
    MainHnRService mainHnRService;

    @Autowired
    private HttpSession session;

    @GetMapping("/testpage")
    public String main(Model m, HttpSession s){
        return "/main/chat/room";
    }

    @RequestMapping("/ping")
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @GetMapping("/")
    public String main(Model m){
        List<HotelDto> list = adminHnRService.getHotels();
        m.addAttribute("list",list);
        /*session.setAttribute("nomemberId",null);
        session.setAttribute("nomemberusername", null);*/
        return "/main";
    }

    @PostMapping("/search_room")
    public String search_room(HttpServletRequest request,HttpSession session)
    {
        String checkIn = request.getParameter("check_in_hidden");
        String checkOut = request.getParameter("check_out_hidden");
        String checkInShow = request.getParameter("check_in_show");
        String checkOutShow = request.getParameter("check_out_show");
        String selectedHotel = request.getParameter("select_hotel");
        String roomCount = request.getParameter("room_cnt");
        String adultCount = request.getParameter("adult_cnt");
        String childrenCount = request.getParameter("children_cnt");

        // Store form data in session
        session.setAttribute("checkIn", checkIn);
        session.setAttribute("checkOut", checkOut);
        session.setAttribute("checkInShow", checkInShow);
        session.setAttribute("checkOutShow", checkOutShow);
        session.setAttribute("selectedHotel", selectedHotel);
        session.setAttribute("roomCount", roomCount);
        session.setAttribute("adultCount", adultCount);
        session.setAttribute("childrenCount", childrenCount);

        return "redirect:/book/search_room";
    }



}
