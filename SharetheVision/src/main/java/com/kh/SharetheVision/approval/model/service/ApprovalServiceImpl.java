package com.kh.SharetheVision.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.approval.model.dao.ApprovalDAO;
import com.kh.SharetheVision.approval.model.vo.Approval;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.member.model.vo.Member;

@Service("apvService")
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ApprovalDAO apvdao;
	
	@Override
	public ArrayList<Member> aplist() {
		return apvdao.apList(sqlSession);
	}
	
	@Override
	public Attachment selectAttachedFile(int apNo) {
		return apvdao.selectAttachedFile(sqlSession,apNo);
	}

	@Override
	public int insertApproval(Approval apv) {
		return apvdao.insertApproval(sqlSession, apv);
	}

	@Override
	public ArrayList<Approval> selectApproval(String mCode) {
		return apvdao.selectApproval(sqlSession, mCode);
	}
	
	
	

}
