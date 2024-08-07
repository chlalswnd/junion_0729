package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.RecentNoticeDTO;
import com.boot.DTO.ResumeDTO;

public interface ComNoticeService {
	public ArrayList<ComNoticeDTO> JobPostCard();//채용공고목록 가져오기
	public void hitUP(int notice_num);//채용공고 선택시 조회수 증가
	public ComNoticeDTO JobPost(int notice_num);//채용공고 상세 정보
	public ArrayList<ComNoticeDTO> otherJobPost(int notice_num);//상세 채용공고, 해당 기업의 다른 공고 정보 가져오기
//	24.07.28 하진 : ComNoticeDTO 필드 추가로 해당 메소드 필요 없어짐.
//	public String comLocation(String com_email);//상세 채용공고-회사 위치 가져오기
	
	
	//지원하기 팝업 발생
	public ComNoticeDTO getNoticeInfo(int notice_num);//지원하기 클릭, 공고 정보 가져오기
	public ArrayList<ResumeDTO> getProfileList(String user_email);//지원하기 클릭, 이력서 정보 가져오기
	public int getOfferNum(int notice_num, String user_email );//지원하기 클릭, 제안한 내용이 있는지 확인 0804연주
	public void updateOfferStatus(@Param("notice_num") int notice_num, @Param("user_email") String user_email);//offer_agree=지원완료, resume_submitDate=현재날짜 offer테이블에 저장하기 0804 연주
	
	//공고 지원 처리
	public boolean updateSubmitData(HashMap<String, String> param);//이력서지원정보 저장
	
	public void registerNotice(ComNoticeDTO comNoticeDTO); //공고등록
	public void noticeInsertStack(ComNoticeDTO comNoticeDTO); //공고등록-스택테이블에 insert
	public void noticeStauts(ComNoticeDTO comNoticeDTO); //공고 상태 업데이트
	
	public List<String> getNoticeStack(ComNoticeDTO comNoticeDTO); //공고수정-스택 테이블 select
	public void updateRegisterNotice(ComNoticeDTO comNoticeDTO); //공고 수정
	public void noticeDeleteStack(int notice_num); //공고수정- 스택 삭제
	
	public List<ComNoticeAttachDTO> registGetFileList(int notice_num); // int타입 notice_num파라미터를 list타입 <ComRegisterUploadDTO> getFileList로 사용하려함 / 파일열람
	public void registDeleteFile(List<ComNoticeAttachDTO> fileList);  // notice_num 맞춰서 파일삭제로직 / 파일삭제
	
	public void updateRecentNotice(RecentNoticeDTO dto); //공고파일 열람하면 최근본공고테이블에 정보저장(연주0730)
}
