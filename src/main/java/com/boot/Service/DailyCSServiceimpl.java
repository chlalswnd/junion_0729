package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.DailyCSDAO;
import com.boot.DAO.boardAttachDAO;
import com.boot.DAO.boardBoardDAO;
import com.boot.DAO.joinManagementPageDAO;
import com.boot.DTO.DailyCSDTO;
import com.boot.DTO.JaewonCriteria;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.dailyCSCriteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("DailyCSService")
public class DailyCSServiceimpl implements DailyCSService{
	@Autowired
	private SqlSession sqlSession;
	
	// 문제 팝업
	@Override
//	public ArrayList<DailyCSDTO> question(Integer cs_num) {
	public DailyCSDTO question(Integer cs_num) {
		
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
		DailyCSDTO question =dao.question(cs_num);		
		
		return question;
	}

	// 문제참여 UPDATE
	@Override
	public void modifyCheck(Integer cs_num, String user_email) {
		log.info("@@@###modifyCheck Serviceimpl====>"+cs_num);
		log.info("@@@###modifyCheck Serviceimpl====>"+user_email);
		
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
		log.info("@@@###modifyCheck Serviceimpl====>"+dao);
		
		dao.modifyCheck(cs_num, user_email);			
	}

	@Override
	public ArrayList<DailyCSDTO> questionList(dailyCSCriteria cri3) {
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
		ArrayList<DailyCSDTO> questionList = dao.questionList(cri3);
//		
		return questionList;
//		return null;
	}

	@Override
//	public ArrayList<DailyCSDTO> searchTab(String cs_type, JaewonCriteria cri3) {
	public ArrayList<DailyCSDTO> searchTab(dailyCSCriteria cri3) {
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
//		ArrayList<DailyCSDTO> searchTab = dao.searchTab(cs_type, cri3);
//		ArrayList<DailyCSDTO> searchTab = dao.searchTab(cs_type, cri3);
		ArrayList<DailyCSDTO> searchTab = dao.searchTab(cri3);
		return searchTab;
	}

	@Override
	public int dailyCSGetTotalCount() {
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
		int total = dao.dailyCSGetTotalCount();
		
		return total;
	}

	

	
}







