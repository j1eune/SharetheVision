package com.kh.SharetheVision.leave.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;

public interface LeaveService {

	ArrayList<LeaveAnnual> selectAnnual(HashMap<String, Object> map);

	ArrayList<LeaveUsed> selectUsed(String memberNo);
}
