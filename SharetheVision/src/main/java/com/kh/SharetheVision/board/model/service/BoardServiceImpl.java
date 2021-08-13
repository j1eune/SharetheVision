package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.board.model.dao.BoardDAO;
import com.kh.SharetheVision.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO DAO;

	@Override
	public ArrayList<Board> newNotice() {
		return DAO.newNotice(sqlSession);
	}
	
}
