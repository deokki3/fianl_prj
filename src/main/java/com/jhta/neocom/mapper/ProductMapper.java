package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.ProductVo;

public interface ProductMapper {
	int insert(ProductVo vo);

	List<HashMap<String, Object>> list(HashMap<String, Object> map);

	int count(HashMap<String, Object> map);

	int delete(int product_id);

	int update(ProductVo vo);

	List<ProductVo> selectAll();

	ProductVo select(int product_id);

//	List<ProductVo> selectone(int product_id);
	
	List<ProductVo> purchaseList(int product_id);


	List<HashMap<String, Object>> optionlist(HashMap<String, Object> map);
	
	List<HashMap<String, Object>> findcate(HashMap<String, Object> map);

}
