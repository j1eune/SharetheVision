package com.kh.SharetheVision.firstmain.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.firstmain.model.dao.CalendarDAO;
import com.kh.SharetheVision.firstmain.model.vo.Calendar;

@Service("cService")
public class CalendarServiceImpl implements CalendarService{
		
		@Autowired
		private SqlSessionTemplate sqlSession;
	
		@Autowired
		private CalendarDAO cdao;

		@Override
		public int addCal(Calendar c) {
			return cdao.addCal(sqlSession, c);
		}
		

//		@Override
//		public ArrayList<Calendar> addCal() {
//			return cdao.addCal(sqlSession, cId);
//		}
		
		
		
}
