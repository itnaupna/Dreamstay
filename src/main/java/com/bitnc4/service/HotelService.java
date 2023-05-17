package com.bitnc4.service;

import com.bitnc4.dto.HotelDto;
import com.bitnc4.mapper.HotelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class HotelService implements HotelServiceInter{

    @Autowired
    HotelMapper hotelMapper;
    @Override
    public List<HotelDto> getAllHotelData() {
        List<HotelDto> hotelList = hotelMapper.getAllHotelData();
        return hotelList;
    }


    @Override
    public List<Map<String, String>> getHotelData(int num) {
        return hotelMapper.getHotelData(num);
    }

    @Override
    public List<String> dividePhoto(List<Map<String, String>> list) {
        List<String> roomphoto = new ArrayList<>();

        for(int i = 0; i < list.size(); i++) {
            if(list.get(i).get("roomphoto") != null) {
                String[] arr = list.get(i).get("roomphoto").split(",");
                for (int j = 0; j < arr.length; j++) {
                    roomphoto.add(arr[j]);
                }
            }

        }
        return roomphoto;
    }
}
