package com.kh.SharetheVision.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.member.model.vo.Member;

@Repository("apvdao")
public class ApprovalDAO {

	public ArrayList<Member> apList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("approvalMapper.apList");
	}

	public Attachment selectAttachedFile(SqlSessionTemplate sqlSession, int apNo) {
		
		return sqlSession.selectOne("approvalMapper.selectAttachedFile", apNo);
		
	}

}
