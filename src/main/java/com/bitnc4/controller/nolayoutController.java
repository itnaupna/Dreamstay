package com.bitnc4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class nolayoutController {

    @GetMapping("/se2/photoupload")
    public String photouploader(){
        return "/nolayout/se2/photo_uploader/popup/photo_uploader";
    }
    @GetMapping("/se2/eong")
    public String testpage(){
        return "/nolayout/chat/room";
    }
}
