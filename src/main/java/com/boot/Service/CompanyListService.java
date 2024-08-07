package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.CompanyAttachDTO;
import com.boot.DTO.CompanyListDTO;
import com.boot.DTO.Criteria4;

public interface CompanyListService {
//	07/29 최민중 기업리스트
//	public ArrayList<CompanyInfoDTO> comList(@Param("orderType") String orderType, @Param("std") Criteria4 cri);//기업목록
	public ArrayList<CompanyListDTO> comList(@Param("orderType") String orderType, @Param("cri") Criteria4 cri);//기업목록

//	0725 10:40 민중
//	public ArrayList<String> getJobList(); // 직군/직무 리스트
	
	public ArrayList<String> getStackList(); // 기술 리스트

	public ArrayList<String> getLocationList(); // 지역 리스트
	
	public int getTotalCount(@Param("cri") Criteria4 cri);
	
	public List<CompanyAttachDTO> comFileList(String com_email); // 기업 사진 들고오기
}
