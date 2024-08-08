package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.ScrapDTO;

public interface ScrapDAO {
	
//	하진
//	관심 기업 설정을 위한 메소드
	public String existingCompany(@Param("user_email") String user_email,@Param("notice_num") int notice_num);//기존 관심기업 스크랩 정보를 가져옴
	public String existingCompany(HashMap<String, String> param);//기존 관심기업 스크랩 정보를 가져옴
	public void uploadcomScrap(HashMap<String, String> param);//관심기업 스크랩
	public void deleteComScrap(HashMap<String, String> param);//스크랩했던 관심기업 정보 삭제

	
	//관심 기업 목록
	public ArrayList<String> getScrapList(String user_email);//관심기업 목록에서 기업 리스트를 가져옴
	public String getCheck(HashMap<String, String> param);//해당 기업이 스크랩 정보에 있는지 확인
	public String getCheck(@Param("com_email") String com_email, @Param("user_email") String user_email);//해당 기업이 스크랩 정보에 있는지 확인
	
// 공고 스크랩을 위한 메소드
	public ArrayList<Integer> getScrapNoticeNum(String user_email);//관심 공고 목록을 가져옴
	public ScrapDTO checkNoticeNum(HashMap<String, String> param);//해당 공고가 DB에 등록되어 있는지 확인
	public void addScrapNotice(HashMap<String, String> param);//관심 공고 스크랩
	public void deleteScrapNotice(HashMap<String, String> param);//관심 공고 삭제
	
// 상세공고 페이지 : 해당 기업의 공고 스크랩 정보 처리
//	public ArrayList<Integer> getComNoticeScrap(@Param("user_email") String user_email, @Param("notice_num") int notice_num);
	
}
