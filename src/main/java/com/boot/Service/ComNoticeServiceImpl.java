package com.boot.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.RecentNoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SubmitDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ComNoticeService")
public class ComNoticeServiceImpl implements ComNoticeService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<ComNoticeDTO> JobPostCard() {//채용정보 목록 불러오기
		log.info("@# JobPostServiceImpl JobPostCard");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ArrayList<ComNoticeDTO> dto = dao.JobPostCard();
		
//		 log.info("@# JobPostCard =>"+dto);
		
		return dto;
	}
	
	public void hitUP(int notice_num){//채용공고 선택시 조회수 증가
		log.info("hitUP!!!");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.hitUP(notice_num);
	}
	
	
	public ComNoticeDTO JobPost(int notice_num) {//채용공고 상세
		log.info("@# JobPostServiceImpl JobPost!!!");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ComNoticeDTO dto = dao.JobPost(notice_num);
		
		return dto;
	}

	public ArrayList<ComNoticeDTO> otherJobPost(int notice_num){//상세 채용공고, 해당 기업의 다른 공고 정보 가져오기
	
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ArrayList<ComNoticeDTO> list = dao.otherJobPost(notice_num);
		
		return list;
	}

	
	public ComNoticeDTO getNoticeInfo(int notice_num) {//지원하기 클릭, 지원 팝업에 공고 정보 가져오기
	
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ComNoticeDTO dto = dao.getNoticeInfo(notice_num);
		
		return dto;
	}
	
	public ArrayList<ResumeDTO> getProfileList(String user_email){//지원하기 클릭, 지원 팝업에이력서 정보 가져오기

		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		ArrayList<ResumeDTO> dto = dao.getProfileList(user_email);
		
		return dto;
	}
		
	
	@Override
		public boolean updateSubmitData(HashMap<String, String> param){//이력서지원정보 저장
		log.info("@# 이력서 배열 들고와서 비교 후 저장 처리 서비스!!!");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
//		dao.updateSubmitData(submitDTO);
		int notice_num= Integer.parseInt(param.get("notice_num"));
		ArrayList <SubmitDTO> list =  dao.getResumeNum(notice_num);
		String user_email = param.get("user_email");
		log.info("값을 잘 들고왔나요??"+user_email);
		boolean result = false;
		boolean offer = false;
		
		if ( list.size()>0) {//해당 공고의 이력서 지원정보가 있으면 비교 로직 수행
			for (int i = 0; i < list.size(); i++) {
				if (user_email.equals(list.get(i).getUser_email())) {
					
					result = true;
//					break;
					return result;
				}
			}
			if (result == false) {
//				log.info("경로 확인용 false = "+user_email);
				dao.updateSubmitData(param);
				offer = dao.findOfferUser(param);
				log.info("포지션 제안을 받았나요? "+offer);
				if(offer) {
					
				}
			}
		}else {
			log.info("경로 확인용 size=0 -> "+user_email);
			dao.updateSubmitData(param);
			log.info("포지션 제안을 받았나요? "+offer);
		}
		
		return result;
	}
	
	@Override
	public int getOfferNum(int notice_num, String user_email) {//지원하기 누르면 offer한 적 있는지 확인
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		int offer_exist = dao.getOfferNum(notice_num, user_email);//제안한 공고면 1, 아니면 0
		
		return offer_exist;
	}
	
	@Override
	public void updateOfferStatus(int notice_num, String user_email) {
		log.info("@# ComNoticeServiceImpl updateOfferStatus");
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.updateOfferStatus(notice_num,user_email);//offer_agree=지원완료, resume_submitDate=현재날짜 offer테이블에 저장하기 0804 연주
		
	}

	
	
	
//	지수

	
	@Override
	public void registerNotice(ComNoticeDTO comNoticeDTO) {
		log.info("@# ComNoticeServiceImpl list registerNotice");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.registerNotice(comNoticeDTO);

		log.info("@# comNoticeDTO=>"+comNoticeDTO);
		
//		첨부파일 있는지 체크
		log.info("@# comNoticeDTO.getComNoticeAttachList()=>"+comNoticeDTO.getComNoticeAttachList());
		if (comNoticeDTO.getComNoticeAttachList() == null || comNoticeDTO.getComNoticeAttachList().size() == 0) {
			log.info("@# null");
			return;
		}
		
//		첨부파일이 있는 경우 처리
		comNoticeDTO.getComNoticeAttachList().forEach(attach -> {
			attach.setNotice_num(comNoticeDTO.getNotice_num());
			dao.registInsertFile(attach);
		});
		
	}
	
	@Override
	public void noticeInsertStack(ComNoticeDTO comNoticeDTO) {
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		
		String[] stackArray = comNoticeDTO.getStack().split(",");                               
	    for (String stack : stackArray) {
	        comNoticeDTO.setStackValue(stack); // 각각의 스택 값을 설정하는 메서드 추가
	        dao.noticeInsertStack(comNoticeDTO);
	    }
	}
	
	@Override
	public void noticeStauts(ComNoticeDTO comNoticeDTO) {
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.noticeStauts(comNoticeDTO);
	}

	@Override
	 public List<String> getNoticeStack(ComNoticeDTO comNoticeDTO) {
        ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
        return dao.getNoticeStack(comNoticeDTO);
    }
	
	@Override
	public void updateRegisterNotice(ComNoticeDTO comNoticeDTO) {
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.updateRegisterNotice(comNoticeDTO);
	}

	
	//파일 업로드
	@Override
	public List<ComNoticeAttachDTO> registGetFileList(int notice_num) {
		log.info("@# ComNoticeServiceImpl registGetFileList");
		
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		
		return dao.registGetFileList(notice_num);
	}

	@Override
	public void registDeleteFile(List<ComNoticeAttachDTO> fileList) {
		log.info("@# ComNoticeServiceImpl deleteFiles");
		log.info("@# ComNoticeServiceImpl fileList 값 =>"+fileList);
		
		if (fileList == null || fileList.size() == 0) {
			return;
		}
		
		fileList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\"
											 +attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\s_"
							+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error"+e.getMessage());
			}
		});//end of forEach
	}

	@Override
	public void updateRecentNotice(RecentNoticeDTO dto) {//최근본 공고번호와 유저이메일 저장하기
		log.info("@# ComNoticeServiceImpl updateRecentNotice");
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		int exists =dao.checkRecentNotice(dto);//이미 최근본공고테이블에 저장된 정보인지 확인(행갯수 반환)
		if(exists == 0) {//저장된 정보가 아니면(처음 열람하는 공고면)
			dao.updateRecentNotice(dto);//최근본공고테이블에 저장
		}
	}

	@Override
	public void noticeDeleteStack(int notice_num) {
		ComNoticeDAO dao = sqlSession.getMapper(ComNoticeDAO.class);
		dao.noticeDeleteStack(notice_num);
	}


	
	


}
