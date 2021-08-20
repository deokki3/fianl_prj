package com.jhta.neocom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.ImgFileMapper;
import com.jhta.neocom.model.Product_ImgVo;

@Service
public class ImgFileService {

	@Autowired
	private ImgFileMapper mapper;

	public void setDao(ImgFileMapper mapper) {
		this.mapper = mapper;
	}

	public int insert(Product_ImgVo vo) {
		return mapper.insert(vo);
	}

	public List<Product_ImgVo> list() {
		return mapper.list();
	}

	public List<Product_ImgVo> find(int product_id) {
		return mapper.find(product_id);
	}

	public int delete(int product_img_no) {
		return mapper.delete(product_img_no);
	}

	public int update(Product_ImgVo vo) {
		return mapper.update(vo);
	}

	public Product_ImgVo selectone(int product_id) {
		return mapper.selectone(product_id);
	}

}
