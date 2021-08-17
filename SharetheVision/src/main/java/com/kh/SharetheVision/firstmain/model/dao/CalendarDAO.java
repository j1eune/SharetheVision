package com.kh.SharetheVision.firstmain.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.firstmain.model.vo.Calendar;

@Repository("cdao")
public class CalendarDAO {

	public int addCal(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.addCal",c);
	}

	public List<Calendar> listCal(SqlSessionTemplate sqlSession, String mcode, String sDate, String eDate) {	
		HashMap<String, String> mapData = new HashMap<String, String>();
		List<Calendar> calendarList = new ArrayList<Calendar>(); 
		mapData.put("mcode", mcode);
		mapData.put("sDate", sDate);
		mapData.put("eDate", eDate);
		
		calendarList = sqlSession.selectList("calendarMapper.listCal",mapData);		
		return calendarList;
	}

	public int updateCal(SqlSessionTemplate sqlSession, Calendar c) {		
		return  sqlSession.update("calendarMapper.updateCal",c);
	}

	public int deleteCal(SqlSessionTemplate sqlSession, String no) {
		return sqlSession.update("calendarMapper.deleteCal",no);
	}


	
}
