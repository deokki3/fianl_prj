package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Sns_memberInfo {
	private int sns_no;
	private int mem_no;
	private String sns_id;
	private String sns_type;
	private String sns_name;
}
