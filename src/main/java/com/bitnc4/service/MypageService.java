package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.mapper.MypageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class MypageService implements MypageServiceInter{

    @Autowired
    private MypageMapper mypageMapper;

    @Override
    public MemberDto selectInfoToId(String id) {
        return mypageMapper.selectInfoToId(id);
    }

    @Override
    public void deleteUser(String id) {
        mypageMapper.deleteUser(id);
    }

    @Override
    public int matchForIdPw(String id, String pw) {
        Map<String, String> idpwchk = new HashMap<String, String>();
        idpwchk.put("id", id);
        idpwchk.put("pw", pw);
        return mypageMapper.matchForIdPw(idpwchk);

    }

    @Override
    public int updateUserPass(String id, String pw) {
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("pw",pw);
        return mypageMapper.updateUserPass(map);
    }

    @Override
    public void updateUserInfo(MemberDto dto) {
        mypageMapper.updateUserInfo(dto);
    }



}
