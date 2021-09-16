package com.kh.SharetheVision.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.project.model.dao.ProjectDAO;
import com.kh.SharetheVision.project.model.vo.Project;

@Service("proService")
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ProjectDAO pDao;
	
	@Override
	public int insertProject(Project project) {
		
		int result = pDao.insertProject(sqlSession, project);
		
		if(result > 0) {
			String[] mArr = project.getmCodeArr();
			int pmResult = 0;
			for(int i = 0; i < mArr.length; i++) {
				String mCode = mArr[i];
				pmResult += pDao.insertProjectMember(sqlSession, mCode);
			}
			
			if(pmResult > 0) {
				return pmResult;
			} else {
				return result;
			}
		} else {
			return 0;
		}
		
		
	}

	@Override
	public ArrayList<Project> selectProject(String mCode) {
		return pDao.selectProject(sqlSession, mCode);
	}

	@Override
	public ArrayList<Project> selectProjectMember(ArrayList<Project> pList) {
		return pDao.selectProjectMember(sqlSession, pList);
	}

	@Override
	public int changeProject(HashMap<String, Object> map) {
		return pDao.changeProject(sqlSession, map);
	}


}
