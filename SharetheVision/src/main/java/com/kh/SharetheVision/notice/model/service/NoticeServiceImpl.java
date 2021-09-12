package com.kh.SharetheVision.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.notice.model.dao.NoticeDAO;
import com.kh.SharetheVision.notice.model.vo.Notice;
import com.kh.SharetheVision.project.model.vo.Project;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public int noticeProject(Project project) {
		int result = 0;
		String[] mArr = project.getmCodeArr();
		for(int i = 0; i < mArr.length; i++) {
			project.setmCode(mArr[i]);
			result += noticeDAO.noticeProject(sqlSession, project);
		}
		
		return result;
	}

	@Override
	public ArrayList<Notice> selectNotice(String mCode) {
		return noticeDAO.selectNotice(sqlSession, mCode);
	}

	@Override
	public int readNotice(HashMap<String, String> map) {
		return noticeDAO.readNotice(sqlSession, map);
	}

	@Override
	public int insertBoardNotice(Board board) {
		int result = 0;
		String[] mCodeArr = board.getmCodeArr();
		for (int i = 0; i < mCodeArr.length; i++) {
			board.setMemberCode(mCodeArr[i]);
			result += noticeDAO.noticeBoard(sqlSession, board);
		}
		return result;
	}

	@Override
	public Notice selectMoveLocation(HashMap<String, String> map) {
		return noticeDAO.selectMoveLocation(sqlSession, map);
	}

	@Override
	public Notice selectedBoardInfo(HashMap<String, String> map) {
		return noticeDAO.selectedBoardInfo(sqlSession, map);
	}

}
