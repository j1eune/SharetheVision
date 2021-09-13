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
	public int commuteEnter(Commute co) {
		return coDAO.commuteEnter(sqlSession, co);
	}

	@Override
	public int commuteOut(Commute co) {
		return coDAO.commuteOut(sqlSession, co);
	}

	@Override
	public int changeState(Member m) {
		return coDAO.changeState(sqlSession, m);
	}

	@Override
	public Commute commuteDay(String memberNo) {
		return coDAO.commuteDay(sqlSession, memberNo);
	}

	@Override
	public int insertOverwork(Overwork ow) {
		return coDAO.insertOverwork(sqlSession, ow);
	}

	@Override
	public int overworkUpdate(int no) {
		return coDAO.updateOverwork(sqlSession, no);
	}

	@Override
	public Commute selectCommuteOne(Commute co) {
		return coDAO.selectCommuteOne(sqlSession, co);
	}

	@Override
	public int updateCommute(Commute co) {
		return coDAO.updateCommute(sqlSession, co);
	}

}
