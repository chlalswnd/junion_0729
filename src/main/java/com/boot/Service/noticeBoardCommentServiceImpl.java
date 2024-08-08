package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.boardCommentDAO;
import com.boot.DAO.comBoardCommentDAO;
import com.boot.DAO.noticeBoardCommentDAO;
import com.boot.DTO.boardCommentDTO;
import com.boot.DTO.comBoardCommentDTO;
import com.boot.DTO.noticeBoardCommentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("noticeBoardCommentService")
public class noticeBoardCommentServiceImpl implements noticeBoardCommentService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void boardSave(HashMap<String, String> param) {
		log.info("@# 코멘트서비스임플 save");
		
		noticeBoardCommentDAO dao = sqlSession.getMapper(noticeBoardCommentDAO.class);
		dao.boardSave(param);
	}

	@Override
	public ArrayList<noticeBoardCommentDTO> boardFindAll(HashMap<String, String> param) {
		log.info("@# 코멘트서비스임플 findAll");
		
		noticeBoardCommentDAO dao = sqlSession.getMapper(noticeBoardCommentDAO.class);
		ArrayList<noticeBoardCommentDTO> list = dao.boardFindAll(param);
		
		return list;
	}

}







