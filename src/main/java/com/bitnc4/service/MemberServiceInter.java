package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;

import java.util.HashMap;
import java.util.Map;

public interface MemberServiceInter {
    
    // 인증코드 발송
    public void mailCode(String mail, String code);
    
    // 인증코드 검사
    public boolean codeAuth(HashMap<String, String> auth, String mail, String code);
    
    // (db연결 테스트) 회원 수 가져옴
    public int memberCnt();
    
    // ID 중복검사
    public int overlapId(String id);

    // email 중복검사
    public int overlapEmail(String email);
    
    // 회원가입
    public void joinMember(MemberDto dto);


}
