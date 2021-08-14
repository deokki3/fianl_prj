package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.Product_ImgVo;




public interface ImgFileMapper {
	int insert(Product_ImgVo vo);
	List<Product_ImgVo> list(HashMap<String,Object> map);
	int count(HashMap<String,Object> map);
	int delete(int product_img_no);
	Product_ImgVo find(int product_img_no);
	int update(Product_ImgVo vo);
}
