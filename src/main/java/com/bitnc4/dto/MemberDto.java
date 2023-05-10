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
}
