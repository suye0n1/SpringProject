package com.suyeon.dto;


import java.util.List;

import lombok.Data;

@Data
public class BoardDto {
	//게시판
	private int num;
	private String title;
	private String content;
	private String id;
	private Long hits;	
	private String dt;
	private String category;
	private int like_count;
	
	private List<BoardAttachDto> imageList;
	
	//좋아요
	private int like_no;
	private String user_id;
	private int like_check;
}

