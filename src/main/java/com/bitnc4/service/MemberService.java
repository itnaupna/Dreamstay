package com.bitnc4.service;

import com.bitnc4.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Random;

@Service
public class MemberService implements MemberServiceInter {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public void mailCode(String mail, String code) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("helloa1109@naver.com");
        msg.setTo(mail);
        msg.setSubject("Dream Stay 이메일 인증번호");
        msg.setText(code);

        mailSender.send(msg);
    }

    @Override
    public boolean codeAuth(HashMap<String, String> auth, String mail, String code) {
        boolean certification = false;
        System.out.println("service" + auth.size());
        for(int i = 0; i < auth.size(); i++) {

            if(auth.get(mail).equals(code)) {
                certification = true;
                auth.remove(mail);
                break;
            }
        }
        return certification;
    }

    @Override
    public int memberCnt() {
        return memberMapper.memberCnt();
    }

    @Override
    public boolean overlapId() {
        return memberMapper.overlapId();
    }
}
