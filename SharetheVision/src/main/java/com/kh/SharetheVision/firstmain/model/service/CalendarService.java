package com.kh.SharetheVision.firstmain.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.SharetheVision.firstmain.model.vo.Calendar;
import com.kh.SharetheVision.firstmain.model.vo.Todo;

public interface CalendarService {

	//일정 등록
	int addCal(Calendar c);
	
	//일정 조회
	List<Calendar> listCal(HashMap<String, String> mapData);

	//일정수정
	int updateCal(Calendar c);

	//일정삭제
	int deleteCal(Calendar c);

	//Todo 조회
	ArrayList<Todo> selectList(String mcode);

	//Todo 추가
	int insertTodo(Todo todo);

	//Todo checkbox update
	int updateTodo(Integer dchNo);
	
	//Todo 삭제
	int deleteTodo(Integer dchNo);
}
