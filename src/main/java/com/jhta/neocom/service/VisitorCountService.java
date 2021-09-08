package com.jhta.neocom.service;

import java.util.List;

import com.jhta.neocom.mapper.VisitorCountMapper;
import com.jhta.neocom.model.VisitorCountVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorCountService {
    @Autowired
    private VisitorCountMapper mapper;

    public int insert(VisitorCountVo vo) {
        return mapper.insert(vo);
    }

    public List<VisitorCountVo> selectAll() {
        return mapper.selectAll();
    }
}
