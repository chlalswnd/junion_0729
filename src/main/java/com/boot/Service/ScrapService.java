package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

public interface ScrapService {

// 하진
//	관심 기업 설정을 위한 메소드
	public String existingCompany(String user_email, int notice_num);//기존 관심기업 스크랩 정보를 가져옴
//	public String comScrap(HashMap<String, String> param);//관심기업 스크랩
	public boolean uploadcomScrap(HashMap<String, String> param);//관심기업 스크랩

//관심 기업 목록
	public ArrayList<String> getScrapList(String user_email);//관심기업 목록에서 기업 리스트를 가져옴	
	public boolean comListScrap(HashMap<String, String> param);//관심기업 스크랩 -> 기업정보에서 스크랩 할 때
	public String getCheck(String com_email, String user_email);// 기업목록 상세 : 관심기업 정보를 가져옴
	
// 공고 스크랩을 위한 메소드
	public ArrayList<Integer> getScrapNoticeNum(String user_email);//관심 공고 목록을 가져옴
	public boolean checkScrapNotice(HashMap<String, String> param);//관심 공고 스크랩
	
	

	
}
