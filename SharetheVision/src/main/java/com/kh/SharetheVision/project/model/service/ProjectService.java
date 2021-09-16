package com.kh.SharetheVision.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.SharetheVision.project.model.vo.Project;

public interface ProjectService {

	int insertProject(Project project);

	ArrayList<Project> selectProject(String mCode);

	ArrayList<Project> selectProjectMember(ArrayList<Project> pList);

	int changeProject(HashMap<String, Object> map);

}
