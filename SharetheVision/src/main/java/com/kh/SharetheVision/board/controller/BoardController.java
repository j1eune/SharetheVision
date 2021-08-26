package com.kh.SharetheVision.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.exception.BoardException;
import com.kh.SharetheVision.board.model.service.BoardService;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Pagination;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.project.model.vo.Project;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("board.bo")
	public String board(@RequestParam(value="loginUserDeptNo") int deptNo, Model model) {
		
		ArrayList<Board> list = service.newBoard(deptNo);
//		System.out.println(list);
		model.addAttribute("board", list);
		
		return "board";
	}
	
	@RequestMapping("boardDetail.bo")
	public String boardDetail(@RequestParam("bId") int bId, Model model) {
		
		Board board = service.selectBoardDetail(bId);
		
		model.addAttribute("board", board);
		
		return "boardDetail";
	}
	
	@RequestMapping("boardList.bo")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page,
								  ModelAndView mv, HttpSession session) {
		
		int deptNo = ((Member)session.getAttribute("loginUser")).getDeptNo();
		
		int currentPage = 1;
		
		if (page != null) {
			currentPage = page;
		}
		
		int listCount = service.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = service.selectBoardList(pi, deptNo);
		
		System.out.println(list);
		if (list != null) {
			mv.addObject("board", list).addObject("pi", pi);
			mv.setViewName("boardList");
		} else {
			mv.setViewName("home");
		}
		
		return mv;
	}
	
	@RequestMapping("boardInsertForm.bo")
	public String boardInsertForm(@RequestParam(value="deptNo") int deptNo, Model model) {
		
		ArrayList<Project> list = service.selectProjectList(deptNo);
		
//		System.out.println(list);
		model.addAttribute("project", list);
		
		return "boardInsert";
	}
	
	@RequestMapping("boardInsert.bo")
	public String boardInsert(@ModelAttribute Board b, @RequestParam(value="uploadFile") MultipartFile uploadFile,
								HttpServletRequest request) throws BoardException {
		
//		System.out.println(b);
		boolean fileUpload = false;
		
		int result = service.insertBoard(b);
		
		Board lastBoard = service.selectLastBoard();
		int lastBoardNo = lastBoard.getBoardNo();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			Attachment attachFile = saveFile(uploadFile, request, lastBoardNo);
			System.out.println(attachFile);
			
			int uploadResult = service.insertAttachFile(attachFile);
			
			if (uploadResult > 0) {
				fileUpload = true;
			}
		}
		
		if (result > 0) {
			return "redirect:boardList.bo";
		} else {
			throw new BoardException("게시글 작성에 실패했습니다."); 
		}

	}
	
	public Attachment saveFile(MultipartFile file, HttpServletRequest request, int boardNo) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\archive";
		
		File folder = new File(savePath);
		
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
								+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("파일 x");
		}
		
		String strBoardNo = Integer.toString(boardNo); // int -> String 형변환
		
//		System.out.println(strBoardNo);
		
		Attachment att = new Attachment();
		att.setAtLevel(3);
		att.setAtCategory(strBoardNo);
		att.setAtPath(renamePath);
		att.setAtOrigin(originalFileName);
		att.setAtChange(renameFileName);
		
		return att;
	}
	
	@RequestMapping("addScrap.bo")
	public String addScrap() {
		return "";
	}
}
