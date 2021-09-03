package com.kh.SharetheVision.approval.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.approval.model.dao.ApprovalDAO;

@Service("apvService")
public class ApprovalServiceImpl {
	
	@Autowired
	private ApprovalDAO apvDAO;
	
	
	
	

}
