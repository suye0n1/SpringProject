package com.suyeon.service;

import java.util.List;

import com.suyeon.dto.BoardAttachDto;
import com.suyeon.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> list(String category);
	public BoardDto read(int num, String category);
	public void del(int num);	//Service랑 ServiceImple의 함수는 같아야함 
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	
	public int likeCheck(int num, String user_id);
	public void insertLike(int num, String user_id);
	public void updateLike(int num);
	public void updateLikeCheck(int num, String user_id);
	public void updateLikeCheckCancel(int num, String user_id);
	public void updateLikeCancel(int num);
	public void deleteLike(int num, String user_id);


}
