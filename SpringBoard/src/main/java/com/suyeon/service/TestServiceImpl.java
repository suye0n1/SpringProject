package com.suyeon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suyeon.dto.TestDto;
import com.suyeon.mapper.TestMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class TestServiceImpl implements TestService{

	@Setter(onMethod_ = @Autowired)
	private TestMapper mapper;	
	
	@Override
	public String getOne() {
		TestDto tvo = mapper.getData1();
		String one = tvo.getStr_data();
		log.info("==== 서비스쪽 값 1 구하기: " + one);
		return one;
	}

	@Override
	public String getTwo() {
		TestDto tvo = mapper.getData2();
		String two = tvo.getStr_data();
		log.info("==== 서비스쪽 값 2 구하기: " + two);
		return two;
	}

	/* 문제 1 */
	@Override
	public void updateVisitantCount() {
		mapper.updateVisitantCount();
	}
	
	/* 문제 2 */
	@Override
	public void insertDoodle() {
		mapper.insertDoodle();
	}
	
	/* 문제 3 */
	@Override
	public void delTest() {
		mapper.delTest();
	}
	
	

}
