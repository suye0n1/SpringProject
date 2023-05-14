package com.suyeon.service;

import java.util.List;

import com.suyeon.dto.ReservationDto;

public interface ReservationService {
	public void selectedDate(ReservationDto dto);
	public List<ReservationDto> mypage(String user_id);
}
