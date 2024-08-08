package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class announcementsBoardDTO {
	private int board_no; // 보드넘버
	private String login_email; // 작성자
	private String board_title; // 제목
	private String board_content; // 내용
	private String create_date; // 날짜
	

}






