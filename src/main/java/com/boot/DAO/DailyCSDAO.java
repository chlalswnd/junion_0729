package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.Criteria2;
import com.boot.DTO.DailyCSDTO;
import com.boot.DTO.JaewonCriteria;
import com.boot.DTO.NoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.StarDTO;
import com.boot.DTO.dailyCSCriteria;

// DB SQL 처리

@Mapper
public interface DailyCSDAO {
	// 문제 리스트 불러오기
//	public ArrayList<DailyCSDTO> questionList();
	public ArrayList<DailyCSDTO> questionList(dailyCSCriteria cri3);
	
	// 문제 팝업 데이터 불러오기
	public DailyCSDTO question(Integer cs_num);

	// 문제참여여부 UPDATE
	public void modifyCheck(@Param("cs_num") Integer cs_num, @Param("user_email") String user_email);
	
	// 문제 탭버튼으로 불러오기
//	public ArrayList<DailyCSDTO> searchTab(@Param("cs_type")String cs_type);
//	public ArrayList<DailyCSDTO> searchTab(@Param("cs_type")String cs_type, JaewonCriteria cri3);
//	public ArrayList<DailyCSDTO> searchTab(@Param("cs_type")String cs_type, JaewonCriteria cri3);
	public ArrayList<DailyCSDTO> searchTab(dailyCSCriteria cri3);
	
	// 페이지 총 갯수 
	public int dailyCSGetTotalCount();
		
}// public class BoardDAO 끝 


	
