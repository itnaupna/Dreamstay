package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;


public interface MypageServiceInter {
    public MemberDto selectInfoToId(String id);

    public void deleteUser(String id);

    public int matchForIdPw(String id, String pw);

    public int updateUserPass(String id, String pw);

    public void updateUserInfo(MemberDto dto);
}
