package com.boot.DTO;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
//@NoArgsConstructor
public class Criteria3 {  // 페이지당 글 갯수 설정 / 페 
	private int pageNum;//페이지 번호
	private int amount;//페이지당 글 갯수
	private String login_email;
	private char login_usertype;
	
	private String jobType;  // 기술스택 타입
	private String stackType;  // 기술스택 타입
	private String locationType;  // 지역 타입
	private String careerType;  // 경력 타입
	
	private ArrayList<String> jobNames;  //
	private ArrayList<String> stackNames;  //
	
	public Criteria3() {  // 페이징에 표기될 크기설정 / ex) 1페이지~10페이지
		this(1, 10);
	}
	public Criteria3(int pageNum, int amount) {  // 페이지 번호와 표기될 개수를 합쳐놓은 객체
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
