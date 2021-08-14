package com.jhta.neocom.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FormData {
	private int product_img_no;
	private int product_id;
	private MultipartFile file1;
}
