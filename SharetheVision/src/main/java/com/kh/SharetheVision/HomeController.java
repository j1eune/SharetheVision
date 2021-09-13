package com.kh.SharetheVision;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.SharetheVision.commute.model.service.CommuteService;
import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.leave.model.service.LeaveService;
import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;
import com.kh.SharetheVision.member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private LeaveService leService;
	
	@Autowired
	private CommuteService coService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
		return "../../index";
	}
	
	@RequestMapping("main")
	public String main(HttpSession session, Model model) {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String memberNo = loginUser.getmCode();
		
		// 연차 생성
		ArrayList<LeaveAnnual> annualList = leService.selectAnnual(memberNo);
		double annualTotal = 0;
		double adjustTotal = 0;
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
		model.addAttribute("total", annualTotal+adjustTotal);
		
		// 연차 사용
		ArrayList<LeaveUsed> leaveList = leService.selectLeave(memberNo);
		double usedTotal = 0;
		if(leaveList != null) {
			for(LeaveUsed lu : leaveList) {
				if(lu.getStatus().charAt(0) == 'Y') {
					usedTotal += lu.getDays();
				}
			}
		}
		model.addAttribute("usedTotal", usedTotal);
		
		// 근태현황
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		Date date = new Date(System.currentTimeMillis());
		cal.setTime(date);
		
		// 이번 주
		cal.add(Calendar.DATE, 1 - cal.get(Calendar.DAY_OF_WEEK));	
		String start = sdf.format(cal.getTime());
		
		cal.add(Calendar.DATE, 7 - cal.get(Calendar.DAY_OF_WEEK));	
		String end = sdf.format(cal.getTime());
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		map.put("approval", "Y");
		
		ArrayList<Commute> colist = coService.commuteList(map);
		ArrayList<Overwork> owlist = coService.overworkList(map);
		
		int coTotal = 0;
		int tardy = 0;
		for(Commute co : colist) {
			coTotal += co.getWorktime();
			if(co.getStatus() == 2) {
				tardy++;
			}
		}
		model.addAttribute("coTotal", coTotal);
		model.addAttribute("tardy", tardy);
		
		int owTotal = 0;
		for(Overwork ow : owlist) {
			owTotal += ow.getOverworktime();
		}
		model.addAttribute("owTotal", owTotal);
		
		// 이번 달 근로횟수
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH)+1;
		int monthStart = cal.getMinimum(Calendar.DAY_OF_MONTH);	    // 이번 달 시작 날짜
		int monthEnd = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	// 이번 달 마지막 날짜
		
		String monStart = year+"/"+mon+"/"+monthStart;
		String monEnd = year+"/"+mon+"/"+monthEnd;
		
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("start", monStart);
		map2.put("end", monEnd);
		map2.put("memberNo", memberNo);
		map2.put("approval", "Y");
		
		ArrayList<Commute> list = coService.commuteList(map2);
		
		model.addAttribute("coCount", list.size());
		
		String[] monArr = {"31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"};
		String mEnd = monArr[mon];
		
		model.addAttribute("monEnd", mEnd);

		model.addAttribute("month", mon);
		
		return "home";
	}
	
	
}
