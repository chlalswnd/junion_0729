package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OfferInfoDTO {
	private int notice_num;
	private String notice_title;
	private String notice_job;
	private String notice_career;
	private String notice_area1;
	private String notice_pay1;
	private int notice_pay2;
	private String com_name;
}
