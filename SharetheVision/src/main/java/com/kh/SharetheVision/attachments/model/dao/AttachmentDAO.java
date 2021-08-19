package com.kh.SharetheVision.attachments.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.attachments.model.vo.Attachment;

@Repository("aDao")
public class AttachmentDAO {

	public int updateProfile(SqlSession sqlSession, Attachment attachment) {
		return sqlSession.insert("attachmentMapper.updateProfile",attachment);
	}

	public Attachment selectProfile(SqlSession sqlSession, String mCode) {
		return sqlSession.selectOne("attachmentMapper.selectProfile", mCode);
	}

}
