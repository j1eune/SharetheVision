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
	public ArrayList<Member> selectMember(HashMap<String, Object> map) {
		return mDao.selectMember(sqlSession, map);
	}

	@Override
	public Member checkEmail(Member m) {
		return mDao.checkEmail(sqlSession, m);
	}

	@Override
	public Member loginMember(String mId) {
		return mDao.loginMember(sqlSession, mId);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession,m);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession,m);
	}

	@Override
	public int getListCount(HashMap<String, Object> map) {
		return mDao.getListCount(sqlSession, map);
	}

	@Override
	public int searchListCount(String search) {
		return mDao.searchListCount(sqlSession, search);
	}

	@Override
	public ArrayList<Member> searchMember(HashMap<String, Object> map) {
		return mDao.searchMember(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectMemberList(Member m) {
		return mDao.selectMemberList(sqlSession, m);
	}

	@Override
	public ArrayList<Member> pSearchMember(HashMap<String, Object> map) {
		return mDao.pSearchMember(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectTeamMember(int deptNo) {
		return mDao.selectTeamMember(sqlSession, deptNo);
	}

	@Override
	public Member selectMemberName(String string) {
		return mDao.selectMemberName(sqlSession, string);
	}
	
}
