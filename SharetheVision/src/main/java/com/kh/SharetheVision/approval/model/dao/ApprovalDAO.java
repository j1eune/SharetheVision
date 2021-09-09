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

	public Attachment selectAttachedFile(SqlSessionTemplate sqlSession, int apNo) {
		return sqlSession.selectOne("approvalMapper.selectAttachedFile", apNo);
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
}
