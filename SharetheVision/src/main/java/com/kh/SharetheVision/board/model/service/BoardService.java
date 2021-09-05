package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Scrap;
import com.kh.SharetheVision.project.model.vo.Project;

public interface BoardService {

	ArrayList<Board> newBoard(int deptNo);

	Board selectBoardDetail(int bId);

	int getListCount(int deptNo);

	ArrayList<Board> selectBoardList(PageInfo pi, int deptNo);

	ArrayList<Project> selectProjectList(int deptNo);

	int insertBoard(Board b);

	int insertAttachFile(Attachment attachFile);

	Board selectLastBoard();

	int insertScrap(Scrap s);

	Scrap scrapState(Scrap s);

	int deleteScrap(Scrap s);

	ArrayList<Scrap> scrapList(String mCode);

	int getScrapListCount(String mCode);

	ArrayList<Scrap> selectScrapBoardList(PageInfo pi, String mCode);

	Board selectBoardStatus(int bId);

	int selectSearchListCount(HashMap<String, Object> map);

	ArrayList<Board> selectSearchBoard(PageInfo pi, HashMap<String, Object> map);

	Attachment selectAttachedFile(int bId);

	int deleteBoard(int bId);

	int deleteBoardAttachFile(int bId);
	

}
