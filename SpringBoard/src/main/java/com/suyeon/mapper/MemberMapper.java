package com.suyeon.mapper;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.suyeon.dto.MemberDto;

public interface MemberMapper {
	public void join(MemberDto dto);
//	public int idCheck(String user_id);
	//@Param을 안해주면 가끔 오류 남
	//ㅡ> 1.mapper.xml에 parameterType = "map"
	//2.인터페이스에는 @Param
	//Service에는 안써줘도 됨
	public int idCheck(@Param("user_id") String user_id);
	public MemberDto login(@Param("user_id") String user_id);
}

