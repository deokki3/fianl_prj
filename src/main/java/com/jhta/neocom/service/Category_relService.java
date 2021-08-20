package com.jhta.neocom.service;

import java.util.List;

import com.jhta.neocom.mapper.Category_relMapper;
import com.jhta.neocom.model.Category_relVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Category_relService {
    @Autowired
    private Category_relMapper mapper;

    public int insert(Category_relVo vo) {
        return mapper.insert(vo);
    }

    public int delete(int category_rel_no) {
        return mapper.delete(category_rel_no);
    }

    public Category_relVo find(int category_rel_no) {
        return mapper.find(category_rel_no);
    }

    public List<Category_relVo> list() {
        return mapper.list();
    }
}
