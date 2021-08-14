package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OptionVo {
	private String option_id; //옵션코드(pk)
	private int product_id; //상품번호(fk)
	private String optionName; //옵션명
	private String optionValue; //옵션값

}
