package com.kh.SharetheVision.ms.model.dao;


import java.util.ArrayList;
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

	public List<Room> selectRoomList(SqlSessionTemplate sqlSession,String fid) {
		return sqlSession.selectList("msMapper.RoomList",fid);
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

	public int insertMessage(SqlSessionTemplate sqlSession, ChatVo chatVo) {
		return sqlSession.insert("msMapper.insertMs",chatVo);
	}

	public int readCount(SqlSessionTemplate sqlSession, ChatVo chatVo) {
		return sqlSession.selectOne("msMapper.readCount",chatVo);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int roomId) {
		System.out.println("dao innnnnnn");
		return sqlSession.selectOne("msMapper.updateCount",roomId);
	}

	
}
