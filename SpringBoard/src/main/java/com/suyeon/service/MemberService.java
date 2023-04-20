package com.suyeon.service;

import com.suyeon.dto.MemberDto;

public interface MemberService {
	public void join(MemberDto dto);
	public MemberDto login(String user_id);
	public int idCheck(String user_id);

	
}
