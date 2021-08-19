package com.kh.SharetheVision.attachments.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.attachments.model.dao.AttachmentDAO;
import com.kh.SharetheVision.attachments.model.vo.Attachment;

@Service("aService")
public class AttachmentServiceImple implements AttachmentService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AttachmentDAO aDao;
	
	@Override
	public int updateProfile(Attachment attachment) {
		return aDao.updateProfile(sqlSession, attachment);
	}

	@Override
	public Attachment selectProfile(String mCode) {
		return aDao.selectProfile(sqlSession, mCode);
	}

}
