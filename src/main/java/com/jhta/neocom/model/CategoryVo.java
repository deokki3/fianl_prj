package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoryVo {
	private int category_id; //카테고리 코드(pk)
	private String category_name; //카테고리명
	private int category_parent; //상위 카테고리 코드(fk)
	private int category_order; //카테고리 정렬순서

}
