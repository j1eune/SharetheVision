package com.kh.SharetheVision.ms.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.vo.Messenger;

public interface MsService {

	ArrayList<Member> tolist();

	int sendInsert(Messenger ms);

}
