package com.suyeon.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suyeon.dto.BoardAttachDto;
import com.suyeon.dto.BoardDto;
import com.suyeon.mapper.BoardAttachMapper;
import com.suyeon.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired) 
	private BoardMapper mapper;	

	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper aMapper;
	
	@Override
	public List<BoardDto> list(String category){
		return mapper.list(category);
	}
	
	@Override
	public BoardDto read(int num, String category) {
		// 컨트롤러에 잇는 로직이 다 여기 들어가야 한다
		//조회수 카운트
		mapper.viewCount(num);
		return mapper.read(num, category);
	}
	
	@Override
	public void del(int num) {
		 mapper.del(num);
	}
	
	@Transactional
	@Override
	public void write(BoardDto dto) {
		if(dto.getImageList() == null || dto.getImageList().size() <= 0) {
			return;
		}
		
		try {
		  mapper.write(dto);
		  
		dto.getImageList().forEach(attach ->{ 
			//spring_board의 num을 images의 board_num으로
			attach.setNum(dto.getNum());
			aMapper.imageInsert(attach);
			log.info(attach);
		});
		} catch(Exception e) {
			throw new RuntimeException(e);
		}
		
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
