package com.suyeon.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.suyeon.dto.MemberDto;

public interface MemberService {
	public void join(MemberDto dto);
	public MemberDto login(String user_id,String passwd);
	public int idCheck(String user_id);
	
}
