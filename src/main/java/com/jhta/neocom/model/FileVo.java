package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FileVo {
	private int file_num;
	private int free_board_no;
	private String file_name_org;
	private String file_name_save;
	private int file_cnt;
	private long file_size;
}
