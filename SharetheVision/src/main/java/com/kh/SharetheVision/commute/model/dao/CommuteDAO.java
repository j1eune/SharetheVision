package com.kh.SharetheVision.commute.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.member.model.vo.Member;

@Repository("coDAO")
public class CommuteDAO {

	public ArrayList<Commute> commuteList(SqlSessionTemplate sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectCommute", memberNo);
	}

	public ArrayList<Overwork> overworkList(SqlSessionTemplate sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectOverwork", memberNo);
	}

	public int commuteEnter(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("commuteMapper.insertCommute", map);
	}

	public int commuteOut(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("commuteMapper.updateCommute", map);
	}

	public int changeState(SqlSession sqlSession, Member m) {
		return sqlSession.update("commuteMapper.changeState", m);
	}

}
