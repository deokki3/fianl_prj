package com.jhta.neocom.model;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PaymentVo {
	private int payment_num;
	private int order_no;
	private int payment_amount;
	private Date payment_date;
	private String payer_name;
	private String payment_bank;
	private String payment_means;
	private String payment_status;
	private String mid_num;
}


