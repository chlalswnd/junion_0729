package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.announcementsBoardDTO;
import com.boot.DTO.announcementsTermsDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.DTO.noticeBoardBoardDTO;



public interface announcementsBoardService {  // 게시글 목록,작성버튼,수정버튼,삭제버튼
	public ArrayList<announcementsBoardDTO> boardList();  // 게시판 목록
	
	public announcementsBoardDTO findByBoardno(int board_no);
	public announcementsBoardDTO boardModifyView(HashMap<String, String> param);

	public void boardWrite(announcementsBoardDTO boardDTO);
	public void boardModify(HashMap<String, String> param);
	public void boardDelete(HashMap<String, String> param);
	
}