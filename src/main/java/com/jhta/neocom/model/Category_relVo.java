package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Category_relVo {
	private int category_rel_no; //참조카테고리 번호
	private int product_id; // 상품번호(fk)
	private int category_id; //카테고리 코드(fk)

}
