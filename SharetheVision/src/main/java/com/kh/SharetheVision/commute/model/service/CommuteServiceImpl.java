package com.kh.SharetheVision.commute.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.commute.model.dao.CommuteDAO;
import com.kh.SharetheVision.commute.model.vo.Commute;

@Service("coService")
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDAO coDAO;

	@Override
	public Commute commuteMain(String memberNo) {
		return coDAO.commuteMain(sqlSession, memberNo);
	}

	@Override
	public int commuteEnter(HashMap<String, String> map) {
		return coDAO.commuteEnter(sqlSession, map);
	}


}
