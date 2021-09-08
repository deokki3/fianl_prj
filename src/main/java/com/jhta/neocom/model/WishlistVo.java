package com.jhta.neocom.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class WishlistVo {
	private int wish_no;
	private int mem_no;
	private int product_id;
	private Timestamp wish_date;
}
