package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;

import java.util.HashMap;
import java.util.Map;

public interface MemberServiceInter {

    // 인증코드 발송
    public void mailCode(String mail, String code);

    // 인증코드 검사
    public boolean codeAuth(HashMap<String, String> auth, String mail, String code);

    // 시간초과 시 인증번호 삭제
    public boolean deleteCode(HashMap<String, String> auth, String email);

    // (db연결 테스트) 회원 수 가져옴
    public int memberCnt();

    // ID 중복검사
    public int overlapId(String id);

    // email 중복검사
    public int overlapEmail(String email);

    // 회원가입
    public void joinMember(MemberDto dto);

    // 사이트에서 가입한 아이디인지 확인
    public int joinSiteMember(String id);

    // 로그인
    public MemberDto access(String id, String pw);

    // email로 db 정보 불러오는 메서드
    public MemberDto searchInfoToEmail(String email);

    // 비밀번호 변경
    public void changePassword(String id, String pw);
    
    // 비빌번호 틀린 횟수 카운팅
    public void accountLockCount(String id);

    // 틀린횟수 출력
    public int showLockCount(String id);

    // 로그인 성공시 틀린 횟수 리셋
    public void resetLockCount(String id);

    // 소셜 첫 로그인 시 db에 추가
    public void socialJoin(MemberDto socialData);

    // 소셜 로그인 시 기존에 해당소셜로 가입한 회원인지 확인
    public MemberDto getSocialMember(String id, String issocial, String social);


    //멤버 num으로 DTO 얻기
    public MemberDto getMemberByNumber(int num);
}
