package com.kh.SharetheVision.attachments.model.service;

import com.kh.SharetheVision.attachments.model.vo.Attachment;

public interface AttachmentService {

	int updateProfile(Attachment attachment);

	Attachment selectProfile(String mCode);

}
