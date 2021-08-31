package com.kh.SharetheVision.ms.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.vo.ChatVo;
import com.kh.SharetheVision.ms.model.vo.Messenger;
import com.kh.SharetheVision.ms.model.vo.Room;

public interface MsService {

	ArrayList<Member> tolist();

	List<Room> chatRoomList(String userName, int deptNo);

	List<Messenger> messageList(int roomId);

	Room existChatRoom(Room r);
	
	int insertRoom(Room r);

	void insertMessage(ChatVo chatVo);

	int readCount(ChatVo chatVo);

	void updateCount(int roomId);

	int hasNotRead(String userName);

	int deleteRoom(int rno);

}
