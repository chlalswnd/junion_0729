package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DailyCSDTO {
	//cs_tb
	private String cs_type; // cs종류
	private int cs_num; // 문제번호
	private int cs_answer_num; // 정답번호

	//cs_question_tb
	private String cs_question_title; // 문제
	private String cs_question_option; // 문제 선택
	private String cs_question_explanation; // 해설

	//cs_usesr
	private String user_email; // 유저이메일
	private String cs_user_check; // 문제풀이 여부
}
