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

    // 로그인
    public int access(Map<String, String> idpw);

}
