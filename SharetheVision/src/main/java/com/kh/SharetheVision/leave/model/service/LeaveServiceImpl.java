package com.kh.SharetheVision.leave.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.leave.model.dao.LeaveDAO;
import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;

@Service("lService")
public class LeaveServiceImpl implements LeaveService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private LeaveDAO lDAO;

	@Override
	public int insertLeave(ArrayList<LeaveAnnual> list) {
		
		int resultAll = 0;
		for(int i = 0; i < list.size(); i++) {
			LeaveAnnual la = list.get(i);
//			System.out.println(la + " : 리스트");
			int result = lDAO.insertLeave(sqlSession, la);
//			System.out.println(result + " : 인서트 결과");
			resultAll += result;
		}
		
		return resultAll;
	}
}
