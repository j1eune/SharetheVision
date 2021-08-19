package com.kh.SharetheVision.ms.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.ms.model.dao.MsDAO;

@Service("msService")
public class MsServiceImple implements MsService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MsDAO msdao;

	
	
}
