package com.kh.SharetheVision.project.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.project.model.vo.Project;

public interface ProjectService {

	int insertProject(Project project);

	ArrayList<Project> selectProject(String mCode);

}
