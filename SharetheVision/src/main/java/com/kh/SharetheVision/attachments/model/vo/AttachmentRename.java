package com.kh.SharetheVision.attachments.model.vo;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;


public class AttachmentRename {
	
	public static Attachment updateProfile(MultipartFile file, HttpServletRequest request, String mCode) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\muploadFile";
		
		File f = new File(savePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) +
									originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = f + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일 추가 실패");
		}
		
		Attachment attachment = new Attachment();
		
		attachment.setAtLevel(1);
		attachment.setAtCategory(mCode);
		attachment.setAtPath(renamePath);
		attachment.setAtOrigin(originFileName);
		attachment.setAtChange(renameFileName);
		
		return attachment;
		
	}
	
}
