package com.kh.SharetheVision.commute.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.kh.SharetheVision.commute.model.exception.CommuteException;
import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.leave.model.service.LeaveService;
import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService coService;
	
	@Autowired
	private LeaveService leService;
	
	@RequestMapping("commuteMain.co")
	public String commuteMainView(Model model, HttpSession session) {

//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
//		String memberNo = loginUser.getmCode();
//		int state = loginUser.getmState();
		String memberNo = "MaCo2";
		int state = 2;
		
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
		
//		double total = 0;
//		if(colist != null) {
//			for(Commute co : colist) {
//				total += co.getWorktime();
//				
//				// DB데이터가 오늘이면
//				Date date = new Date(System.currentTimeMillis());
//				if(co.getEnrollDate().toString().equals(date.toString())) {
//					
//					if(co.getCommuteStart() != null) {
//						String[] startArr = co.getCommuteStart().split(" ");
//						model.addAttribute("startTime", startArr[1]);						
//					}
//					
//					if(co.getCommuteEnd() != null) {
//						String[] endArr = co.getCommuteEnd().split(" ");
//						model.addAttribute("endTime", endArr[1]);						
//					}
//				}
//			}
//			String totalStr = Double.toString(total);
//			int point = totalStr.indexOf(".");
//			String hour = totalStr.substring(0, point);
//			String min = totalStr.substring(point+1);
			
//			model.addAttribute("totalHour", hour);
//			model.addAttribute("totalMin", min);
//		}
		
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
	public String commuteEnter(HttpSession session, Model model) throws CommuteException {
		
//		String memberNo = ((Member)session.getAttribute("loginUser")).getmCode();
		String memberNo = "MaCo2";
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		String enterTime = sdf.format(date);
		String enterTime = "2021-08-22 08:30:30";
		
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
		
		map.put("status", status);
		map.put("enterTime", enterTime);
		map.put("memberNo", memberNo);
		
		int result = coService.commuteEnter(map);
		
		if(result > 0) {
			return "redirect: commuteMain.co";			
		} else {
			throw new CommuteException("출근 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("commuteOut.co")
	public String commuteOut(HttpSession session) throws CommuteException {
		
//		String memberNo = ((Member)session.getAttribute("loginUser")).getmCode();
		String memberNo = "MaCo2";

		Commute co = coService.commuteDay(memberNo);
//		String start = co.getCommuteStart();
		String start = "2021-08-22 08:30:30";
		
		// 퇴근 시간
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		String end = sdf.format(date);
		String end = "2021-08-22 20:30:30";
		
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
			
			// worktime 계산
			long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
			long hour = diffSec/3600;
			long min = diffSec%3600/60;
			
			String mins = (min < 10) ? "0"+min : Long.toString(min);
			String fTime = (hour - 1 + "." + mins);
			workTime = Double.parseDouble(fTime);
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("enterTime", start);
		map.put("outTime", end);
		map.put("workTime", workTime);
		map.put("memberNo", memberNo);
		
		int result = coService.commuteOut(map);
		
		if(result > 0) {
			return "redirect: commuteMain.co";				
		} else {
			throw new CommuteException("퇴근 등록에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("changeState.co")
	public String changeState(@RequestParam("state") int state, HttpSession session) {
		
//		Member m = ((Member)session.getAttribute("loginUser"));
//		m.setmState(state);
		
//		int result = coService.changeState(m);
		
//		if(result > 0) {
//			return "redirect: commuteMain.co";
//		} else {
//			throw new CommuteException("상태 변경에 실패하였습니다.");
//		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="commuteChart.co", produces="application/json; charset=utf-8")
	public String commuteChart() {
		
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
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
	
	@RequestMapping("commuteDetail.co")
	public String commuteDetailView(HttpSession session, Model model) {
		
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
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
		
		return String.format("%sm %sm", hour, min);
	}
	
	
	@ResponseBody
	@RequestMapping(value="commuteTable.co", produces="application/json; charset=utf-8")
	public String commuteTable(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("last") int last) {

//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
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
		int monthStart = cal.getMinimum(Calendar.DAY_OF_MONTH);	// 이번 달 시작 날짜
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
	public String overworkInsert(@ModelAttribute Overwork ow, HttpSession session) throws CommuteException {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
		ow.setMemberNo(memberNo);
		
		int result = coService.insertOverwork(ow);
		
		if(result > 0) {
			return "success";
		} else {
			throw new CommuteException("요청 작성에 실패하였습니다.");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="overworkList.co", produces="application/json; charset=utf-8")
	public String overworkTable(HttpSession session) {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNo", memberNo);
		
		ArrayList<Overwork> list = coService.overworkList(map);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("list", list);
		
		return gson.toJson(resultMap);
	}
	
	@RequestMapping("overworkDetailView.co")
	public String overworkFull(Model model) {
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
//		String memberNo = loginUser.getmCode();
		String memberNo = "MaCo2";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNo", memberNo);
		
		ArrayList<Overwork> list = coService.overworkList(map);
		
		if(list != null) {
			model.addAttribute("list", list);			
		}
		
		return "overworkDetailView";
	}
	
}
