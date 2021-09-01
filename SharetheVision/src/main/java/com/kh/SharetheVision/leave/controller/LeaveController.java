package com.kh.SharetheVision.leave.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.SharetheVision.leave.model.exception.LeaveException;
import com.kh.SharetheVision.leave.model.service.LeaveService;
import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;

import au.com.bytecode.opencsv.CSVReader;

@Controller
public class LeaveController {
	
	@Autowired
	private LeaveService leService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("leaveDetail.le")
	public String leaveDetailView(HttpSession session, Model model) {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
//		String name = loginUser.getName();
//		String jobName = loginUser.getJobName();
		String name = "임지은";
		String jobName = "팀장";
		String deptName = "인사팀";
		String memberNo = "MaCo2";
		model.addAttribute("name", name);
		model.addAttribute("jobName", jobName);
		model.addAttribute("deptName", deptName);
		
		// 연차 생성
		ArrayList<LeaveAnnual> annualList = leService.selectAnnual(memberNo);
		if(annualList != null) {
			model.addAttribute("annualList", annualList);

			double annualTotal = 0;
			for(LeaveAnnual la : annualList) {
				if(la.getType() == 0) {
					annualTotal += la.getTotal();
				}
			}
			model.addAttribute("annualTotal", annualTotal);

			double adjustTotal = 0;
			for(LeaveAnnual la : annualList) {
				if(la.getType() == 1) {
					adjustTotal += la.getTotal();
				}
			}
			model.addAttribute("adjustTotal", adjustTotal);
		}
		
		// 연차 사용
		ArrayList<LeaveUsed> leaveList = leService.selectLeave(memberNo);
		if(leaveList != null) {
			model.addAttribute("leaveList", leaveList);
			
			double usedTotal = 0;
			for(LeaveUsed lu : leaveList) {
				if(lu.getStatus().charAt(0) == 'Y') {
					usedTotal += lu.getDays();
				}
			}
			model.addAttribute("usedTotal", usedTotal);
		}
		
		System.out.println("생성연차 : " + annualList);
		System.out.println("신청내역 : " + leaveList);
		
		return "leaveDetailView";
	}
	
	@RequestMapping("leaveAll.le")
	public String leaveMemberAll() {
		
		return "leaveMemberAll";
	}
	
	@RequestMapping("leaveSetting.le")
	public String leaveSetting(@RequestParam("uploadFile") MultipartFile file, HttpServletRequest request) throws LeaveException {
		
        LeaveAnnual la = null;
        int result = 0;
        int size = 0;
        
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.setTime(new Date(System.currentTimeMillis()));
		int year = cal.get(Calendar.YEAR);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/leaveSetting/setting.csv";
		
		File csv = new File(savePath);
		if(!csv.exists()) {
			csv.mkdirs();
		}
		
		try {
			file.transferTo(new File(savePath));
			CSVReader csvReader = new CSVReader(new FileReader(savePath));
			
			List<String[]> data = new ArrayList<String[]>();
            
            data = csvReader.readAll();
            
            ArrayList<LeaveAnnual> list = new ArrayList<LeaveAnnual>();
        	for(int i = 0; i < data.size()-1; i++) {
        		String[] line = data.get(i+1);
        		
        		la = new LeaveAnnual();
        		la.setYear(Integer.toString(year));
            	for(int j = 0; j < line.length; j++) {
            		if(j == 0) {
            			Member member = mService.loginMember(line[j].toString());
            			
            			la.setMemberId(line[j]);
            			la.setMemberNo(member.getmCode());
            			
//            			System.out.println("사원아이디 : " + line[j]);
            		} else if(j == 1) {
            			la.setBaseDate(line[j]);
            			la.setStartDate(year + line[j].substring(5));
            			la.setEndDate((year+1) + line[j].substring(5));
//            			System.out.println("입사일 : " + line[j]);
            		} else if(j == 2) {
            			la.setTotal(Integer.parseInt(line[j]));
//            			System.out.println("총 연차 개수 : " + line[j]);
            		} else if(j == 3) {
//            			System.out.println("사용 연차 개수 : " + line[j]);
            		}
            	}
            	list.add(la);
            }
        	
        	size = list.size();
        	result = leService.insertAnnaul(list);
        	
        	System.out.println(result + " : 인서트 결과");
        	
//            Iterator<String[]> it = data.iterator();
//            while (it.hasNext()) {
//                String[] array = (String[]) it.next();
//                for (String sr : array) {
//                    System.out.print(sr + " ");
//                }
//                System.out.print("\n");
//            }
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(result >= size) {
			return "leaveMemberAll";
		} else {
			throw new LeaveException("연차 초기 설정에 실패하였습니다.");
		}
		
	}
	
	@ResponseBody
	@RequestMapping("leaveRequest.le")
	public String leaveRequest(@ModelAttribute LeaveUsed lu) throws LeaveException {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
		lu.setMemberNo(memberNo);
		
		int result = leService.insertLeave(lu);
		
		if(result > 0) {
			return "success";
		} else {
			throw new LeaveException("휴가 신청에 실패하였습니다.");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="leaveList.le", produces="application/json; charset=utf-8")
	public String LeaveTable(HttpSession session) {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
		ArrayList<LeaveUsed> list = leService.selectLeave(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		
		return gson.toJson(map);
	}
	
	@RequestMapping("changeStatus.le")
	public String changeStatus(@RequestParam("status") String status, @RequestParam("no") int no, HttpSession session) throws LeaveException {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
		LeaveUsed lu = new LeaveUsed();
		lu.setMemberNo(memberNo);
		lu.setLeaveUsedNo(no);
		lu.setStatus(status);
		
		int result = leService.changeStatus(lu);
		System.out.println(result + " : 결과");
		
		if(result > 0) {
			return "redirect: leaveDetail.le";
		} else {
			throw new LeaveException("변경에 실패하였습니다.");
		}
	}
	
	
}
