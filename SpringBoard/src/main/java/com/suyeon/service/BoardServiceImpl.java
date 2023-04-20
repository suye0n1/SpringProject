package com.suyeon.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suyeon.dto.BoardDto;
import com.suyeon.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired) 
	private BoardMapper mapper;	
	
	@Override
	public List<BoardDto> list(String category){
		return mapper.list(category);
	}
	
	@Override
	public BoardDto read(long num, String category) {
		//조회수 카운트
		mapper.viewCount(num);
		return mapper.read(num, category);
	}

	@Override
	public void del(long num) {
		 mapper.del(num);
	}
	
	@Override
	public void write(BoardDto dto) {
		mapper.write(dto);
	}
	
	@Override
	public void modify(BoardDto dto) {
		mapper.modify(dto);
	}
	
//	===============좋아요============
	@Override
	public int likeCheck(int num, String user_id) {
		 return mapper.likeCheck(num, user_id);
	}
	
	@Override
	public void insertLike(int num, String user_id) {
		mapper.insertLike(num, user_id);
	}
	
	@Override
	public void updateLike(int num) {
		 mapper.updateLike(num);
	}
	
	@Override
	public void updateLikeCheck(int num,String user_id) {
		mapper.updateLikeCheck(num, user_id);
	}
	
	@Override
	public void updateLikeCheckCancel(int num,String user_id) {
		mapper.updateLikeCheckCancel(num, user_id);
	}
	
	
	@Override
	public void updateLikeCancel(int num) {
		mapper.updateLikeCancel(num);
	}
	
	@Override
	public void deleteLike(int num,String user_id) {
		mapper.deleteLike(num, user_id);
	}
	
}
