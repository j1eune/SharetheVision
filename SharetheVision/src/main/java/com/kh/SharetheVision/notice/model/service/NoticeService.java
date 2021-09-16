package com.kh.SharetheVision.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.notice.model.vo.Notice;
import com.kh.SharetheVision.project.model.vo.Project;

public interface NoticeService {

	int noticeProject(Project project);

	ArrayList<Notice> selectNotice(String mCode);

	int readNotice(HashMap<String, String> map);

	int insertBoardNotice(Board board);

	Notice selectMoveLocation(HashMap<String, String> map);

	Notice selectedBoardInfo(HashMap<String, String> map);

}
