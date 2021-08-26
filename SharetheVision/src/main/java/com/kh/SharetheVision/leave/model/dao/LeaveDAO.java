package com.kh.SharetheVision.leave.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;

@Repository("lDAO")
public class LeaveDAO {

	public int insertLeave(SqlSessionTemplate sqlSession, LeaveAnnual la) {
		return sqlSession.insert("leaveMapper.insertLeave", la);
	}

}
