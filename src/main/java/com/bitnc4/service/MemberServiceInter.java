package com.bitnc4.service;

import java.util.HashMap;
import java.util.Map;

public interface MemberServiceInter {

    public void mailCode(String mail, String code);

    public boolean codeAuth(HashMap<String, String> auth, String mail, String code);
}
