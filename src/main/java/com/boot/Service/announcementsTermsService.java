package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.announcementsTermsDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.DTO.noticeBoardBoardDTO;



public interface announcementsTermsService {  // 게시글 목록,작성버튼,수정버튼,삭제버튼
	public ArrayList<announcementsTermsDTO> boardList();  // 게시판 목록
	
	public announcementsTermsDTO boardDetailView(HashMap<String, String> param);
	public announcementsTermsDTO boardModifyView(HashMap<String, String> param);

	public void boardWrite(announcementsTermsDTO boardDTO);
	public void boardModify(HashMap<String, String> param);
	public void boardDelete(HashMap<String, String> param);
}
