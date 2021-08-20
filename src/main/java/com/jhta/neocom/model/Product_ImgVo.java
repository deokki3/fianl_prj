package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product_ImgVo {
	private int product_img_no; // 제품 이미지 번호(pk)
	private int product_id; // 상품번호(fk)
	private String img_name_save; // 이미지이름(저장)
	private String img_name_origin; // 이미지이름

	private long img_size; // 이미지 사이즈
	private String img_category; // 이미지카테고리
}
