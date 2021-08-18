package com.kh.SharetheVision.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.member.model.vo.Member;

@Repository("mDao")
public class MemberDAO {

	public int insertMember(Member m, SqlSession sqlSession) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public ArrayList<Member> selectMember(SqlSession sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMember", map);
	}

	public Member checkEmail(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.checkEmail",m);
	}




}
