package com.kh.SharetheVision.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.dao.BoardDAO;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.MemberProject;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Reply;
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
	public int getListCount(int deptNo) {
		return DAO.selectListCount(sqlSession, deptNo);
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

	@Override
	public int getScrapListCount(String mCode) {
		return DAO.selectScrapListCount(sqlSession, mCode);
	}

	@Override
	public ArrayList<Scrap> selectScrapBoardList(PageInfo pi, String mCode) {
		return DAO.selectScrapBoardList(sqlSession, pi, mCode);
	}

	@Override
	public Board selectBoardStatus(int bId) {
		return DAO.selectBoardStatus(sqlSession, bId);
	}

	@Override
	public int selectSearchListCount(HashMap<String, Object> map) {
		return DAO.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectSearchBoard(PageInfo pi, HashMap<String, Object> map) {
		return DAO.selectSearchBoard(sqlSession, pi, map);
	}

	@Override
	public Attachment selectAttachedFile(String strbId) {
		return DAO.selectAttechedFile(sqlSession, strbId);
	}

	@Override
	public int deleteBoard(int bId) {
		return DAO.deleteBoard(sqlSession, bId);
	}

	@Override
	public int deleteBoardAttachFile(String strbId) {
		return DAO.deleteBoardAttachFile(sqlSession, strbId);
	}

	@Override
	public int changeBoard(HashMap<String, Object> map) {
		return DAO.changeBoard(sqlSession, map);
	}

	@Override
	public int deleteProjectScrap(HashMap<String, Object> map) {
		return DAO.deleteProjectScrap(sqlSession, map);
	}

	@Override
	public int updateBoard(Board b) {
		return DAO.updateBoard(sqlSession, b);
	}

	@Override
	public int addReply(Reply r) {
		return DAO.addReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		return DAO.selectReplyList(sqlSession, bId);
	}

	@Override
	public int deleteReply(int replyNo) {
		return DAO.deleteReply(sqlSession, replyNo);
	}

	@Override
	public Attachment selectUserProfileImage(String writermCode) {
		return DAO.selectUserProfileImage(sqlSession, writermCode);
	}

	@Override
	public Project findPno(String project) {
		return DAO.findPno(sqlSession, project);
	}

	@Override
	public ArrayList<MemberProject> getmCodeList(int pNo) {
		return DAO.getmCodeList(sqlSession, pNo);
	}

	@Override
	public ArrayList<Board> newNotice(int deptNo) {
		return DAO.newNotice(sqlSession, deptNo);
	}

	@Override
	public int getNoticeListCount(int deptNo) {
		return DAO.getNoticeListCount(sqlSession, deptNo);
	}

	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi, int deptNo) {
		return DAO.selectNoticeList(sqlSession, pi, deptNo);
	}

	@Override
	public int insertNotice(Board b) {
		return DAO.insertNotice(sqlSession, b);
	}
	
}
