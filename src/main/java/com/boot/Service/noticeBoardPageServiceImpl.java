package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.boardAttachDAO;
import com.boot.DAO.boardBoardDAO;
import com.boot.DAO.boardPageDAO;
import com.boot.DAO.comBoardPageDAO;
import com.boot.DAO.noticeBoardPageDAO;
import com.boot.DTO.Criteria;
import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.DTO.noticeBoardBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("noticeBoardPageService")
public class noticeBoardPageServiceImpl implements noticeBoardPageService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<noticeBoardBoardDTO> boardListWithPaging(Criteria cri) {  // boardPage.xml에서 구현
		log.info("@# 페이지서비스임플 listWithPaging");
		log.info("@# cri=>"+cri);
		
		noticeBoardPageDAO dao = sqlSession.getMapper(noticeBoardPageDAO.class);
		ArrayList<noticeBoardBoardDTO> list=dao.boardListWithPaging(cri);
		
		return list;
	}

	@Override
//	public int getTotalCount() {
	public int boardGetTotalCount(Criteria cri) {
		log.info("@# 페이지서비스임플 getTotalCount");
		
		noticeBoardPageDAO dao = sqlSession.getMapper(noticeBoardPageDAO.class);
//		int total=dao.getTotalCount();
		int total=dao.boardGetTotalCount(cri);
		
		return total;
	}

}







