package com.kh.SharetheVision.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.notice.model.vo.Notice;
import com.kh.SharetheVision.project.model.vo.Project;

@Repository("noticeDAO")
public class NoticeDAO {

	public int noticeProject(SqlSessionTemplate sqlSession, Project project) {
		return sqlSession.insert("noticeMapper.noticeProject",project);
	}

	public ArrayList<Notice> selectNotice(SqlSessionTemplate sqlSession, String mCode) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNotice",mCode);
	}

}
