package com.kh.SharetheVision.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.SharetheVision.attachments.model.vo.Attachment;
import com.kh.SharetheVision.board.model.exception.BoardException;
import com.kh.SharetheVision.board.model.service.BoardService;
import com.kh.SharetheVision.board.model.vo.Board;
import com.kh.SharetheVision.board.model.vo.PageInfo;
import com.kh.SharetheVision.board.model.vo.Pagination;
import com.kh.SharetheVision.board.model.vo.Reply;
import com.kh.SharetheVision.board.model.vo.Scrap;
import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.project.model.vo.Project;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("board.bo")
	public String board(Model model, HttpSession session) {

		int deptNo = ((Member) session.getAttribute("loginUser")).getDeptNo();
		String mCode = ((Member) session.getAttribute("loginUser")).getmCode();

		ArrayList<Board> list = service.newBoard(deptNo);
		ArrayList<Scrap> list2 = service.scrapList(mCode);
//		System.out.println(list2);
		model.addAttribute("board", list);
		model.addAttribute("scrap", list2);

		return "board";
	}

	@RequestMapping("boardDetail.bo")
	public String boardDetail(@RequestParam("bId") int bId, Model model, HttpSession session, RedirectAttributes rttr) {

		String mCode = ((Member) session.getAttribute("loginUser")).getmCode();

		Scrap s = new Scrap();
		s.setmCode(mCode);
		s.setBoardNo(bId);

		String strbId = bId+"";

		Board board = service.selectBoardDetail(bId);
		Scrap scrapState = service.scrapState(s);
		Attachment attachedFile = service.selectAttachedFile(strbId);
		ArrayList<Reply> reply = service.selectReplyList(bId);

//		System.out.println(attachedFile);
//		System.out.println(reply);
		
		model.addAttribute("scrapState", scrapState);
		model.addAttribute("board", board);
		model.addAttribute("attachedFile", attachedFile);
		model.addAttribute("reply", reply);
		
		return "boardDetail";

	}

	@RequestMapping("boardStatus.bo")
	public void boardStatus(@RequestParam(value = "bId") int bId, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");

		String str = null;

		Board status = service.selectBoardStatus(bId);

		try {
			PrintWriter out = response.getWriter();
			if (status != null) { // 삭제된 글이면
				str = "삭제";

			} else if (status == null) {
				str = "존재";
			}
			out.println(str);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("boardList.bo")
	public ModelAndView boardList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpSession session, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");

		String boardListTitle = "부서별 자료실";

		int deptNo = ((Member) session.getAttribute("loginUser")).getDeptNo();

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = service.getListCount(deptNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Board> list = service.selectBoardList(pi, deptNo);

//		System.out.println(list);
		if (list != null) {
			mv.addObject("board", list).addObject("pi", pi).addObject("boardListTitle", boardListTitle);
			mv.setViewName("boardList");
		} else {
			mv.setViewName("home");
		}

		return mv;
	}

	@RequestMapping("boardScrapList.bo")
	public ModelAndView boardScrapList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpSession session, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");

		String boardListTitle = "스크랩한 게시물";

		String mCode = ((Member) session.getAttribute("loginUser")).getmCode();

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = service.getScrapListCount(mCode);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Scrap> list = service.selectScrapBoardList(pi, mCode);

//		System.out.println(list);
		if (list != null) {
			mv.addObject("board", list).addObject("pi", pi).addObject("boardListTitle", boardListTitle);
			mv.setViewName("boardList");
		} else {
			mv.setViewName("home");
		}

		return mv;
	}

	@RequestMapping("boardInsertForm.bo")
	public String boardInsertForm(@RequestParam(value = "deptNo") int deptNo, Model model) {

		ArrayList<Project> list = service.selectProjectList(deptNo);

//		System.out.println(list);
		model.addAttribute("project", list);

		return "boardInsert";
	}

	@RequestMapping("boardInsert.bo")
	public String boardInsert(@ModelAttribute Board b, @RequestParam(value = "uploadFile") MultipartFile uploadFile,
			HttpServletRequest request) throws BoardException {

//		System.out.println(b);
		boolean fileUpload = false;

		int result = service.insertBoard(b);

		Board lastBoard = service.selectLastBoard();
		int lastBoardNo = lastBoard.getBoardNo();

		if (uploadFile != null && !uploadFile.isEmpty()) {
			Attachment attachFile = saveFile(uploadFile, request, lastBoardNo);
//			System.out.println(attachFile);

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

	@RequestMapping("deleteBoard.bo")
	public String boardDelete(@RequestParam(value = "bId") int bId) throws BoardException {

//		System.out.println(bId);
		String strbId = bId+"";

		int result = service.deleteBoard(bId);
		int result2 = service.deleteBoardAttachFile(strbId);

		if (result > 0) {
			return "redirect:boardList.bo";
		} else {
			throw new BoardException("게시글 삭제에 실패했습니다.");
		}

	}

	@RequestMapping("updateBoardForm.bo")
	public String updateBoard(@ModelAttribute Board b, Model model) {

		int bId = b.getBoardNo();
		int deptNo = b.getDeptNo();
		
		String strbId = bId+"";

		Attachment attachFile = service.selectAttachedFile(strbId);
		ArrayList<Project> list = service.selectProjectList(deptNo);

//		System.out.println(attachFile);

		model.addAttribute("board", b).addAttribute("attachFile", attachFile).addAttribute("project", list);

		return "boardUpdate";
	}

	@RequestMapping("boardUpdate.bo")
	public String updateBoard(@ModelAttribute Board b, @RequestParam(value = "uploadFile") MultipartFile uploadFile,
			HttpServletRequest request) throws BoardException {

		int bId = b.getBoardNo();
		
		String strbId = bId+"";
		
		Attachment attachFile = service.selectAttachedFile(strbId);

		if (uploadFile != null && !uploadFile.isEmpty()) {
			if (attachFile != null) {
				deleteFile(request, attachFile);
				service.deleteBoardAttachFile(strbId);
				Attachment newAttachFile = saveFile(uploadFile, request, bId);
				service.insertAttachFile(newAttachFile);
			} else {
				Attachment newAttachFile = saveFile(uploadFile, request, bId);
				service.insertAttachFile(newAttachFile);
			}
		}

		int result = service.updateBoard(b);

		if (result > 0) {
			return "redirect:boardList.bo";
		} else {
			throw new BoardException("게시글 수정에 실패했습니다.");
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

	public void deleteFile(HttpServletRequest request, Attachment attachFile) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\archive";

		File file = new File(savePath + "\\" + attachFile.getAtChange());
		if (file.exists()) {
			file.delete();
		}
	}

	@RequestMapping("addScrap.bo")
	public String addScrap(@ModelAttribute Scrap s) throws BoardException {

		int bId = s.getBoardNo();

		int result = service.insertScrap(s);

		if (result > 0) {
			return "redirect:boardDetail.bo?bId=" + bId;
		} else {
			throw new BoardException("게시물 스크랩에 실패했습니다.");
		}
	}

	@RequestMapping("deleteScrap.bo")
	public String deleteScrap(@RequestParam(value = "bId") int bId, HttpSession session) throws BoardException {

		String mCode = ((Member) session.getAttribute("loginUser")).getmCode();

		Scrap s = new Scrap();
		s.setBoardNo(bId);
		s.setmCode(mCode);

		int result = service.deleteScrap(s);

		if (result > 0) {
			return "redirect:boardDetail.bo?bId=" + bId;
		} else {
			throw new BoardException("스크랩 취소에 실패했습니다.");
		}

	}

	@RequestMapping("alertDeleteScrap.bo")
	public String alertDeleteScrap(@RequestParam(value = "bId") int bId,
			@RequestParam(value = "current") String current, HttpSession session) throws BoardException {

		String returnLocation = null;

		String mCode = ((Member) session.getAttribute("loginUser")).getmCode();

		Scrap s = new Scrap();
		s.setBoardNo(bId);
		s.setmCode(mCode);

//		System.out.println(current);

		int result = service.deleteScrap(s);

		if (result > 0) {
			if (current.equals("boardScrapList")) {
				returnLocation = "redirect:boardScrapList.bo";
			} else if (current.equals("board")) {
				returnLocation = "redirect:board.bo";
			}
		} else {
			throw new BoardException("스크랩 취소에 실패했습니다.");
		}

		return returnLocation;

	}

	@RequestMapping("boardSearch.bo")
	public ModelAndView boardSearch(@RequestParam("category") String category, @RequestParam("word") String word,
			ModelAndView mv, @RequestParam(value = "page", required = false) Integer page, HttpSession session) {

		int deptNo = ((Member) session.getAttribute("loginUser")).getDeptNo();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("word", word);
		map.put("deptNo", deptNo);

//		System.out.println(map);

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int searchListCount = service.selectSearchListCount(map);

//		System.out.println(searchListCount);

		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);

		ArrayList<Board> list = service.selectSearchBoard(pi, map);

//		System.out.println(list);

		if (list != null) {
			mv.addObject("board", list).addObject("pi", pi).addObject("category", category).addObject("word", word);
			mv.setViewName("boardList");
		} else {
			mv.setViewName("home");
		}
		return mv;
	}
	
	@RequestMapping("addReply.bo")
	@ResponseBody
	public String addReply(@RequestParam(value="replyContent") String replyContent,
						   @RequestParam(value="bId") int bId,
						   HttpServletRequest request) throws BoardException {
		
		String jobName = ((Member)request.getSession().getAttribute("loginUser")).getJobName();
		String deptName = ((Member)request.getSession().getAttribute("loginUser")).getDeptName();
		String replyWriter = ((Member)request.getSession().getAttribute("loginUser")).getName();
		String memberCode = ((Member)request.getSession().getAttribute("loginUser")).getmCode();
		
		
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setBoardNo(bId);
		r.setJobName(jobName);
		r.setDeptName(deptName);
		r.setReplyWriter(replyWriter);
		r.setMemberCode(memberCode);
		
		int result = service.addReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("댓글 등록에 실패했습니다.");
		}
		
	}
	
	@RequestMapping(value="replyList.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void selectReplyList(HttpServletResponse response, @RequestParam("bId") int bId) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Reply> list = service.selectReplyList(bId);
		
		GsonBuilder gb = new GsonBuilder();
		gb.setDateFormat("yyyy-MM-dd");
		
		Gson gson = gb.create();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteReply.bo")
	public String deleteReply(@RequestParam("rId") int rId, HttpServletRequest request) throws BoardException {
		
		int result = service.deleteReply(rId);
		
//		System.out.println("rId : " + rId);
//		System.out.println(result);
		
		String referer = request.getHeader("referer");
		if(result > 0) {
			return "redirect:" + referer;
		} else {
			throw new BoardException("댓글 삭제에 실패했습니다.");
		}
	}
	
}
