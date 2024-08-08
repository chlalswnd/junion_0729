package com.boot.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.UserImageUploadDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface UserImageUploadDAO {  // 파일추가, 열람, 삭제
//	파일업로드는 파라미터를 DTO 사용
	public void insertUserImage(UserImageUploadDTO vo);  // 파일추가
	public List<UserImageUploadDTO> getUserImageList(String user_email); //파일열람, 사람이 여러개의 이미지를 올렸다고 가정하고
	public void deleteUserImage(int fileNo);  //파일삭제, 한 사람이 여러개의 이미지를 올렸다고 가정하고
}
















