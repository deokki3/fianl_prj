package com.jhta.neocom.mapper;

import java.util.List;

import com.jhta.neocom.model.Category_relVo;

public interface Category_relMapper {
    public int insert(Category_relVo vo);

    public int delete(int category_rel_no);

    public Category_relVo find(int category_rel_no);

    public List<Category_relVo> list();
}
