package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.MemberProject;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Reply;
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

	Attachment selectAttachedFile(String strbId);

	int deleteBoard(int bId);

	int deleteBoardAttachFile(String strbId);

	int changeBoard(HashMap<String, Object> map);

	int deleteProjectScrap(HashMap<String, Object> map);
	
	int updateBoard(Board b);

	int addReply(Reply r);

	ArrayList<Reply> selectReplyList(int bId);

	int deleteReply(int replyNo);

	Attachment selectUserProfileImage(String writermCode);

	Project findPno(String project);

	ArrayList<MemberProject> getmCodeList(int pNo);

	ArrayList<Board> newNotice(int deptNo);

	int getNoticeListCount(int deptNo);

	ArrayList<Board> selectNoticeList(PageInfo pi, int deptNo);

	int insertNotice(Board b);

}
