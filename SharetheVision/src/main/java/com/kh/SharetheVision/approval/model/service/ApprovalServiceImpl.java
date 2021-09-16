package com.kh.SharetheVision.approval.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.approval.model.dao.ApprovalDAO;
import com.kh.SharetheVision.approval.model.vo.ApprovalAcceptDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalAttachDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalStatusDTO;
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

	@Override
	public int insertApprovalAccept(ApprovalAcceptDTO dto) {
		return apvdao.insertApprovalAccept(sqlSession, dto);
	}

	@Override
	public String selectLoginUserType(ApprovalAcceptDTO dto) {
		return apvdao.selectLoginUserType(sqlSession, dto);
	}

	@Override
	public int selectNotAcceptCount(ApprovalAcceptDTO dto) {
		return apvdao.selectNotAcceptCount(sqlSession, dto);
	}

	@Override
	public int updateApprovalAccept(ApprovalAcceptDTO dto) {
		return apvdao.updateApprovalAccept(sqlSession, dto);
	}

	@Override
	public int updateApprovalStatus(ApprovalAcceptDTO dto) {
		return apvdao.updateApprovalStatus(sqlSession, dto);
	}

	@Override
	public List<ApprovalAcceptDTO> selectApprovalAceeptList() {
		return apvdao.selectApprovalAcceptList(sqlSession);
	}

	@Override
	public List<ApprovalStatusDTO> selectApprovalStatusList() {
		return apvdao.selectApprovalStatusList(sqlSession);
	}

	@Override
	public List<ApprovalVO> selectTypeApproval(ApprovalVO ap) {
		return apvdao.selectTypeApproval(sqlSession, ap);
	}
}
