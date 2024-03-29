package com.suyeon.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suyeon.dto.MemberDto;
import com.suyeon.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{
	@Setter(onMethod_ = @Autowired) 
	private MemberMapper mapper;
	
	@Override
	public void join(MemberDto dto) {
		mapper.join(dto);
	}
	
	@Override
	public int idCheck(String user_id) {
		return mapper.idCheck(user_id);
	}

	@Override
	public MemberDto login(String user_id) {
		return mapper.login(user_id);
	}
	
	

	
	
}
