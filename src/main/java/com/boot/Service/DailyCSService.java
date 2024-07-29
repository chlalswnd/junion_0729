package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.DTO.DailyCSDTO;
import com.boot.DTO.boardBoardDTO;





public interface DailyCSService {
	public ArrayList<DailyCSDTO> questionList();

	public DailyCSDTO question(Integer cs_num);
	
	public void modifyCheck(Integer cs_num, String user_email);
	
}
