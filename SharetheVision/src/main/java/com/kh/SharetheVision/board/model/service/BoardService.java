package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.project.model.vo.Project;

public interface BoardService {

	ArrayList<Board> newBoard(int deptNo);

	Board selectBoardDetail(int bId);

	int getListCount();

	ArrayList<Board> selectBoardList(PageInfo pi, int deptNo);

	ArrayList<Project> selectProjectList(int deptNo);

	int insertBoard(Board b);

	int insertAttachFile(Attachment attachFile);

	Board selectLastBoard();


}
