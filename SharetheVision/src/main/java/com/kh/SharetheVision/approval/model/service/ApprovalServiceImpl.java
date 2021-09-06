package com.kh.SharetheVision.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.approval.model.dao.ApprovalDAO;
import com.kh.SharetheVision.approval.model.vo.Approval;

@Service("apvService")
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private ApprovalDAO apvDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertApproval(Approval apv) {
		return apvDAO.insertApproval(sqlSession, apv);
	}

	@Override
	public ArrayList<Approval> selectApproval(String mCode) {
		return apvDAO.selectApproval(sqlSession, mCode);
	}
	
	
	
	
	

}
