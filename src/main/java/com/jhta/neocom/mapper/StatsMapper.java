package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

public interface StatsMapper {
    HashMap<String, Object> selectTotSales(HashMap<String, Object> map);

    HashMap<String, Object> selectMemberCount(HashMap<String, Object> map);

    HashMap<String, Object> selectAllMemberCount();

    HashMap<String, Object> selectCartCount();

    HashMap<String, Object> selectCancleCount();

    HashMap<String, Object> selectAllOrderCount();

    List<HashMap<String, Object>> selectTopSelling();

}
