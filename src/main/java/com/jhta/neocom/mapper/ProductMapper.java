package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.ProductVo;







public interface ProductMapper {
	int insert(ProductVo vo);
	List<HashMap<String, Object>> list(HashMap<String,Object> map);
	int count(HashMap<String,Object> map);
	int delete(int product_id);
	ProductVo find(int product_id);
	int update(ProductVo vo);
	List<ProductVo> listTest();
	ProductVo select(int product_id);
}
