package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.mapper.StatsMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatsService {
    @Autowired
    StatsMapper mapper;

    public HashMap<String, Object> selectTotSales(HashMap<String, Object> map) {
        return mapper.selectTotSales(map);
    }

    public HashMap<String, Object> selectMemberCount(HashMap<String, Object> map) {
        return mapper.selectMemberCount(map);
    }

    public HashMap<String, Object> selectAllMemberCount() {
        return mapper.selectAllMemberCount();
    }

    public HashMap<String, Object> selectCartCount() {
        return mapper.selectCartCount();
    }

    public HashMap<String, Object> selectCancleCount() {
        return mapper.selectCancleCount();
    }

    public HashMap<String, Object> selectAllOrderCount() {
        return mapper.selectAllOrderCount();
    }

    public List<HashMap<String, Object>> selectTopSelling() {
        return mapper.selectTopSelling();
    }

}
