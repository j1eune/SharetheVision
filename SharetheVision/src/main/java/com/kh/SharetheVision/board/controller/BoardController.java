package com.kh.SharetheVision.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.SharetheVision.board.model.service.BoardService;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("board.bo")
	public String board(Model model) {
		
		ArrayList<Board> list = service.newBoard();
		System.out.println(list);
		
		model.addAttribute("board", list);
		
		return "board";
	}
	
	@RequestMapping("boardDetail.bo")
	public String boardDetail(@RequestParam("bId") int bId, Model model) {
		
		Board board = service.selectBoardDetail(bId);
		
		System.out.println("bId : " + bId);
		System.out.println("boardDetail : " + board);
		
		model.addAttribute("board", board);
		
		return "boardDetail";
	}
	
	@RequestMapping("boardList.bo")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		
		if (page != null) {
			currentPage = page;
		}
		
		int listCount = service.getListCount();
		System.out.println("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = service.selectBoardList(pi);
		System.out.println("list : " + list);
		if (list != null) {
			mv.addObject("board", list).addObject("pi", pi);
			mv.setViewName("boardList");
		} else {
			mv.setViewName("home");
		}
		
		return mv;
	}
	
	
}
