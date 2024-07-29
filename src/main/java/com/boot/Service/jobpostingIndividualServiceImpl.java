package com.boot.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.jobpostingIndividualDAO;
import com.boot.DTO.Criteria3;
import com.boot.DTO.jobpostingIndividualDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("jobpostingIndividualService")
public class jobpostingIndividualServiceImpl implements jobpostingIndividualService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(String orderType, Criteria3 cri) {
//	public ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport(Criteria3 cri) {
		log.info("@# jobpostingIndividualSupport");
//		log.info("@# orderType=>"+orderType);
		log.info("@# cri=>"+cri);
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ArrayList<jobpostingIndividualDTO> list = dao.jobpostingIndividualSupport(orderType, cri);
//		ArrayList<jobpostingIndividualDTO> list = dao.jobpostingIndividualSupport(cri);
		
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
		log.info("@# getJobList");
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ArrayList<String> list = dao.getStackList();		
		return list;
	}

	@Override
	public ArrayList<String> getLocationList() {
		log.info("@# getJobList");
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ArrayList<String> list = dao.getLocationList();		
		return list;
	}

	@Override
	public int getTotalCount() {
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		int total = dao.getTotalCount();
		return total;
	}
	
}






