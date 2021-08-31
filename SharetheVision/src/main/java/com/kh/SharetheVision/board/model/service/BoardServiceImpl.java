package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.dao.BoardDAO;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Scrap;
import com.kh.SharetheVision.project.model.vo.Project;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO DAO;

	@Override
	public ArrayList<Board> newBoard(int deptNo) {
		return DAO.newBoard(sqlSession, deptNo);
	}

	@Override
	public Board selectBoardDetail(int bId) {
		return DAO.selectBoardDetail(sqlSession, bId);
	}

	@Override
	public int getListCount() {
		return DAO.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, int deptNo) {
		return DAO.selectBoardList(sqlSession, pi, deptNo);
	}

	@Override
	public ArrayList<Project> selectProjectList(int deptNo) {
		return DAO.selectProjectList(sqlSession, deptNo);
	}

	@Override
	public int insertBoard(Board b) {
		return DAO.insertBoard(sqlSession, b);
	}

	@Override
	public int insertAttachFile(Attachment attachFile) {
		return DAO.insertAttachFile(sqlSession, attachFile);
	}

	@Override
	public Board selectLastBoard() {
		return DAO.selectLastBoard(sqlSession);
	}

	@Override
	public int insertScrap(Scrap s) {
		return DAO.insertScrap(sqlSession, s);
	}

	@Override
	public Scrap scrapState(Scrap s) {
		return DAO.scrapState(sqlSession, s);
	}

	@Override
	public int deleteScrap(Scrap s) {
		return DAO.deleteScrap(sqlSession, s);
	}

	@Override
	public ArrayList<Scrap> scrapList(String mCode) {
		return DAO.scrapList(sqlSession, mCode);
	}

	
}
