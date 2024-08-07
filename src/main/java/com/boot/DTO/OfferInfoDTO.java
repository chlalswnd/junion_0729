package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OfferInfoDTO {
	private int notice_num;
	private int resume_num;
	private String user_email;
	private String com_email;
	private String offer_content;
	private String notice_title;
	private String notice_job;
	private String notice_career;
	private String notice_area1;
	private String notice_pay1;
	private int notice_pay2;
	private String com_name;
	
	//0801연주 추가
	private String notice_endDate; 
	private int offer_no;
	private String offer_date;
	private String offer_agree;
	private String resume_agree;
	private String resume_submitDate;
	private String com_tel;
	private String com_location;
	private String com_person;
	
}
