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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.SharetheVision.leave.model.exception.LeaveException;
import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.member.model.vo.Member;

import au.com.bytecode.opencsv.CSVReader;

@Controller
public class LeaveController {
	
//	@Autowired
//	private LeaveService leService;
	
//	@Autowired
//	private MemberService mService;
	
	@RequestMapping("leaveDetail.le")
	public String leaveDetailView(HttpSession session, Model model) {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
//		String name = loginUser.getName();
//		String jobName = loginUser.getJobName();
		String name = "임지은";
		String jobName = "팀장";
		String memberNo = "MaCo2";

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("type", 0);
		
//		ArrayList<LeaveAnnual> laList = leService.selectAnnual(map);
//		System.out.println(laList);
//		
//		
//		model.addAttribute("name", name + " " + jobName);
//		
//		
//		int annualTotal = 0;
//		if(laList != null) {
//			for(LeaveAnnual la : laList) {
//				annualTotal += la.getTotal();
//			}
//			model.addAttribute("annualTotal", annualTotal);
//		}
//		
//		ArrayList<LeaveUsed> luList = leService.selectUsed(memberNo);
		
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
            			Member m = new Member();
            			m.setmId(line[j]);
//            			Member member = mService.loginMember(m);
            			
            			la.setMemberId(line[j]);
//            			la.setMemberNo(member.getmCode());
            			
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
//        	result = leService.insertLeave(list);
        	
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
}
