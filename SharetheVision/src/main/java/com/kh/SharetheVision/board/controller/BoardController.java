package com.kh.SharetheVision.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.SharetheVision.board.model.service.BoardService;
import com.kh.SharetheVision.board.model.vo.Board;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("board.bo")
	public String board(Model model) {
		
		ArrayList<Board> list = service.newNotice();
		System.out.println(list);
		
		model.addAttribute("board", list);
		
		return "board";
	}
	
	@RequestMapping("boardDetail.bo")
	public String boardDetail() {
		return "boardDetail";
	}
	
	@RequestMapping("boardList.bo")
	public String boardList() {
		return "boardList";
	}
	
	
}
