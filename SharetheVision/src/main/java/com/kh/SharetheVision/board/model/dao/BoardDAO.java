package com.kh.SharetheVision.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.project.model.vo.Project;

@Repository("DAO")
public class BoardDAO {

	public ArrayList<Board> newBoard(SqlSessionTemplate sqlSession, int deptNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectNewBoard", deptNo);
	}

	public Board selectBoardDetail(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoardDetail", bId);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int deptNo) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds rowBounds = 	new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", deptNo, rowBounds);
	}

	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, int deptNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectProjectList", deptNo);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertAttachFile(SqlSessionTemplate sqlSession, Attachment attachFile) {
		return sqlSession.insert("boardMapper.insertAttachFile", attachFile);
	}

	public Board selectLastBoard(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectLastBoard");
	}


}
