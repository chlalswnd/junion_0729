package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.announcementsTermsDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.DTO.noticeBoardBoardDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface announcementsTermsDAO {  // 게시글 목록,작성버튼,수정버튼,삭제버튼
	public ArrayList<announcementsTermsDTO> boardList();  // 게시판 목록
	
	public announcementsTermsDTO boardDetailView(HashMap<String, String> param);
	public announcementsTermsDTO boardModifyView(HashMap<String, String> param);

	public void boardWrite(announcementsTermsDTO boardDTO);
	public void boardModify(HashMap<String, String> param);
	public void boardDelete(HashMap<String, String> param);
	
}
















