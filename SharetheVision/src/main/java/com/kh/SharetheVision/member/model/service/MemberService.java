package com.kh.SharetheVision.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	ArrayList<Member> selectMember(HashMap<String, Object> map);

	Member checkEmail(Member m);

	Member loginMember(String mId);

	int updateMember(Member m);

	int updatePwd(Member m);

	int getListCount(HashMap<String, Object> map);

	int searchListCount(String search);

	ArrayList<Member> searchMember(HashMap<String, Object> map);

	ArrayList<Member> selectMemberList(Member m);

	ArrayList<Member> pSearchMember(HashMap<String, Object> map);

	ArrayList<Member> selectTeamMember(int deptNo);

	Member selectMemberName(String string);

}
