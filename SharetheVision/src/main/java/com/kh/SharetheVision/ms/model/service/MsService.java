package com.kh.SharetheVision.ms.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.vo.Messenger;
import com.kh.SharetheVision.ms.model.vo.Room;

public interface MsService {

	ArrayList<Member> tolist();

//	int sendInsert(Messenger ms);

	List<Room> chatRoomList(String userId);

	List<Messenger> messageList(int roomId);

}
