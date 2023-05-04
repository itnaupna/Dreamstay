package com.bitnc4.controller;


import com.bitnc4.dto.ChatRoomDto;
import com.bitnc4.repo.ChatRoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@Controller
@RequestMapping("/chat")
public class ChatRoomController {

    @Autowired
    private final ChatRoomRepository chatRoomRepository;

    @GetMapping("/room")
    public String rooms(Model m){
        return "/main/chat/room";
    }

    @GetMapping("/rooms")
    @ResponseBody
    public List<ChatRoomDto> room(){
        return chatRoomRepository.getAll();
    }

    @PostMapping("/room")
    @ResponseBody
    public ChatRoomDto createRoom(String name){
        return chatRoomRepository.createChatRoom(name);
    }

    @GetMapping("/room/enter/{roomId}")
    public String roomDetail(Model m, @PathVariable String roomId){
        m.addAttribute("roomId",roomId);
        return "/main/chat/detail";
    }

    @GetMapping("/room/{roomId}")
    @ResponseBody
    public ChatRoomDto roomInfo(@PathVariable String roomId){
        return chatRoomRepository.getRoomById(roomId);
    }
}
