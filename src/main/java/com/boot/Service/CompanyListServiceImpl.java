package com.boot.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.CompanyListDAO;
import com.boot.DTO.CompanyListDTO;
import com.boot.DTO.Criteria4;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service("CompanyListService")
public class CompanyListServiceImpl implements CompanyListService{
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public ArrayList<CompanyListDTO> comList(String orderType, Criteria4 cri) {  
		log.info("@# comList list");
		
		CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class); 
		ArrayList<CompanyListDTO> list = dao.comList(orderType, cri); // dao값을 배열CompanyInfoDTO 'list' 에 집어넣음
		
		// 스택 리스트 콤마로 나눠서 배열에 담음
		for (int i = 0; i < list.size(); i++) {
			String stackList = list.get(i).getStack_names();
			if (stackList != null && !stackList.isEmpty()) {
	            List<String> stacks = Arrays.asList(stackList.split(","));
	            list.get(i).setStackList(stacks);
	        } else {
	            list.get(i).setStackList(new ArrayList<>()); // 빈 리스트 설정
	        }
		}
		
		return list;
	}

	@Override
	public ArrayList<String> getStackList() {
		log.info("@# getStackList");
		CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
		ArrayList<String> list = dao.getStackList();
		return list;
	}

	@Override
	public ArrayList<String> getLocationList() {
		log.info("@# getLocationList");
		CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
		ArrayList<String> list = dao.getLocationList();
		return list;
	}

/*
	07/26 11:50 민중
*/
	@Override
	public int getTotalCount() {
		CompanyListDAO dao = sqlSession.getMapper(CompanyListDAO.class);
		int total = dao.getTotalCount();
		return total;
	}
}

