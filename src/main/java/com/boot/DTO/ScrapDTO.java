package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScrapDTO {	private String user_email;//유저 이메일
private String com_email;//기업 이메일

private int notice_num;}
