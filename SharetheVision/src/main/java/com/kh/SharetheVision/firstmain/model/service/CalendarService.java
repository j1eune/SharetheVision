package com.kh.SharetheVision.firstmain.model.service;

import java.util.List;

import com.kh.SharetheVision.firstmain.model.vo.Calendar;

public interface CalendarService {

	//일정 등록
	int addCal(Calendar c);
	
	//일정 조회
	List<Calendar> listCal(String mcode, String deptNo, String sDate, String eDate);

	//일정수정
	int updateCal(Calendar c);

	//일정삭제
	int deleteCal(String no);
	
}
