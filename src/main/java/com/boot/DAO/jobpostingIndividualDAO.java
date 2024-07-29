package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.Criteria3;
import com.boot.DTO.jobpostingIndividualDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface jobpostingIndividualDAO {

//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(String orderType, Criteria3 cri); // 인재풀 리스트
//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(Criteria3 cri); // 인재풀 리스트
//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(@Param("orderType") String orderType, Criteria3 cri); // 인재풀 리스트
	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(@Param("orderType") String orderType, @Param("cri") Criteria3 cri); // 인재풀 리스트
	
	public ArrayList<String> getStackList(); // 스택 리스트

	public ArrayList<String> getLocationList(); // 지역 리스트
	
	public int getTotalCount(); //
}

