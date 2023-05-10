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

    @GetMapping("/book/search_room")
    public String book(HttpSession session,Model model) {

        var checkIn = session.getAttribute("checkIn");
        var checkOut = session.getAttribute("checkOut");
        var selectedHotel = session.getAttribute("selectedHotel");
        var roomCount = session.getAttribute("roomCount");
        var adultCount = session.getAttribute("adultCount");
        var childrenCount = session.getAttribute("childrenCount");

        System.out.println(checkIn);
        System.out.println(checkOut);
        System.out.println(selectedHotel);
        System.out.println(roomCount);
        System.out.println(adultCount);
        System.out.println(childrenCount);
        System.out.println("get search");

        model.addAttribute("checkin", checkIn);
        model.addAttribute("checkout", checkOut);
        model.addAttribute("selectedHotel", selectedHotel);
        model.addAttribute("roomCount", roomCount);
        model.addAttribute("adultCount", adultCount);
        model.addAttribute("childrenCount", childrenCount);

        System.out.println(checkOut);

        return "/main/book/search_room";
    }

    @GetMapping("/payment")
    public String payment() {
        return "/main/book/payment";
    }

}
