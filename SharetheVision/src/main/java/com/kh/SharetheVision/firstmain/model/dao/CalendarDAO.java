package com.kh.SharetheVision.firstmain.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.SharetheVision.firstmain.model.vo.Calendar;

@Repository
public interface CalendarDAO {
	public ArrayList<Calendar> cList();
	
}
