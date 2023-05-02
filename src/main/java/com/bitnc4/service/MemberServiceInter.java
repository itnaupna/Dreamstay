package com.bitnc4.service;

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
    public boolean overlapId();


}
