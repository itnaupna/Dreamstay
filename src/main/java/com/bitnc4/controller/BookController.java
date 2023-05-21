package com.bitnc4.controller;

import com.bitnc4.dto.*;
import com.bitnc4.service.AdminHnRService;
import com.bitnc4.service.BookService;
import com.bitnc4.service.MainHnRService;
import com.bitnc4.service.MypageService;
import com.bitnc4.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private MypageService mypageService;

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

       /* System.out.println(checkIn);
        System.out.println(checkOut);*/

        List<RoomDto> roomList = bookService.searchroom(dto);
        //String[] photoArr = roomList.get(0).getRoomphoto().split(",");// roomList의 i번쨰 인덱스에서 roomphoto가져온 후 스플릿 -> 아중배열에 저장
        //{"photo1","photo2"}{"photo3","photo4"}{"photo5","photo6"}
        // 1번지 불러올 경우 -> {"photo1","photo2"} ->for문으로 하나씩
        String[][] photoArr = new String[roomList.size()][];
        for(int i = 0; i < roomList.size(); i++) {
            photoArr[i] = roomList.get(i).getRoomphoto().split(",");
        }

        for(int i = 0; i < photoArr.length; i++) {
            for(int j = 0; j < photoArr[i].length; j++) {
                System.out.println(i + "번지: " + photoArr[i][j]);
            }
        }

        model.addAttribute("photoArr", photoArr);
        model.addAttribute("roomList", roomList);

        String hotelname = bookService.hotelname(Integer.parseInt((String) selectedHotel));
        model.addAttribute("hotelname", hotelname);

        session.setAttribute("hotelname",hotelname);

        return "/main/book/search_room";
    }

//    @GetMapping("/paymentmain")
//    public String paymentmain()
//    {
//        return "/main/book/payment";
//    }

    @PostMapping("/payment")
    public String payment(HttpServletRequest request, Model model,HttpSession session) {
        MemberDto dto = (MemberDto) session.getAttribute("loginuser");

        String email;
        try{
            email  = dto.getEmail();
            String[] emailSplit = email.split("@");
            String username = emailSplit[0];
            String domain = emailSplit[1];
            MemberDto dto1 = (MemberDto) session.getAttribute("loginuser");
            String[] fnFn = dto1.getUser_name().split("/");
            model.addAttribute("familyname", fnFn[0]);
            model.addAttribute("firstname", fnFn[1]);
            /*String email = "1234@1234.1234"*/
            model.addAttribute("memberDto", dto);
            model.addAttribute("username", username);
            model.addAttribute("domain", domain);
        }catch(Exception e){
            model.addAttribute("username", "");
            model.addAttribute("domain", "");
            model.addAttribute("familyname", "");
            model.addAttribute("firstname", "");
        }

        String roomnum = request.getParameter("roomnum");
        String hotelnum = request.getParameter("hotelnum");
        String roomtype = request.getParameter("roomtype");
        String roomprice = request.getParameter("roomprice").replaceAll("원","").replaceAll(",","");
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

    @PostMapping("/insertbook")
    public String insertBook(MemberDto mdto, CardDto cdto, HttpServletRequest request, HttpSession session, BookDto bdto) {
        int maxMemberNum = bookService.maxMemberNum() + 1;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String nomemberId = formatter.format(date) + maxMemberNum;

        var nomember_name = request.getParameter("nomember_name");
        var pass = request.getParameter("pay_phone");
        var username = request.getParameter("email");
        var domain = request.getParameter("input_domain");
        var email = username + "@" + domain;
        var phone = request.getParameter("pay_phone");
        var addr = "비회원 예약 입니다.";


        int user_num;
        try {//회원이면 그냥 회원번호 받아오기
            user_num = ((MemberDto)session.getAttribute("loginuser")).getNum();
        }catch (Exception e){//비회원일때 처리
            //비회원일때 member 테이블에 추가
            mdto.setId(nomemberId);
            mdto.setPw(pass);
            mdto.setUser_name(username);
            mdto.setUser_name(nomember_name);
            mdto.setEmail(email);
            mdto.setPhone(phone);
            mdto.setAddr(addr);
            session.setAttribute("nomemberId",nomemberId);
            session.setAttribute("nomemberusername", nomember_name);

            bookService.insert_nomember(mdto);

            user_num = bookService.maxMemberNum();

        }


        //카드넣기
        String company = request.getParameter("company");
        int card_month = Integer.parseInt(request.getParameter("card_month").replaceAll("월",""));
        int card_year = Integer.parseInt(request.getParameter("card_year").replaceAll("년",""));
        String c_num1 = request.getParameter("c_num1");
        String c_num2 = request.getParameter("c_num2");
        String c_num3 = request.getParameter("c_num3");
        String c_num4 = request.getParameter("c_num4");
        String card_num = c_num1 + c_num2 + c_num3 + c_num4;

        cdto.setCompany(company);
        cdto.setCardnum(card_num);
        cdto.setCardmonth(card_month);
        cdto.setCardyear(card_year);
        cdto.setMembernum(user_num);

        String dbcard_num;
        dbcard_num = String.valueOf(bookService.select_card(cdto));
        if(dbcard_num.equals("null")){
            bookService.insert_card(cdto);
            dbcard_num = String.valueOf(bookService.select_card(cdto));
        }


        //예약 추기
        int roomnum = Integer.parseInt(request.getParameter("roomnum"));
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childrenCount = Integer.parseInt(request.getParameter("childrenCount"));
        String memo = request.getParameter("memo");
        int total_price = Integer.parseInt(request.getParameter("roomprice"));
        String peopleinfo = "{" + "\"adult\"" + ":" + "\"" + adultCount + "\"" + "," + "\"kids\"" + ":" + "\"" + childrenCount + "\"" + "}";

        bdto.setInsert_member_num(user_num);
        bdto.setCheckin(checkIn);
        bdto.setCheckout(checkOut);
        bdto.setInsert_roomnum(roomnum);
        bdto.setPeopleinfo(peopleinfo);
        bdto.setMemo(memo);
        bdto.setTotal_price(total_price);
        bdto.setCardnum(Integer.parseInt(dbcard_num));

        bookService.insert_book(bdto);




        return "redirect:/booksuccess";
    }

    @RequestMapping("/booksuccess")
    public String pop(HttpSession session, Model model){

        MemberDto dto = (MemberDto) session.getAttribute("loginuser");
        model.addAttribute("memberDto", dto);
        String nomemberId = (String) session.getAttribute("nomemberId");
        String nomemberusername = (String) session.getAttribute("nomemberusername");
        model.addAttribute("nomemberId",nomemberId);
        model.addAttribute("nomemberusername",nomemberusername);
            // <상혁 추가>
        try {
            MemberDto dto1 = (MemberDto) session.getAttribute("loginuser");
            String[] fnFn = dto1.getUser_name().split("/");
            model.addAttribute("familyname", fnFn[0]);
            model.addAttribute("firstname", fnFn[1]);
        }catch (Exception e){
            model.addAttribute("familyname", "");
            model.addAttribute("firstname", "");
        }

        return "/main/book/booksuccess";
    }

    @GetMapping("/book/deletebook")
    public String deletebook(int num, HttpSession session,Model model)
    {
        bookService.noMemberDeleteData(num);
        MemberDto dto = (MemberDto)session.getAttribute("loginuser");
//        List<Map<String, String>> map = mypageService.getmemberBookData(String.valueOf(dto.getNum()));
        model.addAttribute("data",dto);

        return "redirect:/";
    }
}


