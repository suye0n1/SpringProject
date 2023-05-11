package com.suyeon.dto;


import lombok.Data;

@Data
public class BoardAttachDto {
	//이미지 업로드
	private String uploadPath;
	private String uuid;
	private String fileName;
	private int num;	
	
}
