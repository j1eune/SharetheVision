package com.kh.SharetheVision.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.approval.model.dao.ApprovalDAO;
import com.kh.SharetheVision.approval.model.vo.ApprovalAttachDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalVO;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.member.model.vo.Member;

@Service("apvService")
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ApprovalDAO apvdao;

	@Override
	public List<Member> aplist() {
		return apvdao.apList(sqlSession);
	}

	@Override
	public ApprovalAttachDTO selectAttachedFile(int apvNo) {
		return apvdao.selectAttachedFile(sqlSession, apvNo);
	}

	@Override
	public int insertApproval(ApprovalVO apv) {
		return apvdao.insertApproval(sqlSession, apv);
	}

	@Override
	public List<ApprovalVO> selectApproval(ApprovalVO ap) {
		return apvdao.selectApproval(sqlSession, ap);
	}

	@Override
	public ApprovalVO selectOne(ApprovalVO apv) {
		return apvdao.selectOne(sqlSession, apv);
	}

	@Override
	public int insertApprovalAttach(ApprovalAttachDTO dto) {
		return apvdao.insertApprovalAttach(sqlSession, dto);
	}
}
