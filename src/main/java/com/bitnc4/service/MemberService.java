package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service
public class MemberService implements MemberServiceInter {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private MemberMapper memberMapper;

    // 메일 전송
    @Override
    public void mailCode(String mail, String code) {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("helloa1109@naver.com");
        msg.setTo(mail);
        msg.setSubject("Dream Stay 이메일 인증번호");
        msg.setText(code);

        mailSender.send(msg);
    }

    // 이미 가입된 이메일이 있는지 확인
    @Override
    public int overlapEmail(String email) {
        return memberMapper.overlapEmail(email);
    }

    // 이메일과 인증코드가 맞다면 인증코드 삭제 후 true
    @Override
    public boolean codeAuth(HashMap<String, String> auth, String mail, String code) {
        boolean certification = false;
        if(auth.get(mail) == null){return false;}

        if(auth.get(mail).equals(code)) {
            certification = true;
            auth.remove(mail);
        }
        return certification;
    }

    // 시간초과 시 보냈던 인증번호 삭제 후 false
    @Override
    public boolean deleteCode(HashMap<String, String> auth, String email) {
        if(auth.containsKey(email)) {
            auth.remove(email);
        }
        return false;
    }

    // 가입된 멤버 수 출력
    @Override
    public int memberCnt() {
        return memberMapper.memberCnt();
    }

    // 아이디 중복 검사
    @Override
    public int overlapId(String id) {
        return memberMapper.overlapId(id);
    }

    // 회원가입
    @Override
    public void joinMember(MemberDto dto) {
        memberMapper.joinMember(dto);
    }

    // 로그인
    @Override
    public int access(String id, String pw) {
        Map<String, String> idpwChk = new HashMap<String, String>();
        idpwChk.put("id", id);
        idpwChk.put("pw", pw);

        return memberMapper.access(idpwChk);
    }

}