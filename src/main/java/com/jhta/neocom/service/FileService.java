package com.jhta.neocom.service;

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
}
