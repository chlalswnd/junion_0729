package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.comBoardBoardDTO;
import com.boot.DTO.noticeBoardBoardDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface noticeBoardBoardDAO {  // 게시글 목록,작성버튼,수정버튼,삭제버튼
	public ArrayList<noticeBoardBoardDTO> boardList();  // 게시판 목록
	
//	public void write(HashMap<String, String> param);
//	public BoardDTO contentView(HashMap<String, String> param);
	public noticeBoardBoardDTO boardDetailView(HashMap<String, String> param);
	public noticeBoardBoardDTO boardModifyView(HashMap<String, String> param);
//	public void upHit(String boardNo); 생략
	public void boardWrite(noticeBoardBoardDTO boardDTO);
	public void boardModify(HashMap<String, String> param);
	public void boardDelete(HashMap<String, String> param);
	
	public int hitcount(noticeBoardBoardDTO boardDTO);
	
	int checkLike(@Param("board_no") int board_no, @Param("login_email") String login_email);
	void insertLike(@Param("board_no") int board_no, @Param("login_email") String login_email);
}
















