package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.ProductMapper;
import com.jhta.neocom.model.ProductVo;



@Service
public class ProductService {
	
	@Autowired private ProductMapper mapper;
	public void setDao(ProductMapper mapper) {
		this.mapper = mapper;
	}
	
	public int insert(ProductVo vo) {
		 return mapper.insert(vo); 
		
	}
	public List<HashMap<String, Object>> list(HashMap<String,Object> map){
		return mapper.list(map);
		
	}
	public int getCount(HashMap<String,Object> map) {
		return mapper.count(map);
	}

	public int delete(int product_id) {
		return mapper.delete(product_id);
	}
	public int update(ProductVo vo) {
		return mapper.update(vo);
	}
	public List<ProductVo> listTest(){
		return mapper.listTest();
	}
	public ProductVo select(int product_id) {
		return mapper.select(product_id);
	}
	
	


}
