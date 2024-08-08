package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.DAO.announcementsTermsDAO;
import com.boot.DAO.boardAttachDAO;
import com.boot.DAO.boardBoardDAO;
import com.boot.DAO.comBoardAttachDAO;
import com.boot.DAO.comBoardBoardDAO;
import com.boot.DAO.noticeBoardAttachDAO;
import com.boot.DAO.noticeBoardBoardDAO;
import com.boot.DTO.announcementsTermsDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.DTO.noticeBoardBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("announcementsTermsService")
public class announcementsTermsServiceImpl implements announcementsTermsService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<announcementsTermsDTO> boardList() {  // service에 있는 list 가져와서 오버라이드함
		log.info("@# 보드서비스임플 list");
		
		announcementsTermsDAO dao = sqlSession.getMapper(announcementsTermsDAO.class);  // session으로 불러온 BoardDao.class값을 dao에 집어넣음 
		ArrayList<announcementsTermsDTO> list=dao.boardList();  // dao값을 배열boardDTO 'list' 에 집어넣음 
		
		return list;
	}

	@Override
//	public void write(HashMap<String, String> param) {
//	파일업로드는 파라미터를 DTO 사용
	public void boardWrite(announcementsTermsDTO boardDTO) {
		
		log.info("@# 보드서비스임플 write");
		announcementsTermsDAO dao = sqlSession.getMapper(announcementsTermsDAO.class); 
//		dao.write(param);
		dao.boardWrite(boardDTO);
		log.info("@# 보드서비스임플 boardDTO=>"+boardDTO);
		
	}

	
	

	@Override
	public announcementsTermsDTO boardDetailView(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 detailView");
		
		announcementsTermsDAO dao = sqlSession.getMapper(announcementsTermsDAO.class);  // 'dao' 에  sqlSession.getMapper( BodarDAO.class)를 담는다.
		announcementsTermsDTO dto = dao.boardDetailView(param);  // dao.contentView(param)값을 dto에 담는다.
		
		return dto;
	}
	
	
	@Override
	public announcementsTermsDTO boardModifyView(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 boardModifyView");
		
		announcementsTermsDAO dao = sqlSession.getMapper(announcementsTermsDAO.class);  // 'dao' 에  sqlSession.getMapper( BodarDAO.class)를 담는다.
		announcementsTermsDTO dto = dao.boardModifyView(param);  // dao.contentView(param)값을 dto에 담는다.
		
		return dto;
	}
	
	

	@Override
	public void boardModify(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 modify");
		log.info("@# BoardServiceImpl modify");
		
		announcementsTermsDAO dao = sqlSession.getMapper(announcementsTermsDAO.class);
		dao.boardModify(param);
	}

	
	
	@Override
	public void boardDelete(HashMap<String, String> param) {
		log.info("@# 보드서비스임플 delete");
		log.info("@# param=>"+param);
		
		announcementsTermsDAO dao = sqlSession.getMapper(announcementsTermsDAO.class);
		
		dao.boardDelete(param);
	}



}







