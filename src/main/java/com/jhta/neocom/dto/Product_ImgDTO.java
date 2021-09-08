package com.jhta.neocom.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product_ImgDTO {
    private String img_name_save; // 이미지이름(저장)
    private String img_name_origin; // 이미지이름
    private String uploadPath; // 업로드 경로
    private Long img_size; // 이미지 사이즈
    private String img_category; // 이미지 카테고리
}
