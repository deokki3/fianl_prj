package com.jhta.neocom.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FreeBoardVo {
	private int free_board_no;
	private int mem_no;
	private String free_password;
	private int free_secret_chk;
	private String free_title;
	private String free_content;
	private Timestamp free_regdate;
	private int free_hit;
	private int free_group_no;
	private int free_group_order;
	private int free_group_depth;
	private int free_show;
	private String Nickname;
}
