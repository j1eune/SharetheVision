package com.kh.SharetheVision.ms.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.dao.MsDAO;
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

//	@Override
//	public int sendInsert(Messenger ms) {
//		return msdao.sendInsert(sqlSession, ms);
//	}

	@Override
	public List<Room> chatRoomList(String userId) {
		return msdao.selectRoomList(sqlSession,userId);
	}

	@Override
	public List<Messenger> messageList(int roomId) {
		return msdao.selectMList(sqlSession,roomId);
	}

	@Override
	public int insertRoom(Room r) {
		return msdao.insertRoom(sqlSession, r);
	}

	
	
}
