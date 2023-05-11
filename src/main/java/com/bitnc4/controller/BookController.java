package com.bitnc4.controller;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.HotelDto;
import com.bitnc4.dto.RoomDto;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.BookService;
import com.bitnc4.service.MainHnRService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/book/search_room")
    public String book(HttpSession session,Model model,BookDto dto) {

     var checkIn = session.getAttribute("checkIn");
     var checkOut = session.getAttribute("checkOut");
     var selectedHotel = session.getAttribute("selectedHotel");
     var roomCount = session.getAttribute("roomCount");
     var adultCount = session.getAttribute("adultCount");
     var childrenCount = session.getAttribute("childrenCount");

     /*차이날짜 계산*/
     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date endday = null;
        Date startday = null;
        try {
            startday = formatter.parse((String) checkOut);
            endday = formatter.parse((String) checkIn);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        var totalday = startday.getTime() - endday.getTime() ;
        var totaldays = totalday/(1000*60*60*24) ;
        model.addAttribute("totaldays", totaldays);
        //System.out.println(totaldays);

        model.addAttribute("checkin", checkIn);
        model.addAttribute("checkout", checkOut);
        model.addAttribute("selectedHotel", selectedHotel);
        model.addAttribute("roomCount", roomCount);
        model.addAttribute("adultCount", adultCount);
        model.addAttribute("childrenCount", childrenCount);

        // DTO 객체 생성 및 값 설정
        dto.setCheckin((String) checkIn);
        dto.setCheckout((String)checkOut);
        dto.setSelectedHotel((String) selectedHotel);

        List<RoomDto> roomList = bookService.searchroom(dto);
        model.addAttribute("roomList", roomList);

        String hotelname = bookService.hotelname(Integer.parseInt((String) selectedHotel));
        model.addAttribute("hotelname", hotelname);

        session.setAttribute("hotelname",hotelname);

        return "/main/book/search_room";
    }

    @PostMapping("/payment")
    public String payment(HttpServletRequest request, Model model) {

        String roomnum = request.getParameter("roomnum");
        String hotelnum = request.getParameter("hotelnum");
        String roomtype = request.getParameter("roomtype");
        String roomprice = request.getParameter("roomprice");
        String roommemo = request.getParameter("roommemo");
        String roomdetail = request.getParameter("roomdetail");
        String totaldays = request.getParameter("totaldays");

        model.addAttribute("roomnum", roomnum);
        model.addAttribute("hotelnum", hotelnum);
        model.addAttribute("roomtype", roomtype);
        model.addAttribute("roomprice", roomprice);
        model.addAttribute("roommemo", roommemo);
        model.addAttribute("roomdetail", roomdetail);
        model.addAttribute("totaldays", totaldays);


        return "/main/book/payment";
    }

}
