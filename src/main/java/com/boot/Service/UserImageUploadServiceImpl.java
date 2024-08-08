package com.boot.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.UserImageUploadDAO;
import com.boot.DTO.UserImageUploadDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UserImageUploadService")
public class UserImageUploadServiceImpl implements UserImageUploadService{
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List<UserImageUploadDTO> getUserImageList(String user_email) {//사용자가 올린 모든 사진 목록
		log.info("@# 사용자 사진 업로드 Impl getUserImageList");
		UserImageUploadDAO dao = sqlSession.getMapper(UserImageUploadDAO.class);
		
		return dao.getUserImageList(user_email);
	}

	@Override
	public void insertUserImage(UserImageUploadDTO vo) {
		log.info("@# 사용자 사진 업로드 Impl  insertUserImage");
		
		UserImageUploadDAO dao = sqlSession.getMapper(UserImageUploadDAO.class);
		
		dao.insertUserImage(vo);
	}

	
	
	
	@Override
	public void deleteUserImage(int fileNo) {//특정 이미지 하나만 삭제
		log.info("@# 사용자 사진 업로드 Impl  deleteUserImage");
		
		UserImageUploadDAO dao = sqlSession.getMapper(UserImageUploadDAO.class);
		
		dao.deleteUserImage(fileNo);
		
	}

}
















