package com.kh.SharetheVision.firstmain.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.firstmain.model.dao.CalendarDAO;
import com.kh.SharetheVision.firstmain.model.vo.Calendar;
import com.kh.SharetheVision.firstmain.model.vo.Todo;

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

		@Override
		public List<Calendar> listCal(HashMap<String, String> mapData) {
			return cdao.listCal(sqlSession,mapData);
		}

		@Override
		public int updateCal(Calendar c) {
			return cdao.updateCal(sqlSession, c);
		}


		@Override
		public int deleteCal(Calendar c) {
			return cdao.deleteCal(sqlSession, c);
		}

		@Override
		public ArrayList<Todo> selectList(String mcode) {
			return cdao.listTodo(sqlSession, mcode);
		}


		@Override
		public int insertTodo(Todo todo) {
			return cdao.insertTodo(sqlSession,todo);
		}

		@Override
		public int updateTodo(Integer dchNo) {
			return cdao.updateTodo(sqlSession,dchNo);
		}

		@Override
		public int deleteTodo(Integer dchNo) {
			return cdao.deleteTodo(sqlSession, dchNo);
		}
}
