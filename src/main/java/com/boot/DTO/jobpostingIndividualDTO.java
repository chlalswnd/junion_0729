package com.boot.DTO;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class jobpostingIndividualDTO {
	
	private String user_name; // 
	private String user_gender; // 
	private String career_month; // 
	private String stack_names; // 
	private String job_names; // 
	private List<String> stackList; // 
	private List<String> jobList; // 
	private int resume_num; // 
	private int korean_age; // 
	private int resume_age; // 
	private int career_years; // 
	private Timestamp resume_writeDate; // 
	
// ===================================== jobpostingOffer 끝 ================================


}
