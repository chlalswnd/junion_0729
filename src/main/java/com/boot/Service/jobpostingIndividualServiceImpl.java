package com.boot.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.jobpostingIndividualDAO;
import com.boot.DTO.Criteria3;
import com.boot.DTO.OfferInfoDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.UserDTO;
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
		
		ArrayList<String> jobNames = dao.getJobNames(cri.getLogin_email());
		ArrayList<String> stackNames = dao.getStackNames(cri.getLogin_email());
		log.info("@# jobNames=>"+jobNames);
		log.info("@# stackNames=>"+stackNames);
		
//		jobNames.add("오류방지용 데이터");
//		stackNames.add("오류방지용 데이터");
//
//		log.info("@# jobNames=>"+jobNames);
//		log.info("@# stackNames=>"+stackNames);
		
		cri.setJobNames(jobNames);
		cri.setStackNames(stackNames);

		log.info("@# cri.getJobNames=>"+cri.getJobNames());
		log.info("@# cri.getStackNames=>"+cri.getStackNames());
		log.info("@# cri=>"+cri);
		
		ArrayList<jobpostingIndividualDTO> list = dao.jobpostingIndividualSupport(orderType, cri);
//		ArrayList<jobpostingIndividualDTO> list = dao.jobpostingIndividualSupport(cri);
		
		if (cri.getLogin_usertype() == '2') {
			// 스택 리스트 콤마로 나눠서 배열에 담음
			for (int i = 0; i < list.size(); i++) {
				String stackList = list.get(i).getStack_names();
				if (stackList != null && !stackList.isEmpty()) {
					List<String> stacks = Arrays.asList(stackList.split(","));
		            // stacks 리스트에서 최대 5개의 요소만 선택
		            if (stacks.size() > 5) {
		            	stacks = stacks.subList(0, 5);
		            }
					list.get(i).setStackList(stacks);
				} else {
					list.get(i).setStackList(new ArrayList<>()); // 빈 리스트 설정
				}
			}
			return list;
		} else {
			// 직군/직무 리스트 콤마로 나눠서 배열에 담음
			for (int i = 0; i < list.size(); i++) {
				String jobList = list.get(i).getJob_names();
				if (jobList != null && !jobList.isEmpty()) {
					List<String> jobs = Arrays.asList(jobList.split(","));
		            // jobs 리스트에서 최대 5개의 요소만 선택
		            if (jobs.size() > 5) {
		                jobs = jobs.subList(0, 5);
		            }
					list.get(i).setJobList(jobs);
				} else {
					list.get(i).setJobList(new ArrayList<>()); // 빈 리스트 설정
				}
			}
			return list;
		}
	}

	@Override
	public ArrayList<String> getJobList() {
		log.info("@# getJobList");
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ArrayList<String> list = dao.getJobList();		
		return list;
	}
	
	@Override
	public ArrayList<String> getStackList() {
		log.info("@# getStackList");
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ArrayList<String> list = dao.getStackList();		
		return list;
	}

	@Override
	public ArrayList<String> getLocationList() {
		log.info("@# getLocationList");
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ArrayList<String> list = dao.getLocationList();		
		return list;
	}
	
//	@Override
//	public int getTotalCount() {
//		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
//		int total = dao.getTotalCount();
//		return total;
//	}

	@Override
	public int getTotalCount(@Param("cri") Criteria3 cri) {
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		int total = dao.getTotalCount(cri);
		return total;
	}

	@Override
	public ArrayList<OfferInfoDTO> getOfferInfo(String login_email) {
		log.info("@# getOfferInfo");
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ArrayList<OfferInfoDTO> list = dao.getOfferInfo(login_email);		
		return list;
	}

	@Override
	public void insertOffer(OfferInfoDTO offer) {
		log.info("@# insertOffer");
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		dao.insertOffer(offer);		
	}

	@Override
	public ResumeDTO resumeInfo(int resumeNum) {
		log.info("@# BoardServiceImpl content_view");
			
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		ResumeDTO dto = dao.resumeInfo(resumeNum);
		
		return dto;
	}

	@Override
//	public ArrayList<UserDTO> userInfo(HashMap<String, String> param) {
//	public UserDTO userInfo(HashMap<String, String> param) {
	public UserDTO userInfo(String user_email) {
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		UserDTO dto = dao.userInfo(user_email);
		return dto;
	}

	@Override
	public int checkOffer(String login_email, int resumeNum) {
		jobpostingIndividualDAO dao = sqlSession.getMapper(jobpostingIndividualDAO.class);
		int check_offer = dao.checkOffer(login_email, resumeNum);
		return check_offer;
	}
}






