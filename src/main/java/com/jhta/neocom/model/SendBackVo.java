package com.jhta.neocom.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SendBackVo {
	private int return_no;
	private int order_no;
	private int payment_num;
	private String return_reason;
	private Date return_application_date;
	private Date return_receipt_date;
	private Date return_withdrawal_date;
	private Date return_complete_date;
	private String return_status;
}
