package com.kh.SharetheVision.firstmain.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.firstmain.model.vo.Calendar;
import com.kh.SharetheVision.firstmain.model.vo.Todo;

@Repository("cdao")
public class CalendarDAO {

	public int addCal(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.addCal",c);
	}

	public List<Calendar> listCal(SqlSessionTemplate sqlSession, HashMap<String, String> mapData) {
		return sqlSession.selectList("calendarMapper.listCal",mapData);		
	}

	public int updateCal(SqlSessionTemplate sqlSession, Calendar c) {		
		return  sqlSession.update("calendarMapper.updateCal",c);
	}

	public int deleteCal(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.update("calendarMapper.deleteCal",c);
	}

	public ArrayList<Todo> listTodo(SqlSessionTemplate sqlSession, String mcode) {
		return (ArrayList)sqlSession.selectList("calendarMapper.listTodo", mcode);
	}

	public int insertTodo(SqlSessionTemplate sqlSession, Todo todo) {
		return sqlSession.insert("calendarMapper.insertTodo",todo);
	}

	public int updateTodo(SqlSessionTemplate sqlSession, Integer dchNo) {
		return sqlSession.update("calendarMapper.updateTodo",dchNo);
	}

	public int deleteTodo(SqlSessionTemplate sqlSession, Integer dchNo) {
		return sqlSession.update("calendarMapper.deleteTodo",dchNo);
	}
}
