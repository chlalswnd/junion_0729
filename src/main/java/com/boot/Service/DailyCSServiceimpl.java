package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.DailyCSDAO;
import com.boot.DAO.boardAttachDAO;
import com.boot.DAO.boardBoardDAO;
import com.boot.DTO.DailyCSDTO;
import com.boot.DTO.boardBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("DailyCSService")
public class DailyCSServiceimpl implements DailyCSService{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public ArrayList<DailyCSDTO> questionList() {
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
		ArrayList<DailyCSDTO> questionList = dao.questionList();
		
		return questionList;
	}
	
	@Override
//	public ArrayList<DailyCSDTO> question(Integer cs_num) {
	public DailyCSDTO question(Integer cs_num) {
		
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
		DailyCSDTO question =dao.question(cs_num);		
		
		return question;
	}

	@Override
	public void modifyCheck(Integer cs_num, String user_email) {
		log.info("@@@###modifyCheck Serviceimpl====>"+cs_num);
		log.info("@@@###modifyCheck Serviceimpl====>"+user_email);
		
		DailyCSDAO dao = sqlSession.getMapper(DailyCSDAO.class);
		dao.modifyCheck(cs_num, user_email);	
		
		log.info("@@@###modifyCheck Serviceimpl====>"+dao);
	}


	

	
}







