package com.suyeon.mapper;

import java.util.List;

import com.suyeon.dto.BoardAttachDto;
import com.suyeon.dto.BoardDto;

public interface BoardAttachMapper {
	public void imageInsert(BoardAttachDto attach);
	public void imageDelete(String uuid);
	public List<BoardAttachDto> findByNum(int num);

}
