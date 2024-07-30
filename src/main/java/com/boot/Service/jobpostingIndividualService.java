package com.boot.Service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.Criteria3;
import com.boot.DTO.OfferInfoDTO;
import com.boot.DTO.jobpostingIndividualDTO;


public interface jobpostingIndividualService {
	
	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(String orderType, Criteria3 cri); // 인재풀 리스트
//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(Criteria3 cri); // 인재풀 리스트
	
	public ArrayList<String> getJobList(); // 직업/직무 리스트

	public ArrayList<String> getStackList(); // 스택 리스트
	
	public ArrayList<String> getLocationList(); // 지역 리스트
	
	public int getTotalCount(); //
	
	public ArrayList<OfferInfoDTO> getOfferInfo(@Param("login_email") String login_email); // 
}
