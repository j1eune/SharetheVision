package com.kh.SharetheVision.approval.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.approval.model.vo.Approval;

public interface ApprovalService {

	int insertApproval(Approval apv);

	ArrayList<Approval> selectApproval(String mCode);

}
