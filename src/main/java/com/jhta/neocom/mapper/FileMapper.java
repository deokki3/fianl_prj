package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.FileVo;

public interface FileMapper {
	int fileInsert(FileVo vo);
	List<HashMap<String,Object>> fileList(int free_board_no);
	FileVo fileInfo(int file_num);
	List<FileVo> findFileNum(int free_board_no);
	int fileDelete(int file_num);
}
