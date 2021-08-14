package com.neocom.mybatis.views;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
/*
 * 커스텀 뷰 - 사용자가 직접 만드는 뷰(다운로드창으로 응답하는 뷰,엑셀파일로 응답하는 뷰,PDF로 응답하는 뷰등...)
 */
public class FileDownloadView extends AbstractView{
	// 뷰에서 해야 할 작업 구현 - 다운로드 창으로 응답
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 1. 다운로드 창으로 응답하기
		setContentType("application/octet-stream");
		File f=(File)model.get("file");
		long filesize=(Long)model.get("filesize");
		String filename=(String)model.get("filename");
		response.setContentLengthLong(filesize);
		filename=URLEncoder.encode(filename,"utf-8");
		filename.replaceAll("\\+", "%20");
		response.setHeader("Content-Disposition","attachment;filename=" + filename);
		
		// 2. 파일 다운로드 하기
		OutputStream os=response.getOutputStream();
		FileInputStream fis=new FileInputStream(f);
		FileCopyUtils.copy(fis,os);
		fis.close();
		os.close();
	}

}

















