package com.bitnc4.mapper;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface MypageMapper {
    MemberDto selectInfoToId(String id);

    public void deleteUser(String id);

    public int matchForIdPw(Map<String, String> map);

    public int updateUserPass(Map<String, Object> map);

    public void updateUserInfo(MemberDto dto);

    public List<Map<String, String>> getmemberBookData(Map<String, String> data);

    public void deleteMemberBook(int num);

    public List<BookDto> selectForBookNum();

}
