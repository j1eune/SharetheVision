package com.kh.SharetheVision.leave.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.leave.model.vo.LeaveAnnual;
import com.kh.SharetheVision.leave.model.vo.LeaveUsed;

public interface LeaveService {

	int insertAnnaul(ArrayList<LeaveAnnual> list);

	ArrayList<LeaveAnnual> selectAnnual(String memberNo);

	ArrayList<LeaveUsed> selectLeave(String memberNo);

	int insertLeave(LeaveUsed lu);

}
