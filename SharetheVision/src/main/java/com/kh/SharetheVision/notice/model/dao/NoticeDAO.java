package com.kh.SharetheVision.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.board.model.vo.Board;
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

	public int readNotice(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("noticeMapper.readNotice", map);
	}

	public int noticeBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("noticeMapper.noticeBoard", board);
	}

	public Notice selectMoveLocation(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("noticeMapper.selectMoveLocation", map);
	}

	public Notice selectedBoardInfo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("noticeMapper.selectedBoardInfo", map);
	}

}
