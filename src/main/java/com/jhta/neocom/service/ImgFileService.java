package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.ImgFileMapper;
import com.jhta.neocom.model.Product_ImgVo;



@Service
public class ImgFileService {
	@Autowired private ImgFileMapper mapper;
	public void setDao(ImgFileMapper mapper) {
		this.mapper = mapper;
	}

	public int insert(Product_ImgVo vo) {
		return mapper.insert(vo);
	}
	public List<Product_ImgVo> list(HashMap<String,Object> map){
		return mapper.list(map);
		
	}
	public int getCount(HashMap<String,Object> map) {
		return mapper.count(map);
	}
	public Product_ImgVo find(int product_img_no) {
		return mapper.find(product_img_no);
	}
	public int delete(int product_img_no) {
		return mapper.delete(product_img_no);
	}
	public int update(Product_ImgVo vo) {
		return mapper.update(vo);
	}
	
	
}
