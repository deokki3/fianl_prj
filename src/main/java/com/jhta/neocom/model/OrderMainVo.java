package com.jhta.neocom.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderMainVo {
	private int order_no;
	private int mem_no;
	private int order_num;
	private String orderer_name;
	private String recipient_name;
	private String zip_code;
	private String order_address;
	private String order_address_detail;
	private int tot_price;
	private int delivery_cost;
	private Date order_date;
	private String order_status;
	private String payment_status;
	private String od_cc_status;
	private String delivery_status;
	private String request_item;
	private String mid_num;

	private String order_detail_no;
	private String uploadPath;
	private String img_name_save;
	private String product_name;
	private int product_id;
	private int category_id;
}
