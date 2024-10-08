package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.LoginDTO;


@Mapper
public interface LoginDAO {
	
	public ArrayList<LoginDTO> loginynI(HashMap<String, String> param);
	public ArrayList<LoginDTO> loginynC(HashMap<String, String> param);
	
	public ArrayList<LoginDTO> findEI(HashMap<String, String> param);
	public ArrayList<LoginDTO> findPWI(HashMap<String, String> param);

	public ArrayList<LoginDTO> findEC(HashMap<String, String> param);
	public ArrayList<LoginDTO> findPWC(HashMap<String, String> param);
	
	
	public void resetPWI(HashMap<String, String> param);
	public void resetPWC(HashMap<String, String> param);
}
