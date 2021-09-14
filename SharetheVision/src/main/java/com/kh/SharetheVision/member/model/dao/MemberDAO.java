package com.kh.SharetheVision.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.member.model.vo.Member;

@Repository("mDao")
public class MemberDAO {

	public int insertMember(Member m, SqlSession sqlSession) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public ArrayList<Member> selectMember(SqlSession sqlSession, HashMap<String, Object> map) {
		PageInfo pi = (PageInfo)map.get("page");
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMember", map, rowBounds);
	}

	public Member checkEmail(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.checkEmail",m);
	}

	public Member loginMember(SqlSession sqlSession, String mId) {
		return sqlSession.selectOne("memberMapper.loginMember", mId);
	}

	public int updateMember(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

	public int updatePwd(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd",m);
	}

	public int getListCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.getListCount", map);
	}

	public int searchListCount(SqlSession sqlSession, String search) {
		return sqlSession.selectOne("memberMapper.searchListCount", search);
	}

	public ArrayList<Member> searchMember(SqlSession sqlSession, HashMap<String, Object> map) {
		PageInfo pi = (PageInfo)map.get("page");
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchMember", map, rowBounds);
	}

	public ArrayList<Member> selectMemberList(SqlSession sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", m);
	}

	public ArrayList<Member> pSearchMember(SqlSession sqlSession, HashMap<String, Object> map) {
		PageInfo pi = (PageInfo)map.get("page");
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.pSearchMember", map, rowBounds);
	}

	public ArrayList<Member> selectTeamMember(SqlSession sqlSession, int deptNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTeamMember",deptNo);
	}

	public Member selectMemberName(SqlSession sqlSession, String string) {
		return sqlSession.selectOne("memberMapper.selectMemberName",string);
	}

}
