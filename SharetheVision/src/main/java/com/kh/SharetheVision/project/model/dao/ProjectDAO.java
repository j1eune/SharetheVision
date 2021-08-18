package com.kh.SharetheVision.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.project.model.vo.Project;

@Repository("proDao")
public class ProjectDAO {

	public int insertProject(SqlSession sqlSession, Project project) {
		return sqlSession.insert("projectMapper.insertProject", project);
	}

	public int insertProjectMember(SqlSession sqlSession, String mCode) {
		return sqlSession.insert("projectMapper.insertProjectMember",mCode);
	}

	public ArrayList<Project> selectProject(SqlSession sqlSession, String mCode) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProject",mCode);
	}

}
