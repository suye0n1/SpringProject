package com.suyeon.mapper;


import org.apache.ibatis.annotations.Param;

import com.suyeon.dto.MemberDto;

public interface MemberMapper {
	public void join(MemberDto dto);
	public int idCheck(@Param("user_id") String user_id);
	public MemberDto login(@Param("user_id") String user_id);
}

