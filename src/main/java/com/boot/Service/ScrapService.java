package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

public interface ScrapService {

// 하진
//	관심 기업 설정을 위한 메소드
	public String existingCompany(String user_email, int notice_num);//기존 관심기업 스크랩 정보를 가져옴
//	public String comScrap(HashMap<String, String> param);//관심기업 스크랩
	public boolean uploadcomScrap(HashMap<String, String> param);//관심기업 스크랩


// 공고 스크랩을 위한 메소드
	public ArrayList<Integer> getScrapNoticeNum(String user_email);//관심 공고 목록을 가져옴
	public boolean checkScrapNotice(HashMap<String, String> param);//관심 공고 스크랩
	
//	public ComNoticeDTO getScrapNotice(int noticeNum);// 스크랩 채용공고 하나씩 가져오기
//	public ArrayList<ComNoticeDTO> getScrapNoticList(String recent_noticeNumArray);// 스크랩 채용공고 목록 가져오기
	
	
	
//	public ComNoticeDTO JobPost(int notice_num);//상세 채용공고 정보 가져오기
//	public String comLocation(String com_email);//상세 채용공고-회사 위치 가져오기
//	
//	
//
//    
//	public void registerNotice(ComNoticeDTO comNoticeDTO);
//	
////	파일업로드는 파라미터를 DTO 사용
//	public void registInsertFile(ComNoticeAttachDTO vo);  // 파라미터가 ComNoticeAttachDTO / 파일추가
//	public List<ComNoticeAttachDTO> registGetFileList(int notice_num); // int타입 notice_num파라미터를 list타입 <ComNoticeAttachDTO> getFileList로 사용하려함 / 파일열람
//	public void registDeleteFile(String notice_num);  // notice_num 맞춰서 파일삭제로직 / 파일삭제
//	
//    public List<Integer> getNoticeNums(@Param("com_email") String com_email); //notice_num 배열 가져오기
//    public void updateNoticeNums(@Param("com_email") String com_email, @Param("noticeNums") String noticeNums); //notice_num 배열 업데이트

	
}
