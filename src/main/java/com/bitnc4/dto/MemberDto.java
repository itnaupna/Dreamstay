package com.bitnc4.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberDto {
    private int num;
    private String id;
    private String pw;
    private String user_name;
    private String email;
    private String phone;
    private int user_level;
    private String addr;
    private int account_lock;
    private int email_code;
    private int point;
    private int issocial;

    // 소셜 로그인 개수가 많아져서 아이디나 이메일이 중복될경우가 발생,
    // 가입한 소셜의 이름을 id와 email에 붙혀주는 용도 ex) 네이버 가입 -> id = naver-****, email = naver-******@naver.com
    private String social;
}
