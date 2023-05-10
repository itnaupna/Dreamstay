package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.MainHnRService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private HttpSession session;

    @GetMapping("/search_room")
    public String book(HttpSession session){

     /*var checkIn = session.getAttribute("checkIn");
     var checkOut = session.getAttribute("checkOut");
     var selectedHotel = session.getAttribute("selectedHotel");
     var roomCount = session.getAttribute("roomCount");
     var adultCount = session.getAttribute("adultCount");
     var childrenCount = session.getAttribute("childrenCount");*/


        return "/main/book/search_room";
    }

    @GetMapping("/payment")
    public String payment()
    {
        return "/main/book/payment";
    }

}
