package com.kh.SharetheVision.notice.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.notice.model.vo.Notice;
import com.kh.SharetheVision.project.model.vo.Project;

public interface NoticeService {

	int noticeProject(Project project);

	ArrayList<Notice> selectNotice(String mCode);

}
