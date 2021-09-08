package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AddressVo {
	private int addr_no;
	private int mem_no;
	private String zip_code;
	private String address;
	private String adress_detail;
	private String address_name;
}
