package com.jhta.neocom.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnABoardVo {
	private int qna_board_no;
	private int mem_no;
	private String qna_password;
	private int qna_secret_chk;
	private String qna_title;
	private String qna_content;
	private Timestamp qna_regdate;
	private int qna_hit;
	private int qna_group_no;
	private int qna_group_order;
	private int qna_group_depth;
	private int qna_status;
	private int qna_show;
	private String Nickname;
}
