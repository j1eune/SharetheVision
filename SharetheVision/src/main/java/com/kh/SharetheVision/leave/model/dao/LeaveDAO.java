package com.kh.SharetheVision.leave.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;

@Repository("leDAO")
public class LeaveDAO {

	public int insertAnnaul(SqlSessionTemplate sqlSession, ArrayList<LeaveAnnual> list) {
		return sqlSession.insert("leaveMapper.insertAnnaul", list);
	}

	public ArrayList<LeaveAnnual> selectAnnual(SqlSessionTemplate sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("leaveMapper.selectAnnual", memberNo);
	}

	public ArrayList<LeaveUsed> selectLeave(SqlSessionTemplate sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("leaveMapper.selectLeave", memberNo);
	}

	public int insertLeave(SqlSessionTemplate sqlSession, LeaveUsed lu) {
		return sqlSession.insert("leaveMapper.insertLeave", lu);
	}

}
