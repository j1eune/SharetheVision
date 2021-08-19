package com.kh.SharetheVision.commute.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.member.model.vo.Member;

public interface CommuteService {

	ArrayList<Commute> commuteList(String memberNo);

	ArrayList<Overwork> overworkList(String memberNo);

	int commuteEnter(HashMap<String, String> map);

	int commuteOut(HashMap<String, String> map);

	int changeState(Member m);
}
