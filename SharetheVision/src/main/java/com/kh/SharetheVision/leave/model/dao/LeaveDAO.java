package com.kh.SharetheVision.leave.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;

@Repository("leDAO")
public class LeaveDAO {

	public int insertLeave(SqlSessionTemplate sqlSession, LeaveAnnual la) {
		return sqlSession.insert("leaveMapper.insertLeave", la);
	}

	public ArrayList<LeaveAnnual> selectAnnual(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("leaveMapper.selectAnnual", map);
	}

	public ArrayList<LeaveUsed> selectUsed(SqlSessionTemplate sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("leaveMapper.selectUsed", memberNo);
	}

}
