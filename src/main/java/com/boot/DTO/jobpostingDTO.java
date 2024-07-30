package com.boot.DTO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class jobpostingDTO {
	
	private int notice_num; // 
	private int notice_hit; // 
	private int notice_scrap; // 
	private String com_email; // 
	private String notice_title; // 
	private String notice_job; // 
	
	private int notice_recruitNum; // 
	private String notice_career; // 
	private String notice_jobInfo; // 
	private String notice_department; // 
	private String notice_position; // 
	private String notice_area1; // 
	private String notice_area2; // 
	private String notice_contactType; // 
	
	private String notice_startDate; // 
	private String notice_endDate; // 
	private String notice_pay1; // 
	private String notice_pay2; // 
	private String com_name; // 
	private String com_tel; // 
	
	private String notice_stack; // 
	private String notice_condition; // 
	private String notice_prefer; // 
	private String notice_benefit; // 
	private String user_email; // 
	private Date joincompany_date; // 
//	private String notice_status; // 
	
	
	private String notice_final; // 진행중, 마감 여부 String 로 표시
	private int totalCount; // 전체 공고수
	private int onCount; // 진행중 공고수
	private int offCount; // 마감된 공고수
	
	
// ===================================== jobpostingList 끝 ================================
	
	private String user_name; // 지원자 이름
	private String resume_gender; // 지원자 성별
	private Timestamp resume_age; // 지원자 나이 (날짜로 돼있어서 계산해야됨)
	private String resume_stack; // 지원자 스택
	private String career_month; // 지원자 경력
	private String resume_writeDate; // 지원자 이력서작성날짜
	private int resume_num; // 
	private int t_count; // 지원자 카운트
	private int korean_age; // 지원자 카운트

	
	
// ===================================== jobpostingSupport 끝 ================================
	
	
	private String offer_title;
	private String offer_name;
	private String offer_content;
	
	private String offer_job;
	private String offer_career;
	private String offer_pay;
	
	private String offer_agree;
	private String resume_agree;
	private String resume_submitDate;
	private String resume_comName;
//	private String user_email;
//	private String com_email;
//	private String notice_num;
	
	
	
	private String resume_title;
	private String user_address;
	private int resume_pay;
	private Date career_start;
	private Date career_end;
	private String resume_status;
	private String resume_comPart;
	private String resume_comPosition;
	private int careerNum;
	private Date resume_eduStart;
	private Date resume_eduEnd;
	private String resume_eduStatus;
	private String resume_eduName;
	private String resume_eduMajor;
	private String resume_eduDegree;
	private int eduNum;
	private Date resume_exStart;
	private Date resume_exEnd;
	private String resume_exName;
	private String resume_exContent;
	private int exNum;
	private Date resume_licenseDate;
	private String resume_licenseContent;
	private int licenseNum;
	private String resume_portfolio_name;
	private String resume_portfolio_url;
	private int portfolioNum;
	private String resume_intro;
	private String resume_offer;
	private int calculated_age;
	private int user_questionNum;
	private String user_questionAnswer;
	private String user_tel;
	private int user_type;
	private String user_location;
	private String user_location2;
	private Date user_birthdate;
	private String user_gender;


   private String stack_name;	
	private ArrayList<String> stack_names; // stack_name 리스트를 ArrayList로 정의
	
	
    private String submit_status; // 합격, 불합격, 보류
    private String submit_check;  // 미열람, 열람
    // 필터링에 사용할 추가 필드
    private String filterSubmitStatus; // 필터링에 사용
    private String filterSubmitCheck;  // 필터링에 사용
    private String status; // status 필드 추가
    private String submitStatus; // status 필드 추가
    
    
    
	
// ===================================== jobpostingOffer 끝 ================================


}
