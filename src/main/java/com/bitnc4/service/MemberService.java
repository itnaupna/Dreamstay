package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
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

        MimeMessage mimeMessage = mailSender.createMimeMessage();

        try {
            MimeMessageHelper mmh = new MimeMessageHelper(mimeMessage, "UTF-8");

            mmh.setFrom("helloa1109@naver.com");
            mmh.setTo(mail);
            mmh.setSubject("Dream Stay 이메일 인증번호");
            mmh.setText("<div style='background-color: black; width: 800px; height: 700px; margin: 80px auto 0 auto'>\n" +
                    "    <img src='https://kr.object.ncloudstorage.com/dreamsstaybucket/logo_black500x150.png' style='margin: 40px 0 0 20px;'>\n" +
                    "    <div style='text-align: center'>\n" +
                    "        <span style='color: white; display: inline-block; font-size: 30px; width: 400px; margin: 100px 0 30px 0'>Dream Stay 가입 인증번호</span>\n" +
                    "        <div style='width: 400px; height: 60px; line-height:60px; display: inline-block; background-color: #ffffff'>\n" +
                    "            <span style='color: black; font-size: 25px; font-weight: bold;'>" + code + "</span>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>", true);

            mailSender.send(mimeMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
    public void socialJoin(MemberDto socialData) {
        memberMapper.socialJoin(socialData);
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