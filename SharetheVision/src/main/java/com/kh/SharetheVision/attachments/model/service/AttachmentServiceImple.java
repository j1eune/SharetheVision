package com.kh.SharetheVision.attachments.model.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<Attachment> selectProjectMember(String[] memberCode) {
		ArrayList<Attachment> aList = new ArrayList<Attachment>();
		
		for(int i = 0; i < memberCode.length; i++) {
			Attachment at = new Attachment();
			String mCode = memberCode[i];
			
			at = aDao.selectProfile(sqlSession, mCode);
			
			aList.add(at);
		}
		
		
		return aList;
	}

	@Override
	public int insertProfile(Attachment attachment) {
		return aDao.insertProfile(sqlSession, attachment);
	}


}
