package com.jhta.neocom.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.CategoryMapper;
import com.jhta.neocom.model.CategoryVo;

@Service
public class CategoryService {

	@Autowired
	private CategoryMapper mapper;

	public int insert(CategoryVo vo) {
		return mapper.insert(vo);
	}

	public CategoryVo find(int category_id) {
		return mapper.find(category_id);
	}

	public List<CategoryVo> findChild(int category_parent) {
		return mapper.findChild(category_parent);
	}

	public int delete(int category_id) {
		return mapper.delete(category_id);
	}

	public int update(CategoryVo vo) {
		return mapper.update(vo);
	}

	public List<CategoryVo> list() {
		return mapper.list();
	}

	public String selectone(HashMap<String, Integer> map) {	
		return mapper.selectone(map);

	}

	public List<HashMap<String, Integer>> selectjoin(int product_id) {
		return mapper.selectjoin(product_id);
		
	}
	public List<CategoryVo> classification(int category_id){
		return mapper.classification(category_id);
	}

}
