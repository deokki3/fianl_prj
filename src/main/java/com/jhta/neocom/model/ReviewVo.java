package com.jhta.neocom.model;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReviewVo {

	private int board_num;
	private int mem_no;
	private String Nickname;
	private int product_id;
	private String review_title;
	private String review_content;
	private int star;
	private String review_img;
	private String review_img_origin;
	private Timestamp regdate;
}
