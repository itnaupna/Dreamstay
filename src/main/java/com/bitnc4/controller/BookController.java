package com.bitnc4.controller;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.BookService;
import com.bitnc4.service.MainHnRService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    private HttpSession session;

    @Autowired
    BookService bookService;

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
    
    
    // 비회원 예약 체크
    Map<String, String> bookSearch;
    @PostMapping("/book/bookchk")
    @ResponseBody
    public int bookChk(String searchnum, String bookpw) {
        bookSearch = bookService.getNomemberBookData(searchnum, bookpw);
        if(bookSearch == null) {
            return 0;
        } else {
            return bookSearch.size();
        }
    }
    
    // 비회원 예약 페이지 이동
    @PostMapping("/book/nomemberbooksearch")
    public String nomemberBookSearch(Model model) {
        bookSearch.put("user_name", bookSearch.get("user_name").replaceAll("/", ""));
        for(String key : bookSearch.keySet()) {
            System.out.println("key: " + key + "  /  value: " + String.valueOf(bookSearch.get(key)));
        }
        model.addAttribute("booksearch", bookSearch);
        return "/main/book/nomemberbooksearch";
    }
}

