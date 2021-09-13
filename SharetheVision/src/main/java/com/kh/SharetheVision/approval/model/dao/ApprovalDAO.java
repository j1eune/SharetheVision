package com.kh.SharetheVision.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.approval.model.vo.ApprovalAttachDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalVO;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.member.model.vo.Member;

@Repository("apvdao")
public class ApprovalDAO {

	public List<Member> apList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("approvalMapper.apList");
	}

	public ApprovalAttachDTO selectAttachedFile(SqlSessionTemplate sqlSession, int apvNo) {
		return sqlSession.selectOne("approvalMapper.selectAttachedFile", apvNo);
	}

	public int insertApproval(SqlSessionTemplate sqlSession, ApprovalVO apv) {
		return sqlSession.insert("approvalMapper.insertApproval", apv);
	}
	
	public int insertApprovalAttach(SqlSessionTemplate sqlSession, ApprovalAttachDTO dto) {
		return sqlSession.insert("approvalMapper.insertApprovalAttach", dto);
	}

	public List<ApprovalVO> selectApproval(SqlSessionTemplate sqlSession, ApprovalVO ap) {
		return sqlSession.selectList("approvalMapper.selectApproval", ap);
	}

	public ApprovalVO selectOne(SqlSessionTemplate sqlSession, ApprovalVO apv) {
		return sqlSession.selectOne("approvalMapper.selectOne", apv);
	}

	public int selectCurrentSeq(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("approvalMapper.selectCurrentSeq");
	}

	public ApprovalVO detailApproval(SqlSessionTemplate sqlSession, int apvNo) {
		return sqlSession.selectOne("approvalMapper.detailApproval", apvNo);
	}
}
