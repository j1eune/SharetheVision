package com.kh.SharetheVision.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.board.model.vo.Board;

@Repository("DAO")
public class BoardDAO {

	public ArrayList<Board> newNotice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectNewNotice");
	}

}
