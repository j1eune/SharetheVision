package com.kh.SharetheVision.commute.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.commute.model.dao.CommuteDAO;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.member.model.vo.Member;

@Service("coService")
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDAO coDAO;

	@Override
	public ArrayList<Commute> commuteList(HashMap<String, String> map) {
		return coDAO.commuteList(sqlSession, map);
	}

	@Override
	public ArrayList<Overwork> overworkList(HashMap<String, String> map) {
		return coDAO.overworkList(sqlSession, map);
	}

	@Override
	public int commuteEnter(HashMap<String, Object> map) {
		return coDAO.commuteEnter(sqlSession, map);
	}

	@Override
	public int commuteOut(HashMap<String, Object> map) {
		return coDAO.commuteOut(sqlSession, map);
	}

	@Override
	public int changeState(Member m) {
		return coDAO.changeState(sqlSession, m);
	}

	@Override
	public Commute commuteDay(String memberNo) {
		return coDAO.commuteDay(sqlSession, memberNo);
	}

}
