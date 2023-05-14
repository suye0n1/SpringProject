package com.suyeon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suyeon.dto.ReservationDto;
import com.suyeon.mapper.ReservationMapper;

import lombok.Setter;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Setter(onMethod_ = @Autowired) 
	private ReservationMapper mapper;
	
	@Override
	public void selectedDate(ReservationDto dto) {
		mapper.selectedDate(dto);
	}
	
	@Override
	public List<ReservationDto> mypage(String user_id) {
		return mapper.mypage(user_id);
	}
}
