package com.kh.SharetheVision.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.SharetheVision.board.model.service.BoardService;
import com.kh.SharetheVision.board.model.vo.Board;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("board.bo")
	public String board() {
		
		ArrayList<Board> list = service.newNotice();
		System.out.println(list);
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
