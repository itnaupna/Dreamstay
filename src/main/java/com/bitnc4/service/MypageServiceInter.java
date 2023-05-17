package com.bitnc4.service;

import com.bitnc4.dto.BookDto;
import com.bitnc4.dto.MemberDto;

import java.util.List;
import java.util.Map;


public interface MypageServiceInter {
    public MemberDto selectInfoToId(String id);

    public void deleteUser(String id);

    public int matchForIdPw(String id, String pw);

    public int updateUserPass(String id, String pw);

    public void updateUserInfo(MemberDto dto);

    public List<Map<String, String>> getmemberBookData(String searchnum);

    public void deleteMemberBook(int num);

    public List<BookDto> selectForBookNum();
}
