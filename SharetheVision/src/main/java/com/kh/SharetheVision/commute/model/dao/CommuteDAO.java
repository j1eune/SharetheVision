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

	public ArrayList<Commute> commuteList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectCommute", map);
	}

	public ArrayList<Overwork> overworkList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectOverwork", map);
	}

	public int commuteEnter(SqlSessionTemplate sqlSession, Commute co) {
		return sqlSession.insert("commuteMapper.insertCommute", co);
	}

	public int commuteOut(SqlSessionTemplate sqlSession, Commute co) {
		return sqlSession.update("commuteMapper.outCommute", co);
	}

	public int changeState(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("commuteMapper.changeState", m);
	}

	public Commute commuteDay(SqlSessionTemplate sqlSession, String memberNo) {
		return sqlSession.selectOne("commuteMapper.dailyCommute", memberNo);
	}

	public int insertOverwork(SqlSessionTemplate sqlSession, Overwork ow) {
		return sqlSession.insert("commuteMapper.insertOverwork", ow);
	}

	public int updateOverwork(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("commuteMapper.updateOverwork", no);
	}

	public Commute selectCommuteOne(SqlSessionTemplate sqlSession, Commute co) {
		return sqlSession.selectOne("commuteMapper.selectCommuteOne", co);
	}

	public int updateCommute(SqlSessionTemplate sqlSession, Commute co) {
		return sqlSession.update("commuteMapper.updateCommute", co);
	}

}
