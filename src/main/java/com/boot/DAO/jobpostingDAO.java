package com.boot.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.jobpostingDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface jobpostingDAO {
	
	public ArrayList<jobpostingDTO> jobpostingList(String login_email); // 전체공고
	/*
	 * public ArrayList<jobpostingDTO> jobpostingOnList(String login_email); //
	 * 진행중공고 public ArrayList<jobpostingDTO> jobpostingOffList(String login_email);
	 * // 마감된공고
	 */	
	public void jobpostingDelete(String notice_num);
	// DTO로 받는건 여러 컬럼 받아올때 사용
	public jobpostingDTO jobpostingTotalCount(String login_email); // 토탈카운트 (전체, 진행, 마감 3개 들어있음)
	
	
	public ArrayList<jobpostingDTO> jobpostingSupport(String notice_num); // 공고목록 > 지원자 목록
	
//	public ArrayList<jobpostingDTO> jobpostingSupportCount(String notice_num); // 지원자 카운트
	
	public void jobpostingOffer(jobpostingDTO jobpostingDTO); // 포지션제안 Insert 문
	
    // resume_num에 대한 stack_name 리스트 조회
    List<jobpostingDTO> jobpostingResumeStack(int resume_num);
    
    // 필터링된 지원자 목록을 가져오는 메서드
    ArrayList<jobpostingDTO> jobpostingSupportFiltered(Map<String, Object> params);
    
    // submit_status 업데이트 메서드 추가
    void updateSubmitStatus(@Param("resume_num") int resume_num, @Param("notice_num") int notice_num, @Param("status") String status);


}

