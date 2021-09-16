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
	public int insertAnnual(ArrayList<LeaveAnnual> list) {
		
		int result = 0;
		for(LeaveAnnual la : list) {
			result += leDAO.insertAnnual(sqlSession, la);
		}
		
		return result;
	}

	@Override
	public ArrayList<LeaveAnnual> selectAnnual(String memberNo) {
		return leDAO.selectAnnual(sqlSession, memberNo);
	}

	@Override
	public ArrayList<LeaveUsed> selectLeave(String memberNo) {
		return leDAO.selectLeave(sqlSession, memberNo);
	}

	@Override
	public int insertLeave(LeaveUsed lu) {
		return leDAO.insertLeave(sqlSession, lu);
	}

	@Override
	public int changeStatus(LeaveUsed lu) {
		return leDAO.changeStatus(sqlSession, lu);
	}

	@Override
	public int leaveUpdate(int no) {
		return leDAO.leaveUpdate(sqlSession, no);
	}

	
	
	
}
