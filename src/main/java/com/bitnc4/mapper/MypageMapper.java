package com.bitnc4.mapper;

import com.bitnc4.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.Map;

@Mapper
public interface MypageMapper {
    MemberDto selectInfoToId(String id);

    public void deleteUser(String id);

    public int matchForIdPw(Map<String, String> map);

    public int updateUserPass(Map<String, Object> map);

    public void updateUserInfo(MemberDto dto);


}
