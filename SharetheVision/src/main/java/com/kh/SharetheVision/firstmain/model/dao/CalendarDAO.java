package com.kh.SharetheVision.firstmain.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.firstmain.model.vo.Calendar;

@Repository("cdao")
public class CalendarDAO {

	public int addCal(SqlSessionTemplate sqlSession, Calendar c) {
		System.out.println("dao IN !");
		return sqlSession.insert("calendarMapper.addCal",c);
	}

//	public ArrayList<Calendar> addCal(SqlSessionTemplate sqlSession){
//		
//		return 
//	}
	
}
