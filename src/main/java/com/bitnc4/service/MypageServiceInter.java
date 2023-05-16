package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;

import java.util.Map;


public interface MypageServiceInter {
    public MemberDto selectInfoToId(String id);

    public void deleteUser(String id);

    public int matchForIdPw(String id, String pw);

    public int updateUserPass(String id, String pw);

    public void updateUserInfo(MemberDto dto);

    public Map<String, String> getmemberBookData(String searchnum);
}
