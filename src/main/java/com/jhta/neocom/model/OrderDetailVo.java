package com.jhta.neocom.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderDetailVo {
	private int order_detail_no;
	private int mem_no;
	private int product_id;
	private int order_no;
	private int product_count;

	private List<OrderDetailVo> orderDetailVoList;
	
	
}
