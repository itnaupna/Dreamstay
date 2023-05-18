package com.bitnc4.service;

import java.util.List;
import java.util.Map;

public interface AdminBookServiceInter {
    public List<Map<String,Object>> getAll();
    public boolean deleteBook(int num);
    public boolean checkinBook(int num);
}
