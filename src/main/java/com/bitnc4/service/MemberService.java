package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

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
    
    // 아이디 비밀번호 찾기 시 가입된 아이디, 이메일인지 확인
    public int overlapEmail(String email, String id) {
        if(id.equals("")) {
            return memberMapper.overlapEmail(email);
        } else {
            Map<String, String> idemail = new HashMap<String, String>();
            idemail.put("email", email);
            idemail.put("id", id);
            return memberMapper.overlapIdEmail(idemail);
        }

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
        System.out.println(auth.size());
        return certification;
    }

    // 시간초과 시 보냈던 인증번호 삭제 후 false
    @Override
    public boolean deleteCode(HashMap<String, String> auth, String email) {
        if(auth.containsKey(email)) {
            auth.remove(email);
        }
        System.out.println(auth.size());
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

    // 사이트에서 가입한 멤버인지 확인
    @Override
    public int joinSiteMember(String id) {
        return memberMapper.joinSiteMember(id);
    }

    // 로그인
    @Override
    public MemberDto access(String id, String pw) {
        Map<String, String> idpwChk = new HashMap<String, String>();
        idpwChk.put("id", id);
        idpwChk.put("pw", pw);

        return memberMapper.access(idpwChk);
    }

    @Override
    public MemberDto searchInfoToEmail(String email) {
        MemberDto dto = memberMapper.searchInfoToEmail(email);
        return dto;
    }

    @Override
    public void changePassword(String id, String pw) {
        Map<String, String> changepw = new HashMap<String, String>();
        changepw.put("id", id);
        changepw.put("pw", pw);
        memberMapper.changePassword(changepw);
    }

    @Override
    public void accountLockCount(String id) {
        memberMapper.accountLockCount(id);
    }

    @Override
    public int showLockCount(String id) {
        return memberMapper.showLockCount(id);
    }

    @Override
    public void resetLockCount(String id) {
        memberMapper.resetLockCount(id);
    }

    @Override
    public MemberDto getMemberByNumber(int num) {
        return memberMapper.getMemberByNumber(num);
    }

    @Override
    public void socialJoin(MemberDto social) {
        memberMapper.socialJoin(social);
    }

    @Override
    public MemberDto getSocialMember(String id,  String issocial, String social) {
        Map<String, String> memberChk = new HashMap<String, String>();
        memberChk.put("id", id);
        memberChk.put("issocial", issocial);
        memberChk.put("social", social);
        return memberMapper.getSocialMember(memberChk);
    }

}