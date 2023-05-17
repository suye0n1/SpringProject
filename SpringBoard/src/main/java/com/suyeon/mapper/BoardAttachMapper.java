package com.suyeon.mapper;

import java.util.List;

import com.suyeon.dto.BoardAttachDto;

public interface BoardAttachMapper {
	public void imageInsert(BoardAttachDto attach);
	public List<BoardAttachDto> findByNum(int num);

}
