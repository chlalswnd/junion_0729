package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.Criteria2;
import com.boot.DTO.DailyCSDTO;
import com.boot.DTO.ResumeDTO;

// DB SQL 처리

@Mapper
public interface DailyCSDAO {
	public ArrayList<DailyCSDTO> questionList();
	
	public DailyCSDTO question(Integer cs_num);

	public void modifyCheck(Integer cs_num, String user_email);
	
}// public class BoardDAO 끝 
