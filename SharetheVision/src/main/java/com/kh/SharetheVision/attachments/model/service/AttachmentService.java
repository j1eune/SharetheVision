package com.kh.SharetheVision.attachments.model.service;

import java.util.ArrayList;

import com.kh.SharetheVision.attachments.model.vo.Attachment;

public interface AttachmentService {

	int updateProfile(Attachment attachment);

	Attachment selectProfile(String mCode);

	ArrayList<Attachment> selectProjectMember(String[] memberCode);

	int insertProfile(Attachment attachment);


}
