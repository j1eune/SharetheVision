package com.kh.SharetheVision.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.MemberProject;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Reply;
import com.kh.SharetheVision.board.model.vo.Scrap;
import com.kh.SharetheVision.project.model.vo.Project;

@Repository("DAO")
public class BoardDAO {

	public ArrayList<Board> newBoard(SqlSessionTemplate sqlSession, int deptNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectNewBoard", deptNo);
	}

	public Board selectBoardDetail(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoardDetail", bId);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, int deptNo) {
		return sqlSession.selectOne("boardMapper.selectListCount", deptNo);
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

	public int insertScrap(SqlSessionTemplate sqlSession, Scrap s) {
		return sqlSession.insert("boardMapper.insertScrap", s);
	}

	public Scrap scrapState(SqlSessionTemplate sqlSession, Scrap s) {
		return sqlSession.selectOne("boardMapper.scrapState", s);
	}

	public int deleteScrap(SqlSessionTemplate sqlSession, Scrap s) {
		return sqlSession.delete("boardMapper.deleteScrap", s);
	}

	public ArrayList<Scrap> scrapList(SqlSessionTemplate sqlSession, String mCode) {
		return (ArrayList)sqlSession.selectList("boardMapper.scrapList", mCode);
	}

	public int selectScrapListCount(SqlSessionTemplate sqlSession, String mCode) {
		return sqlSession.selectOne("boardMapper.selectScrapListCount", mCode);
	}

	public ArrayList<Scrap> selectScrapBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String mCode) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectScrapBoardList", mCode, rowBounds);
	}

	public Board selectBoardStatus(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoardStatus", bId);
	}

	public ArrayList<Board> selectSearchBoard(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchBoard", map, rowBounds);
	}

	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectSearchListCount", map);
	}

	public Attachment selectAttechedFile(SqlSessionTemplate sqlSession, String strbId) {
		return sqlSession.selectOne("boardMapper.selectAttechedFile", strbId);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.deleteBoard", bId);
	}

	public int deleteBoardAttachFile(SqlSessionTemplate sqlSession, String strbId) {
		return sqlSession.update("boardMapper.deleteBoardAttachFile", strbId);
	}

	public int changeBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("boardMapper.changeBoard",map);
	}

	public int deleteProjectScrap(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("boardMapper.deleteProjectScrap",map);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int addReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bId);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.deleteReply", replyNo);
	}

	public Attachment selectUserProfileImage(SqlSessionTemplate sqlSession, String writermCode) {
		return sqlSession.selectOne("boardMapper.selectUserProfileImage", writermCode);
	}

	public Project findPno(SqlSessionTemplate sqlSession, String project) {
		return sqlSession.selectOne("boardMapper.findPno", project);
	}

	public ArrayList<MemberProject> getmCodeList(SqlSessionTemplate sqlSession, int pNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.getmCodeList", pNo);
	}

	public ArrayList<Board> newNotice(SqlSessionTemplate sqlSession, int deptNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectNewNotice", deptNo);
	}

	public int getNoticeListCount(SqlSessionTemplate sqlSession, int deptNo) {
		return sqlSession.selectOne("boardMapper.selectNoticeListCount", deptNo);
	}
	
	public ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, int deptNo) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds rowBounds = 	new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", deptNo, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertNotice", b);
	}

}
