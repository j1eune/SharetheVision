package com.kh.SharetheVision.commute.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.commute.model.dao.CommuteDAO;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;

@Service("coService")
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDAO coDAO;

	@Override
	public ArrayList<Commute> commuteList(String memberNo) {
		return coDAO.commuteList(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Overwork> overworkList(String memberNo) {
		return coDAO.overworkList(sqlSession, memberNo);
	}

	@Override
	public int commuteEnter(HashMap<String, String> map) {
		return coDAO.commuteEnter(sqlSession, map);
	}

	@Override
	public int commuteOut(HashMap<String, String> map) {
		return coDAO.commuteOut(sqlSession, map);
	}



}
