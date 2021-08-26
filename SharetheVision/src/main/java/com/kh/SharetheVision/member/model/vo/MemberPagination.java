package com.kh.SharetheVision.member.model.vo;

import com.kh.SharetheVision.board.model.vo.PageInfo;

public class MemberPagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		int boardLimit = 5;
		int pageLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		
		return pi;
	}
}
