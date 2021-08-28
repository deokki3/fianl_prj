package com.jhta.neocom.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderCancelVo {
	private int order_cancel;
	private int order_no;
	private int payment_num;
	private String od_cc_reason;
	private Date od_cc_application_date;
	private Date od_cc_complete_date;
	private String od_cc_status;
}
