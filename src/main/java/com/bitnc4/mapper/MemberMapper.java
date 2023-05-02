package com.bitnc4.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    // 회원 수
    public int memberCnt();

    // id중복검사
    public boolean overlapId();


}
