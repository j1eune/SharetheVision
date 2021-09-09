package com.kh.SharetheVision.notice.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.SharetheVision.notice.model.service.NoticeService;
import com.kh.SharetheVision.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	public NoticeController() {}
	
	@RequestMapping(value="notice.no", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String notice(@RequestParam("mCode") String mCode) {
		ArrayList<Notice> no = service.selectNotice(mCode);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			
		return gson.toJson(no);
		
	}
}
