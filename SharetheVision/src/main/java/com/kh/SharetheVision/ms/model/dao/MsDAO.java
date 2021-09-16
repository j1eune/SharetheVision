package com.kh.SharetheVision.ms.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.member.model.vo.Member;
import com.kh.SharetheVision.ms.model.vo.ChatVo;
import com.kh.SharetheVision.ms.model.vo.Messenger;
import com.kh.SharetheVision.ms.model.vo.Room;

@Repository("msdao")
public class MsDAO {

	public ArrayList<Member> toList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("msMapper.toList");
	}

	public List<Room> selectRoomList(SqlSessionTemplate sqlSession,String userName, int deptNo) {
		String deptno = Integer.toString(deptNo);
		HashMap<String,String> hashData = new HashMap<String,String>();
		List<Room> roomList = new ArrayList<Room>();
		hashData.put("userName", userName);
		hashData.put("deptno", deptno);
		roomList = sqlSession.selectList("msMapper.RoomList",hashData);
		return roomList;
	}
	
	public List<Messenger> selectMList(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectList("msMapper.selectList",roomId);
	}
	
	public Room existRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.selectOne("msMapper.existRoom",r);
	}
	
	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("msMapper.insertRoom",r);
	}

	public void insertMessage(SqlSessionTemplate sqlSession, ChatVo chatVo) {
		sqlSession.insert("msMapper.insertMs",chatVo);
	}

	public int readCount(SqlSessionTemplate sqlSession, ChatVo chatVo) {
		return sqlSession.selectOne("msMapper.readCount",chatVo);
	}

	public void updateCount(SqlSessionTemplate sqlSession, int roomId) {
		sqlSession.update("msMapper.updateCount",roomId);
	}

	public int hasNotRead(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("msMapper.hasNotRead",userName);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("msMapper.deleteRoom",rno);
	}

	
}
