package com.suyeon.service;

import java.util.List;

import com.suyeon.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> list(String category);
	public BoardDto read(long num, String category);
	public void del(long num);	//Service랑 ServiceImple의 함수는 같아야함 
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	
}
