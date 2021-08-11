package com.kh.SharetheVision.firstmain.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.SharetheVision.firstmain.model.dao.CalendarDAO;
import com.kh.SharetheVision.firstmain.model.vo.Calendar;

@Service("cService")
public class CalendarServiceImpl implements CalendarService{
		
		@Autowired(required=false)
		private CalendarDAO cdao;
		
		public ArrayList<Calendar> cList(){
			return cdao.cList();
		}
		
		
		
}
