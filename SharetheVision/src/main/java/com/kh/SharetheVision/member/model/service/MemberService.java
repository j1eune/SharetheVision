package com.kh.SharetheVision.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	ArrayList<Member> selectMember(HashMap<String, String> map);

}
