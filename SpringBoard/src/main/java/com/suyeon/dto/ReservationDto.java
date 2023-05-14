package com.suyeon.dto;

import lombok.Data;

@Data
public class ReservationDto {
	
	private String reserve_type;
	private String date1;
	private String date2;
	private String user_id;
}
