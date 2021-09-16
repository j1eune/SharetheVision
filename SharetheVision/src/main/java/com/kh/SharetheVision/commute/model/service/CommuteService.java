package com.kh.SharetheVision.commute.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.commute.model.vo.Commute;
import com.kh.SharetheVision.commute.model.vo.Overwork;
import com.kh.SharetheVision.member.model.vo.Member;

public interface CommuteService {

	ArrayList<Commute> commuteList(HashMap<String, String> map);

	ArrayList<Overwork> overworkList(HashMap<String, String> map);

	int commuteEnter(Commute co);

	int commuteOut(Commute co);

	int changeState(Member m);

	Commute commuteDay(String memberNo);

	int insertOverwork(Overwork ow);

	int overworkUpdate(int no);

	Commute selectCommuteOne(Commute co);

	int updateCommute(Commute co);
}
