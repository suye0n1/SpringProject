package com.suyeon.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suyeon.dto.MemberDto;
import com.suyeon.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	@Setter(onMethod_ = @Autowired) 
	private MemberMapper mapper;
	
	//join(MemberDto dto)에 오류-@Override를 제거하라고 뜸: implements MemberService이 안되어있어서 오류
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
