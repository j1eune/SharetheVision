package com.kh.SharetheVision.approval.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.member.model.vo.Member;

public interface ApprovalService {

	ArrayList<Member> aplist();
	
	Attachment selectAttachedFile(int apNo);

}
