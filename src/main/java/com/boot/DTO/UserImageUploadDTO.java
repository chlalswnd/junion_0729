package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserImageUploadDTO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;
	private String user_email;
	private int fileNo;//한 사람의 유저가 여러개의 파일 올릴 수 있다고 가정하고
	
}