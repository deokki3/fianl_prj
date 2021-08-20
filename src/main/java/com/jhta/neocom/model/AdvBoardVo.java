package com.jhta.neocom.model;




import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdvBoardVo {
	private int adv_board_no;
	private int mem_no;
	private String adv_password; 
	private int adv_secret_chk;
	private String adv_title;  
	private String adv_content; 
	private Date adv_regdate;
	private int adv_hit; 
	private int adv_group_no;
	private int adv_group_order;
	private int adv_group_depth;

}
	


