package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class dailyCSCriteria {
	private int pageNum; // 페이지번호
	private int amount; // 페이지당 글 갯수	
	private String user_email;
	private String noticeCheck;
	private String notice_status;
	private String cs_type;
//	private String cs_type;
	
	public dailyCSCriteria() 
	{
		this(1, 12);
	}
	
	public dailyCSCriteria(int pageNum, int amount) 
	{
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
