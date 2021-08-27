package com.kh.SharetheVision.leave.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.leave.model.dao.LeaveDAO;
import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;

@Service("leService")
public class LeaveServiceImpl implements LeaveService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private LeaveDAO leDAO;

	@Override
	public ArrayList<LeaveAnnual> selectAnnual(HashMap<String, Object> map) {
		return leDAO.selectAnnual(sqlSession, map);
	}

	@Override
	public ArrayList<LeaveUsed> selectUsed(String memberNo) {
		return leDAO.selectUsed(sqlSession, memberNo);
	}
	
	
}
