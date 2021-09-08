package com.jhta.neocom.model;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductVo {
	private int product_id; // 상품번호 (pk)
	private String product_code; // 상품코드
	private int category_id; // 카테고리 코드(fk)
	private String product_name; // 상품명
	private String brand; // 브랜드명
	private String manufacturer; // 제조사명
	private int supply_price; // 공급가격
	private int consumer_price; // 소비자가격
	private int tax; // 과세비율
	private int selling_price; // 판매자가격
	private int stock; // 재고수량
	private Date regdate; // 등록날짜
	private Byte availability; // 판매여부

	List<Product_ImgVo> img_List;

}
