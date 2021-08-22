package com.kh.SharetheVision.ms.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.vo.Messenger;

@Repository("msdao")
public class MsDAO {

	public ArrayList<Member> toList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("msMapper.toList");
	}

	public int sendInsert(SqlSessionTemplate sqlSession, Messenger ms) {
		return sqlSession.insert("msMapper.send",ms);
	}
	
	
	
}
