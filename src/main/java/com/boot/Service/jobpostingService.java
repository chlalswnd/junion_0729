package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import com.boot.DTO.jobpostingDTO;


public interface jobpostingService {
	
	public ArrayList<jobpostingDTO> jobpostingList(String login_email); // 전체공고
	/*
	 * public ArrayList<jobpostingDTO> jobpostingOnList(String login_email); //
	 * 진행중공고 public ArrayList<jobpostingDTO> jobpostingOffList(String login_email);
	 * // 마감된공고
	 */	
	public void jobpostingDelete(String notice_num);
	public jobpostingDTO jobpostingTotalCount(String login_email); // 토탈카운트 (전체, 진행, 마감 3개 들어있음)
	
	public ArrayList<jobpostingDTO> jobpostingSupport(String notice_num); // 공고목록 > 지원자 목록

//	public ArrayList<jobpostingDTO> jobpostingSupportCount(String notice_num); // 지원자 카운트
	
	public void jobpostingOffer(jobpostingDTO jobpostingDTO); // 포지션제안 Insert 문
	
    // resume_num에 대한 stack_name 리스트 반환
    List<jobpostingDTO> jobpostingResumeStack(int resume_num);
    
 // 필터링된 지원자 목록을 가져오는 메서드
    ArrayList<jobpostingDTO> jobpostingSupportFiltered(String notice_num, String submitStatus, String submitCheck);
    
    // submit_status 업데이트 메서드 추가
    void updateSubmitStatus(int resume_num, int notice_num, String status);
    
    
    
}
