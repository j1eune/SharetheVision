package com.kh.SharetheVision.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.approval.model.vo.Approval;

@Repository("apvDAO")
public class ApprovalDAO {

	public int insertApproval(SqlSessionTemplate sqlSession, Approval apv) {
		return sqlSession.insert("approvalMapper.insertApproval", apv);
	}

	public ArrayList<Approval> selectApproval(SqlSessionTemplate sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApproval", memberNo);
	}

}
