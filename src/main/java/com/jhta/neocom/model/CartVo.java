package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CartVo {
	private int cart_no;
	private int mem_no;
	private int product_id;
	private int product_count;
	private String product_name;
	private int selling_price;
	private String img_name_save;
}
