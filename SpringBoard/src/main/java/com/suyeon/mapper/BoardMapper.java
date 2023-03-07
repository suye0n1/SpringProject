package com.suyeon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.suyeon.dto.BoardDto;

public interface BoardMapper {
	public List<BoardDto> list(String castegory);
//	parameter값을 가져올 수 없다고 오류 ㅡ> @Param으로 주기
	public BoardDto read(@Param("num") long num, @Param("category") String category);
	public void del(long num);
	public void viewCount(long num);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
}
