package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.boardCommentDTO;
import com.boot.DTO.comBoardCommentDTO;
import com.boot.DTO.noticeBoardCommentDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface noticeBoardCommentDAO {  // 댓글 저장, 열람
	public void boardSave(HashMap<String, String> param); // 댓글 저장 / 파라미터 해쉬맵 param
	public ArrayList<noticeBoardCommentDTO> boardFindAll(HashMap<String, String> param); // 댓글 열람 / 게시글번호와 맞춰 select / 파라미터 해쉬맵 param
}
















