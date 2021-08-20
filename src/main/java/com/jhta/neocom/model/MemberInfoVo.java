package com.jhta.neocom.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberInfoVo {
	private int mem_no;
	private String nickname;
	private String phone;
	private Date birth_date;
	private Date reg_date;
	private String name;
	private String id;
	private String pwd;
}
