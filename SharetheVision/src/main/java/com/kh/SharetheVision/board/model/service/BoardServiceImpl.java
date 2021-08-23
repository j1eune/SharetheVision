package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.board.model.dao.BoardDAO;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO DAO;

	@Override
	public ArrayList<Board> newBoard() {
		return DAO.newBoard(sqlSession);
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
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return DAO.selectBoardLisct(sqlSession, pi);
	}
	
}
