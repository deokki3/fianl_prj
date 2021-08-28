package com.jhta.neocom.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

import com.jhta.neocom.dto.Product_ImgDTO;
import com.jhta.neocom.mapper.ImgFileMapper;
import com.jhta.neocom.model.Product_ImgVo;

@Service
public class ImgFileService {
	@Value("${spring.servlet.multipart.location}")
	private String uploadFilePath;

	@Autowired
	private ImgFileMapper mapper;

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Product_ImgDTO uploadImg(MultipartFile img, int product_id, String img_category) {

		if (img == null) {
			return null;
		}

		// 업로드할 폴더의 경로
		String uploadFolder = uploadFilePath + "product_img/";

		File uploadPath = new File(uploadFolder, getFolder());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		String img_name_origin = img.getOriginalFilename(); // 전송된 파일명
		String img_name_save = UUID.randomUUID() + "_" + img_name_origin;
		long img_size = img.getSize();

		try {
			File saveFile = new File(uploadPath, img_name_save);
			img.transferTo(saveFile);

			if (checkImageType(saveFile)) {
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + img_name_save));
				Thumbnailator.createThumbnail(img.getInputStream(), thumbnail, 100, 100); // 섬네일 크기

				thumbnail.close();
			}

			// 업로드된 파일정보 dto에 저장하기
			Product_ImgDTO dto = new Product_ImgDTO(product_id, img_name_save, img_name_origin,
					uploadPath.getAbsolutePath(), img_size, img_category);

			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void setDao(ImgFileMapper mapper) {
		this.mapper = mapper;
	}

	public int insert(Product_ImgVo vo) {
		return mapper.insert(vo);
	}

	public List<Product_ImgVo> list() {
		return mapper.list();
	}

	public List<Product_ImgVo> find(int product_id) {
		return mapper.find(product_id);
	}

	public int delete(int product_img_no) {
		return mapper.delete(product_img_no);
	}

	public int update(Product_ImgVo vo) {
		return mapper.update(vo);
	}

	public Product_ImgVo selectone(int product_id) {
		return mapper.selectone(product_id);
	}

}
