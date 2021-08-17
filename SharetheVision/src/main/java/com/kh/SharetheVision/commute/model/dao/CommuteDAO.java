package com.kh.SharetheVision.commute.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.commute.model.vo.Commute;

@Repository
public class CommuteDAO {

	public Commute commuteMain(SqlSessionTemplate sqlSession, String memberNo) {
		return sqlSession.selectOne("commuteMapper.selectCommute", memberNo);
	}

	public int commuteEnter(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("commuteMapper.insertCommute", map);
	}


}
