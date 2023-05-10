package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface MainHnrServiceInter {
    List<HotelDto> getHotels();
}
