package com.kh.SharetheVision.ms.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.dao.MsDAO;
import com.kh.SharetheVision.ms.model.vo.ChatVo;
import com.kh.SharetheVision.ms.model.vo.Messenger;
import com.kh.SharetheVision.ms.model.vo.Room;

@Service("msService")
public class MsServiceImple implements MsService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MsDAO msdao;

	@Override
	public ArrayList<Member> tolist() {
		return msdao.toList(sqlSession);
	}

	@Override
	public List<Room> chatRoomList(String userName,int deptNo) {
		return msdao.selectRoomList(sqlSession, userName, deptNo);
	}
	
	@Override
	public List<Messenger> messageList(int roomId) {
		return msdao.selectMList(sqlSession,roomId);
	}
	
	@Override
	public Room existChatRoom(Room r) {
		return msdao.existRoom(sqlSession, r);
	}

	@Override
	public int insertRoom(Room r) {
		return msdao.insertRoom(sqlSession, r);
	}

	@Override
	public void insertMessage(ChatVo chatVo) {
		msdao.insertMessage(sqlSession,chatVo);
	}

	@Override
	public int readCount(ChatVo chatVo) {
		return msdao.readCount(sqlSession, chatVo);
	}

	@Override
	public void updateCount(int roomId) {
		msdao.updateCount(sqlSession, roomId);
	}

	@Override
	public int hasNotRead(String userName) {
		return msdao.hasNotRead(sqlSession, userName);
	}

	@Override
	public int deleteRoom(int rno) {
		return msdao.deleteRoom(sqlSession, rno);
	}

	
	
}
