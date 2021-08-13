package com.kh.SharetheVision.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LeaveController {
	
	@RequestMapping("leaveDetail.le")
	public String leaveDetailView() {
		return "leaveDetailView";
	}
}
