package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.FileMapper;
import com.jhta.neocom.model.FileVo;

@Service
public class FileService {
	@Autowired private FileMapper mapper;
	
	public int fileInsert(FileVo vo) {
		return mapper.fileInsert(vo);
	}
	
	public List<HashMap<String,Object>> fileList(int free_board_no) {
		return mapper.fileList(free_board_no);
	}
	
	public FileVo fileInfo(int file_num) {
		return mapper.fileInfo(file_num);
	}
	
	public List<FileVo> findFileNum(int free_board_no) {
		return mapper.findFileNum(free_board_no);
	}
	
	public int fileDelete(int file_num) {
		return mapper.fileDelete(file_num);
	}
}
