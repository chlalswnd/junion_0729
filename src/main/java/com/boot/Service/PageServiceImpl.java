package com.boot.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.PageDAO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.Criteria2;
import com.boot.DTO.OfferInfoDTO;
import com.boot.DTO.ResumeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("PageService")
public class PageServiceImpl implements PageService{

	@Autowired
	private SqlSession sqlSession;		

	@Override
	public ArrayList<ResumeDTO> listWithPaging(Criteria2 cri2, HttpServletRequest request) {
//	public ArrayList<ResumeDTO> listWithPaging(Criteria cri, String user_email) {
		log.info("@# PageServiceImpl listWithPaging");
		log.info("@# cri==>"+ cri2);
		
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# user_email==>"+ user_email);
		
		cri2.setUser_email(user_email);
		log.info("@# setUser_email 한 후 cri==>"+ cri2);
		
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
//		ArrayList<ResumeDTO> list = dao.listWithPaging(cri);
		ArrayList<ResumeDTO> list = dao.listWithPaging(cri2);
		
		log.info("@# list==>"+ list);
		
		return list;
	}

	@Override
	public int getTotalCount(String user_email) {
		log.info("@# PageServiceImpl getTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		int total = dao.getTotalCount(user_email);
		
		return total;
	}

	@Override
	public ArrayList<CompanyInfoDTO> comlistWithPaging(Criteria2 cri2, HttpServletRequest request) {
		log.info("@# PageServiceImpl comlistWithPaging");
		log.info("@# cri==>"+ cri2);
		
		// 세션에 이메일 담아서 쓰는 법
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# user_email==>"+ user_email);
		
		cri2.setUser_email(user_email);
		log.info("@# setUser_email 한 후 cri==>"+ cri2);
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		ArrayList<CompanyInfoDTO> list = dao.comlistWithPaging(cri2);
		
		log.info("@# list==>"+ list);
		
		return list;
	}

	@Override
	public int getComTotalCount(@Param("user_email") String user_email, @Param("keyword") String keyword) {
		log.info("@# PageServiceImpl getComTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		int total = dao.getComTotalCount(user_email, keyword);
		
		return total;
	}	

	
	
	@Override
//	public ArrayList<ComNoticeDTO> noticelistWithPaging(Criteria2 cri2, HttpServletRequest request) {
	public ArrayList<ComNoticeDTO> noticelistWithPaging(Criteria2 cri2) {
		log.info("@# PageServiceImpl noticelistWithPaging");
		log.info("@# cri==>"+ cri2);
		
//		// 세션에 이메일 담아서 쓰는 법
//		HttpSession session = request.getSession();		
//		String user_email = (String)session.getAttribute("login_email");
//		log.info("@# user_email==>"+ user_email);
//		
//		cri2.setUser_email(user_email);
//		log.info("@# setUser_email 한 후 cri==>"+ cri2);
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		ArrayList<ComNoticeDTO> list = dao.noticelistWithPaging(cri2);
		
		log.info("@# list==>"+ list);
		
		return list;
	}

	@Override
//	public int getNoticeTotalCount(@Param("user_email") String user_email, @Param("keyword") String keyword) {
	public int getNoticeTotalCount(Criteria2 cri2) {
	log.info("@# PageServiceImpl getNoticeTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		int total = dao.getNoticeTotalCount(cri2);
		
		return total;
	}

	@Override
	public ArrayList<ComNoticeDTO> recentnoticelistWithPaging(Criteria2 cri2) {
		log.info("@# PageServiceImpl recentnoticelistWithPaging");
		log.info("@# cri==>"+ cri2);
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		ArrayList<ComNoticeDTO> list = dao.recentnoticelistWithPaging(cri2);
		
		log.info("@# list==>"+ list);
		
		return list;
	}

	@Override
	public int getRecentNoticeTotalCount(Criteria2 cri2) {
		log.info("@# PageServiceImpl getRecentNoticeTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		int total = dao.getNoticeTotalCount(cri2);
		
		return total;
	}

	@Override
	public ArrayList<OfferInfoDTO> offerListWithPaging(Criteria2 cri2) {
		log.info("@# PageServiceImpl offerListWithPaging");
		log.info("@# cri==>"+ cri2);
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		ArrayList<OfferInfoDTO> list = dao.offerListWithPaging(cri2);
		
		log.info("@# list==>"+ list);
		
		return list;
	}

	@Override
	public int offerListTotalCount(Criteria2 cri2) {
		log.info("@# PageServiceImpl offerListTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		int total = dao.offerListTotalCount(cri2);
		
		return total;
	}

	@Override
//	public void rejectOffer(@Param("user_email") String user_email, @Param("offer_no") int offer_no) {
	public void rejectOffer(String user_email, int offer_no) {
		log.info("@# PageServiceImpl rejectOffer");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		dao.rejectOffer(user_email, offer_no);
	}

	

	
	
}
