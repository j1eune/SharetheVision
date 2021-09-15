package com.kh.SharetheVision.commute.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.SharetheVision.approval.model.service.ApprovalService;
import com.kh.SharetheVision.approval.model.vo.ApprovalAcceptDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalAttachDTO;
import com.kh.SharetheVision.approval.model.vo.ApprovalVO;
import com.kh.SharetheVision.commute.model.exception.CommuteException;
import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.leave.model.service.LeaveService;
import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;
import com.kh.SharetheVision.member.model.service.MemberService;
import com.kh.SharetheVision.member.model.vo.Member;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService coService;
	
	@Autowired
	private LeaveService leService;
	
	@Autowired
	private ApprovalService apvService;
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("commuteMain.co")
	public String commuteMainView(Model model, HttpSession session) {
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		String memberNo = loginUser.getmCode();
		int state = loginUser.getmState();

		Commute co = coService.commuteDay(memberNo);
		
		if(co != null) {
			if(co.getCommuteStart() != null) {
				String[] startArr = co.getCommuteStart().split(" ");
				model.addAttribute("startTime", startArr[1]);
			}
			if(co.getCommuteEnd() != null) {
				String[] endArr = co.getCommuteEnd().split(" ");
				model.addAttribute("endTime", endArr[1]);
			}
		}
		
		// 멤버 리스트
		Member m = new Member();
		m.setmCode(memberNo);
		
		ArrayList<Member> mlist = mService.selectMemberList(m);
		
		if(mlist != null) {
			model.addAttribute("mlist", mlist);
		}
		
		// 휴가 요청 모달 데이터
		double annualTotal = 0;
		double adjustTotal = 0;
		ArrayList<LeaveAnnual> annualList = leService.selectAnnual(memberNo);
		if(annualList != null) {
			for(LeaveAnnual la : annualList) {
				if(la.getType() == 0) {
					annualTotal += la.getTotal();
				}
			}

			for(LeaveAnnual la : annualList) {
				if(la.getType() == 1) {
					adjustTotal += la.getTotal();
				}
			}
		}
		double usedTotal = 0;
		ArrayList<LeaveUsed> leaveList = leService.selectLeave(memberNo);
		if(leaveList != null) {
			for(LeaveUsed lu : leaveList) {
				if(lu.getStatus().charAt(0) == 'Y') {
					usedTotal += lu.getDays();
				}
			}
		}
		double remain = annualTotal+adjustTotal-usedTotal;
		model.addAttribute("remain", remain);
		
		// 상태 변경
		model.addAttribute("state", state);
		
		return "commuteMainView";
	}
	
	@RequestMapping("commuteEnter.co")
	public String commuteEnter(@RequestParam(value="mCode", required=false) String mCode, HttpSession session, Model model) throws CommuteException {
		
		String memberNo = ((Member)session.getAttribute("loginUser")).getmCode();
		
		if(mCode != null && !mCode.equals(memberNo)) {
			throw new CommuteException("로그인된 회원이 아닙니다.");
		}
		
		if(coService.commuteDay(memberNo) != null) {
			model.addAttribute("msg", "이미 출근 인증이 완료됐습니다.");
			model.addAttribute("url", "commuteMain.co");
			return "commuteAlert";
		}
			
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String enterTime = sdf.format(date);
//		String enterTime = "2021-09-15 08:43:54";
		
		// 지각 여부
		int status = 0;
		try {
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
			String checkStr = sdf2.format(date);
			java.util.Date check = sdf2.parse(checkStr);
			java.util.Date nine = sdf2.parse("09:01:00");
			
			boolean before = check.before(nine);

			status = (before ? 1 : 2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Commute co = new Commute();
		co.setMemberNo(memberNo);
		co.setCommuteStart(enterTime);
		co.setStatus(status);
		
		int result = coService.commuteEnter(co);
		
		if(result > 0) {
			if(mCode != null) {
				model.addAttribute("qr", "qr");
			}
			
			model.addAttribute("msg", "출근이 인증되었습니다.");
	        model.addAttribute("url", "commuteMain.co");
			
	        return "commuteAlert";		
		} else {
			throw new CommuteException("출근 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("commuteOut.co")
	public String commuteOut(HttpSession session) throws CommuteException {
		
		String memberNo = ((Member)session.getAttribute("loginUser")).getmCode();
//		String memberNo = "MaCo2";

		Commute todayCo = coService.commuteDay(memberNo);
		String start = todayCo.getCommuteStart();
//		String start = "2021-09-12 08:54:38";
		
		// 퇴근 시간
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String end = sdf.format(date);
//		String end = "2021-09-12 12:30:16";
		
		// 18시 이후 여부
		Double workTime = 0.00;
		try {
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
			String checkStr = sdf2.format(date);
			java.util.Date check = sdf2.parse(checkStr);
//			java.util.Date check = sdf2.parse("20:30:30");
			java.util.Date six = sdf2.parse("18:01:00");
			
			boolean before = check.before(six);
			
			// worktime 계산
			java.util.Date startDate = null;
			java.util.Date endDate = null;
			startDate = sdf.parse(start);
			
			if(before) {
				endDate = sdf.parse(end);
			} else {
				String endTemp = end.substring(0, 11) + "18:00:00";
				endDate = sdf.parse(endTemp);
			}
			
			// 휴일 출근 여부
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			int dayNum = cal.get(Calendar.DAY_OF_WEEK);
			
			// worktime 계산
			if(dayNum == 1 || dayNum == 7) {
				// 일요일이거나 토요일이면 (overwork에 들어감)
				workTime = 0.00;
			} else {
				long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
				long hour = diffSec/3600;
				long min = diffSec%3600/60;
				
				String mins = (min < 10) ? "0"+min : Long.toString(min);
				String fTime = (hour - 1 + "." + mins);
				
				workTime = Double.parseDouble(fTime);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Commute co = new Commute();
		co.setCommuteStart(start);
		co.setCommuteEnd(end);
		co.setWorktime(workTime);
		co.setMemberNo(memberNo);

		int result = coService.commuteOut(co);
		
		if(result > 0) {
			return "redirect: commuteMain.co";				
		} else {
			throw new CommuteException("퇴근 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("changeState.co")
	public String changeState(@RequestParam("state") int state, HttpSession session) throws CommuteException {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		m.setmState(state);
		
		int result = coService.changeState(m);
		if(result > 0) {
			return "redirect: commuteMain.co";
		} else {
			throw new CommuteException("상태 변경에 실패하였습니다.");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="commuteChart.co", produces="application/json; charset=utf-8")
	public String commuteChart(HttpSession session) {
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
//		String memberNo = "MaCo2";
		
		HashMap<String, String> map = getDate(1, null, null);
		map.put("memberNo", memberNo);
		map.put("approval", "Y");
		
		ArrayList<Commute> colist = coService.commuteList(map);
		ArrayList<Overwork> owlist = coService.overworkList(map);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// 이번 주 차트
//		System.out.println(colist);
//		System.out.println(owlist);
		
		resultMap.put("colist", colist);
		resultMap.put("owlist", owlist);
		
		return gson.toJson(resultMap);
	}
	
	@ResponseBody
	@RequestMapping(value="commuteTime.co", produces="application/json; charset=utf-8")
	public String commuteTime(HttpSession session) {
		Member loginUser = ((Member)session.getAttribute("loginUser"));

		String memberNo = null;
		if(loginUser != null) {
			memberNo = loginUser.getmCode();
		}
		
		Commute commute = coService.commuteDay(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(commute);
	}
	
	@RequestMapping("commuteDetail.co")
	public String commuteDetailView(HttpSession session, Model model) {
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
//		String memberNo = "MaCo2";
		
		HashMap<String, String> weekMap = getDate(1, null, null);
		weekMap.put("memberNo", memberNo);
		weekMap.put("approval", "Y");
		
		ArrayList<Commute> weekCoList = coService.commuteList(weekMap);
		ArrayList<Overwork> weekOwList = coService.overworkList(weekMap);
		
		HashMap<String, String> monMap = getDate(2, null, null);
		monMap.put("memberNo", memberNo);
		monMap.put("approval", "Y");

		ArrayList<Commute> monCoList = coService.commuteList(monMap);
		ArrayList<Overwork> monOwList = coService.overworkList(monMap);
		
		double doubleWeekWork = 0;
		if(weekCoList != null) {
			for(Commute co : weekCoList) {
				doubleWeekWork += co.getWorktime();
			}
			String weekWorkTotal = getFormat(doubleWeekWork);
			model.addAttribute("weekWorkTotal", weekWorkTotal);
		}
		
		if(weekOwList != null) {
			double total = 0;
			for(Overwork ow : weekOwList) {
				total += ow.getOverworktime();
			}
			String weekOverTotal = getFormat(total);
			String remainTotal = getFormat(52-(doubleWeekWork + total));
			
			model.addAttribute("weekOverTotal", weekOverTotal);
			model.addAttribute("remainTotal", remainTotal);
		}
		
		if(monCoList != null) {
			double total = 0;
			for(Commute co : monCoList) {
				total += co.getWorktime();
			}
			String monthWorkTotal = getFormat(total);
			model.addAttribute("monthWorkTotal", monthWorkTotal);
		}

		if(monOwList != null) {
			double total = 0;
			for(Overwork ow : monOwList) {
				total += ow.getOverworktime();
			}
			String monthOverTotal = getFormat(total);
			model.addAttribute("monthOverTotal", monthOverTotal);
		}
		
//		System.out.println(weekCoList);
//		System.out.println(weekOwList);
//		System.out.println(monCoList);
//		System.out.println(monOwList);
		
		return "commuteDetailView";
	}
	
	public String getFormat(double total) {
		total = Math.round(total*100)/100.0;
		String totalStr = Double.toString(total);
		
		int point = totalStr.indexOf(".");
		String hour = totalStr.substring(0, point);
		String min = totalStr.substring(point+1);
		
		return String.format("%sh %sm", hour, min);
	}
	
	
	@ResponseBody
	@RequestMapping(value="commuteTable.co", produces="application/json; charset=utf-8")
	public String commuteTable(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("last") int last, HttpSession session) {

		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
//		String memberNo = "MaCo2";
		
		String selectedMonthStart = year+"/"+month+"/"+"01";
		String selectedMonthEnd = year+"/"+month+"/"+last;
		
		HashMap<String, String> map = getDate(3, selectedMonthStart, selectedMonthEnd);
		map.put("memberNo", memberNo);
		map.put("approval", "Y");
		
		ArrayList<Commute> colist = coService.commuteList(map);
		ArrayList<Overwork> owlist = coService.overworkList(map);
		
//		System.out.println(colist);
//		System.out.println(owlist);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("colist", colist);
		resultMap.put("owlist", owlist);
		
		return gson.toJson(resultMap);
	}
	
	
	public HashMap<String, String> getDate(int check, String selectedMonthStart, String selectedMonthEnd) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		Date date = new Date(System.currentTimeMillis());
		cal.setTime(date);
		
		// 이번 주 일요일 날짜 
		cal.add(Calendar.DATE, 1 - cal.get(Calendar.DAY_OF_WEEK));	
		String weekStart = sdf.format(cal.getTime());
		
		// 이번 주 마지막날 날짜
		cal.add(Calendar.DATE, 7 - cal.get(Calendar.DAY_OF_WEEK));	
		String weekEnd = sdf.format(cal.getTime());
		
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH)+1;
		int monthStart = cal.getMinimum(Calendar.DAY_OF_MONTH);	    // 이번 달 시작 날짜
		int monthEnd = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	// 이번 달 마지막 날짜
		
		String monStart = year+"/"+mon+"/"+monthStart;
		String monEnd = year+"/"+mon+"/"+monthEnd;
		
		String start = null;
		String end = null;
		if(check == 1) {
			// 이번 주
			start = weekStart;
			end = weekEnd;
		} else if(check == 2) {
			// 이번 달
			start = monStart;
			end = monEnd;
		} else if(check == 3) {
			// 선택한 달
			start = selectedMonthStart;
			end = selectedMonthEnd;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping("owInsert.co")
	public String overworkRequest(@ModelAttribute Overwork ow, @RequestParam("approval") String approval, HttpSession session) throws CommuteException {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
//		String memberNo = "MaCo2";
		
		ow.setMemberNo(memberNo);
		
		int result = coService.insertOverwork(ow);
		int no = ow.getOverworkNo();
//		System.out.println(no + " : 시퀀스");
		
		int apvResult = 0;
		int acceptResult = 0;
		if(result > 0) {
			ApprovalVO apv = new ApprovalVO();
			
			apv.setApvType("연장근무");
			apv.setmCode(memberNo);
			apv.setApvApp(approval);			
			apv.setApt("연장 근무 신청서");
			String type = null;
			if(ow.getType() == 1) {
				type = "연장근무";
			} else if(ow.getType() == 2){
				type = "야간근무";
			} else if(ow.getType() == 3){
				type="휴일근무";
			}
			apv.setComment("근무종류 : " + type +
						  "\r\n날짜 : " + ow.getOverworkDate() +
						  "\r\n시작시간 : " + ow.getOverworkStart() +
						  "\r\n종료시간 : " + ow.getOverworkEnd() +
						  "\r\n총 시간  : " + ow.getOverworktime() +
						  "\r\n사유 : " + ow.getOverworkContent());
			
			apv.setApvRefNo(no);
			
			long miliseconds = System.currentTimeMillis();
			Date arrive = new Date(miliseconds);
			apv.setArrive(arrive);
			Date depart = ow.getOverworkDate();
			apv.setDepart(depart);
		
			System.out.println(apv);
			apvResult = apvService.insertApproval(apv);
			
			if(apvResult > 0) {
				String[] appArr = apv.getApvApp().split(",");
				for (String app : appArr) {
					acceptResult = apvService.insertApprovalAccept(new ApprovalAcceptDTO(apv.getApvNo(), app, "APP"));
				}
			}
		}
		
		if(acceptResult > 0) {
			return "success";
		} else {
			throw new CommuteException("연장 근무 신청에 실패하였습니다.");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="overworkList.co", produces="application/json; charset=utf-8")
	public String overworkTable(HttpSession session) {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
//		String memberNo = "MaCo2";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNo", memberNo);
		
		ArrayList<Overwork> list = coService.overworkList(map);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("list", list);
		
		return gson.toJson(resultMap);
	}
	
	@RequestMapping("overworkDetailView.co")
	public String overworkFull(Model model, HttpSession session) {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
//		String memberNo = "MaCo2";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNo", memberNo);
		
		ArrayList<Overwork> list = coService.overworkList(map);
		if(list != null) {
			Collections.reverse(list);
			
			model.addAttribute("list", list);			
		}
		
		return "overworkDetailView";
	}
	
	@RequestMapping("qrStart.co")
	public String qrCommuteEnter() {
		return "commuteQR";
	}
	
	@ResponseBody
	@RequestMapping("commuteRequest.co")
	public String commuteRequest(@ModelAttribute Commute co, @RequestParam("approval") String approval, @RequestParam("commuteContent") String content, HttpSession session) throws CommuteException {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
//		String memberNo = "MaCo2";
		
		ApprovalVO apv = new ApprovalVO();
		
		apv.setApvType("근태변경");
		apv.setmCode(memberNo);
		apv.setApvApp(approval);
		apv.setApt("근태 변경 신청서");
		String type = null;
		if(co.getStatus() == 1) {
			type = "지각";
		} else if(co.getStatus() == 2){
			type = "조퇴";
		} else if(co.getStatus() == 3){
			type = "결근";
		}
		apv.setComment("근무종류 : " + type +
					  "\r\n날짜 : " + co.getEnrollDate() +
					  "\r\n출근시간 : " + co.getCommuteStart() +
					  "\r\n퇴근시간 : " + co.getCommuteEnd() +
					  "\r\n사유 : " + content);
		
		int no = coService.selectCommuteOne(co).getCommuteNo();
		apv.setApvRefNo(no);			
		
		long miliseconds = System.currentTimeMillis();
		Date arrive = new Date(miliseconds);
		apv.setArrive(arrive);
		apv.setDepart(arrive);
		
		int result = apvService.insertApproval(apv);
		
		int acceptResult = 0;
		if(result > 0) {
			String[] appArr = apv.getApvApp().split(",");
			for (String app : appArr) {
				acceptResult = apvService.insertApprovalAccept(new ApprovalAcceptDTO(apv.getApvNo(), app, "APP"));
			}
		}
		
		if(acceptResult > 0) {
			return "success";
		} else {
			throw new CommuteException("근태 변경 신청에 실패하였습니다.");
		}
	}
	
	@RequestMapping("coRequestDetailView.co")
	public String coRequestDetailView() {
		
		return "coRequestDetail";
	}
	
	public String update(String memberNo) {
		// 업데이트 하는 쿼리
		// 마지막 C또는 D가 끝나면
		int apNo = 18;
		
		ApprovalVO apv = new ApprovalVO();
		apv.setApvNo(apNo);
		
		ApprovalVO ap = apvService.selectOne(apv);
		int no = ap.getApvRefNo();
		
		// 연장근무 update
//		int result = coService.overworkUpdate(no);
		
		// 휴가신청 update
//		int result = leService.leaveUpdate(no);
		
//		System.out.println(result + " : 결과");
		
		// 근태변경 update
		String[] comArr = ap.getComment().split("\r\n");
		String typeStr = comArr[0].substring(7);
		String date = comArr[1].substring(5);
		String start = comArr[2].substring(7);
		String end = comArr[3].substring(7);
		
		Commute co = new Commute();
		co.setCommuteStart(date + " " + start + ":00");
		co.setCommuteEnd(date + " " + end + ":00");
		co.setStatus(0);
		
		// worktime 계산
		try {
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
			java.util.Date startDate = sdf2.parse(start);
			java.util.Date endDate = sdf2.parse(end);
			
			long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
			long hour = diffSec/3600;
			long min = diffSec%3600/60;
			
			String mins = (min < 10) ? "0"+min : Long.toString(min);
			String fTime = (hour - 1 + "." + mins);
			
			double workTime = Double.parseDouble(fTime);
			
			co.setWorktime(workTime);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		co.setCommuteNo(no);
		
		int result = coService.updateCommute(co);
		System.out.println(co);
		System.out.println(result + ":결과");
		
		return "success";
	}
	
}
