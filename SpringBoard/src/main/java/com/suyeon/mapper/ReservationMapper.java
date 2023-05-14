package com.suyeon.mapper;

import java.util.List;

import com.suyeon.dto.ReservationDto;

public interface ReservationMapper {
		public void selectedDate(ReservationDto dto);
		public List<ReservationDto> mypage(String user_id);
}
