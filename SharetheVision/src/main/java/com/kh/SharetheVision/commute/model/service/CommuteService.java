package com.kh.SharetheVision.commute.model.service;

import java.util.HashMap;

import com.kh.SharetheVision.commute.model.vo.Commute;

public interface CommuteService {

	Commute commuteMain(String memberNo);

	int commuteEnter(HashMap<String, String> map);

}
