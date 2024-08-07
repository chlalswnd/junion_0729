package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.Criteria3;
import com.boot.DTO.OfferInfoDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.UserDTO;
import com.boot.DTO.jobpostingIndividualDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface jobpostingIndividualDAO {

//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(String orderType, Criteria3 cri); // 인재풀 리스트
//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(Criteria3 cri); // 인재풀 리스트
//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(@Param("orderType") String orderType, Criteria3 cri); // 인재풀 리스트
	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(@Param("orderType") String orderType, @Param("cri") Criteria3 cri); // 인재풀 리스트
	
	public ArrayList<String> getJobList(); // 직군/직무 리스트
	
	public ArrayList<String> getStackList(); // 스택 리스트

	public ArrayList<String> getLocationList(); // 지역 리스트
	
//	public int getTotalCount();
	public int getTotalCount(@Param("cri") Criteria3 cri);
	
	public ArrayList<String> getJobNames(@Param("login_email") String login_email); // 개인회원 추천순에 필요한 정보
	
	public ArrayList<String> getStackNames(@Param("login_email") String login_email); // 기업회원 추천순에 필요한 정보
	
	public ArrayList<OfferInfoDTO> getOfferInfo(@Param("login_email") String login_email); // offer 보내기 위한 개인회원 정보
	
	public void insertOffer(@Param("offer") OfferInfoDTO offer); // offer 정보 insert
	
	public ResumeDTO resumeInfo(int resumeNum);// 이력서 열람(이력서 정보)
	
	public UserDTO userInfo(String user_email);// 이력서 열람(유저 정보)
	
	public int checkOffer(@Param("login_email") String login_email,@Param("resumeNum") int resumeNum);// 오퍼 유무확인
}

