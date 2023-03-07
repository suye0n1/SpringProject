package com.suyeon.dto;

import lombok.Data;

@Data
public class BoardDto {
	private Long num;
	private String title;
	private String content;
	private String id;
	//int가 아닌 Long타입(참조형 변수)을 쓰는 이유: 값이 설정되지 않는 경우, null갓을 넣기 위해서
	//int, long은 기본형이란 값이 없는 경우 0이 설정되어 있음
	private Long hits;	
	private String dt;
	private String category;
}
