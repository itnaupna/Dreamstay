package com.bitnc4.mapper;

import com.bitnc4.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MemberMapper {

    // 회원 수
    public int memberCnt();

    // id중복검사
    public int overlapId(String id);

    // email 중복검사
    public int overlapEmail(String email);
    
    // 회원가입
    public void joinMember(MemberDto dto);

    // 사이트에서 가입한 아이디인지 확인
    public int joinSiteMember(String id);

    // 로그인
    public MemberDto access(Map<String, String> idpw);

    // db에 있는 id && email 인지 확인
    public int overlapIdEmail(Map<String, String> idemail);
    
    // email로 db 정보 불러오는 메서드
    public MemberDto searchInfoToEmail(String email);

    // 비밀번호 변경
    public void changePassword(Map<String, String> changepw);
    
    // 비밀번호 틀린 횟수 카운팅
    public void accountLockCount(String id);

    // 틀린횟수 출력
    public int showLockCount(String id);

    // 로그인 성공시 틀린 횟수 리셋
    public void resetLockCount(String id);

    // 멤버num으로 DTO 얻기
    public MemberDto getMemberByNumber(int num);

    // 소셜 첫 로그인 시 db에 추가
    public void socialJoin(MemberDto social);

    // 소셜 로그인 시 기존에 해당소셜로 가입한 회원인지 확인
    public MemberDto getSocialMember(Map<String, String> socialMemberChk);

}
