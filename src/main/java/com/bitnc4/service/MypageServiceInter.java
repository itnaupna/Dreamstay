package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;

import java.util.HashMap;


public interface MypageServiceInter {
    public MemberDto selectInfoToId(String id);

    public void deleteUser(String id);

    public int matchForIdPw(String id, String pw);

    public int updateUserPass(String id, String pw);
}
