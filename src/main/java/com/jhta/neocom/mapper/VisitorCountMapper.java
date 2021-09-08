package com.jhta.neocom.mapper;

import java.util.List;

import com.jhta.neocom.model.VisitorCountVo;

public interface VisitorCountMapper {
    int insert(VisitorCountVo vo);

    List<VisitorCountVo> selectAll();
}
