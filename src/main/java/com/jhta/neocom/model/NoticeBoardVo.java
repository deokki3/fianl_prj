package com.jhta.neocom.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoticeBoardVo {
	private int n_board_no;
	private int mem_no;
	private String n_password;
	private int n_secret_chk;
	private String n_title;
	private String n_content;
	private Timestamp n_regdate;
	private int n_hit;
	private int n_group_no;
	private int n_group_order;
	private int n_group_depth;
	private String Nickname;
}
