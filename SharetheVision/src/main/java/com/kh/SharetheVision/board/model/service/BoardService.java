package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;

public interface BoardService {

	ArrayList<Board> newBoard();

	Board selectBoardDetail(int bId);

	int getListCount();

	ArrayList<Board> selectBoardList(PageInfo pi);

}
