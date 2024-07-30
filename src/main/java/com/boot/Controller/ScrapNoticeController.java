package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.Criteria2;
import com.boot.DTO.PageDTO;
import com.boot.Service.PageService;
import com.boot.Service.ScrapNoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScrapNoticeController {
//	@Autowired
//	private ScrapNoticeService service;
//	
//	@Autowired
//	private PageService pageService;
	

	
//	@RequestMapping("/individualNoticeScrap") //스크랩 공고
//	public String individualNoticeScrap(HttpServletRequest request, Model model, Criteria2 cri2) {
//		log.info("@# noticeScrap");	
//		
//		HttpSession session = request.getSession();
//		String user_email = (String)session.getAttribute("login_email");
//		log.info("@# noticeScrap  user_email=>"+user_email);	
//		
//		// 사용자정보의 스크랩 채용공고 목록 가져오기
//		ArrayList<ComNoticeDTO> list = pageService.noticelistWithPaging(cri2, request);
//		log.info("@# noticeScrap getNoticeScrapList=>"+list);		
//		model.addAttribute("noticeList", list);
//		log.info("@# noticeList=>" + list);
//		
//		int total = pageService.getNoticeTotalCount(user_email);
//		log.info("@# total=>"+total);
//		
//		log.info("@# cri2=>"+cri2);		
//		log.info("@# cri2 깃 수정중=>"+cri2);		
//		
//		model.addAttribute("pageMaker", new PageDTO(total,cri2));			
//						
//		
//		return "individualNoticeScrap";
//	}
	
	
	

	

	
	
}
















