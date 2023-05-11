package com.suyeon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.suyeon.dto.BoardAttachDto;
import com.suyeon.dto.BoardDto;

public interface BoardMapper {
	public List<BoardDto> list(String castegory);
//	parameter값을 가져올 수 없다고 오류 ㅡ> @Param으로 주기
	public BoardDto read(@Param("num") int num, @Param("category") String category);
	public void del(int num);
	public void viewCount(int num);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	
	//parameter값을 가져올 수 없음 ㅡ> Mybatis 쿼리에서 2개 이상의 파라미터를 주었을 떄 인자들을 인지하지 못해서 생긴 오류
	public int likeCheck(@Param("num") int num, @Param("user_id") String user_id);
	public void insertLike(@Param("num") int num, @Param("user_id") String user_id);
//	public void insertLike(BoardDto boardDto);
	
	public void updateLike(int num);
	public void updateLikeCheck(@Param("num") int num, @Param("user_id") String user_id);
	public void updateLikeCheckCancel(@Param("num") int num, @Param("user_id") String user_id);
	public void updateLikeCancel(int num);
	public void deleteLike(@Param("num") int num, @Param("user_id") String user_id);
	

	
}
