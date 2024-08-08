package com.boot.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class announcementsTermsDTO {
	private int board_no; // 보드넘버
	private String login_email; // 작성자
	private String board_title; // 제목
	private String board_content; // 내용
	private String create_date; // 날짜
	private String term_type; // 개인, 기업 필터 구분용
	

}






