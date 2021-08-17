package com.kh.SharetheVision.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.member.model.dao.MemberDAO;
import com.kh.SharetheVision.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberDAO mDao;

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m, sqlSession);
	}

	@Override
	public ArrayList<Member> selectMember(HashMap<String, String> map) {
		return mDao.selectMember(sqlSession, map);
	}

	@Override
	public Member checkEmail(Member m) {
		return mDao.checkEmail(sqlSession, m);
	}
	
}
