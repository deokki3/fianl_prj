package com.jhta.neocom.mapper;

import java.util.List;

import com.jhta.neocom.model.Product_ImgVo;

public interface ImgFileMapper {
	int insert(Product_ImgVo vo);

	List<Product_ImgVo> list();

	int delete(int product_img_no);

	List<Product_ImgVo> find(int product_id);

	int update(Product_ImgVo vo);

	Product_ImgVo selectone(int product_id);

}
