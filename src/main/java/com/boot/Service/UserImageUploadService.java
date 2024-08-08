package com.boot.Service;

import java.util.List;

import com.boot.DTO.ResumeUploadDTO;
import com.boot.DTO.UserImageUploadDTO;

public interface UserImageUploadService {
	public void insertUserImage(UserImageUploadDTO vo);  // 파라미터가 boardattachDTO / 파일추가
	public List<UserImageUploadDTO> getUserImageList(String user_email); //파일열람, 사람이 여러개의 이미지를 올렸다고 가정하고
	public void deleteUserImage(int fileNo);  //파일삭제, 한 사람이 여러개의 이미지를 올렸다고 가정하고
}
