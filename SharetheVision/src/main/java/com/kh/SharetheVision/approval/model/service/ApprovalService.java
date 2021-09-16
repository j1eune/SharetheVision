package com.kh.SharetheVision.approval.model.service;

import java.util.List;

import com.kh.SharetheVision.approval.model.vo.ApprovalAcceptDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalAttachDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalStatusDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalVO;
import com.kh.SharetheVision.member.model.vo.Member;

public interface ApprovalService {

	List<Member> aplist();

	ApprovalAttachDTO selectAttachedFile(int apvNo);

	int insertApproval(ApprovalVO apv);

	int insertApprovalAttach(ApprovalAttachDTO dto);

	int insertApprovalAccept(ApprovalAcceptDTO dto);

	List<ApprovalVO> selectApproval(ApprovalVO ap);

	ApprovalVO selectOne(ApprovalVO apv);

	String selectLoginUserType(ApprovalAcceptDTO dto);

	int selectNotAcceptCount(ApprovalAcceptDTO dto);

	int updateApprovalAccept(ApprovalAcceptDTO dto);

	int updateApprovalStatus(ApprovalAcceptDTO dto);
	
	List<ApprovalAcceptDTO> selectApprovalAceeptList();
	
	List<ApprovalStatusDTO> selectApprovalStatusList();

	List<ApprovalVO> selectTypeApproval(ApprovalVO ap);
}
