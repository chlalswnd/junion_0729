package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.Criteria;
import com.boot.DTO.announcementsBoardDTO;
import com.boot.DTO.announcementsTermsDTO;
import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.boardBoardDTO;
import com.boot.DTO.boardCommentDTO;
import com.boot.DTO.boardPageDTO;
import com.boot.DTO.noticeBoardAttachDTO;
import com.boot.DTO.noticeBoardBoardDTO;
import com.boot.DTO.noticeBoardCommentDTO;
import com.boot.Service.announcementsBoardService;
import com.boot.Service.announcementsTermsService;
import com.boot.Service.boardBoardService;
import com.boot.Service.boardCommentService;
import com.boot.Service.boardUploadService;
import com.boot.Service.noticeBoardPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class announcementsController {

	@Autowired
	private noticeBoardPageService service;
	
	@Autowired
	private announcementsTermsService termsService;
	
	@Autowired
	private announcementsBoardService boardService;
	
	//공지사항 메인화면
	@RequestMapping("/announcements")
	public String announcementsList(Criteria cri, Model model,  noticeBoardBoardDTO boardDTO, HttpServletRequest httpServletRequest) {

		ArrayList<noticeBoardBoardDTO> list = service.boardListWithPaging(cri);
		int total = service.boardGetTotalCount(cri);
		log.info("@# total=>"+total);
		
		model.addAttribute("boardList", list);  // BOARD DTO 보냄
		model.addAttribute("pageMaker", new boardPageDTO(total, cri));  // PAGE DTO (토탈,CRI) 보냄
		
		ArrayList<announcementsTermsDTO> termsList = termsService.boardList();
		model.addAttribute("termsBoardList", termsList);  
		//회원약관
		
		
		return "announcements";
	}

	

	
	
	// 공지사항 목록
	@GetMapping("/announcementsBoard")
	public String announcementsBoard(Model model,  announcementsBoardDTO boardDTO, HttpServletRequest httpServletRequest) {
		
		ArrayList<announcementsBoardDTO> list = boardService.boardList();
		model.addAttribute("announcementsBoard", list);  
		
		
		  HttpSession session = httpServletRequest.getSession();
	      session.getAttribute("login_usertype");
	      
	      model.addAttribute("login_usertype",session.getAttribute("login_usertype"));
		
		return "announcementsBoard";
	}
	
	
//	// 이용약관 상세보기
//	@ResponseBody
//	@GetMapping("/announcement/{board_no}")  
//	public ResponseEntity<announcementsBoardDTO> getAnnouncementById(@PathVariable int board_no){
//		
//		announcementsBoardDTO announcement = boardService.findByBoardno(board_no);
//        return announcement != null ? ResponseEntity.ok(announcement) : ResponseEntity.notFound().build();
//		
//		
////		log.info("@# 보드컨트롤러  noticeBoardDetailView");
////		
////		announcementsTermsDTO dto = termsService.boardDetailView(param);
////		model.addAttribute("boardDetailView", dto);
////		
////		HttpSession session = httpServletRequest.getSession();
////		session.getAttribute("login_email");
////		log.info("@# session에서 가져온 로그인이메일 =>"+(String) session.getAttribute("login_email"));
////		
////		model.addAttribute("login_email",session.getAttribute("login_email"));
////		
////		return "announcementsTermsDetailView";
//	}
//	
//	// 공지사항 상세보기
//	@GetMapping("/announcementsBoardDetailView")
//	public String announcementsBoardDetailView(Model model ,ResponseEntity<announcementsBoardDTO> dto , HttpServletRequest httpServletRequest) {
//		
////		ArrayList<announcementsBoardDTO> list = boardService.boardList();
//		model.addAttribute("boardDetailView", dto);  
//		
//		
//		HttpSession session = httpServletRequest.getSession();
//		session.getAttribute("login_usertype");
//		
//		model.addAttribute("login_usertype",session.getAttribute("login_usertype"));
//		
//		return "announcementsBoardDetailView";
//	}
//	



	
	
	
	
	
	// 이용약관 목록
	@RequestMapping("/announcementsTerms")  // 이용약관 목록
	public String announcementsTerms(Model model,  announcementsTermsDTO boardDTO, HttpServletRequest httpServletRequest) {
		
		ArrayList<announcementsTermsDTO> list = termsService.boardList();
		model.addAttribute("announcementsTerms", list);  
		
		
		return "announcementsTerms";
	}
	
	
	// 이용약관 작성화면
	@RequestMapping("/announcementsTermsWriteView")  // 이용약관 작성 페이지
	public String boardWriteView(HttpServletRequest httpServletRequest, Model model) {
		log.info("@# announcementsTermsWriteView");
		
		  HttpSession session = httpServletRequest.getSession();
	      session.getAttribute("login_email");
	      log.info("@# session에서 가져온 로그인이메일 =>"+(String) session.getAttribute("login_email"));
	      
	      model.addAttribute("login_email",session.getAttribute("login_email"));
	      
		return "announcementsTermsWriteView";
	}
	
	
	// 이용약관 작성버튼
	@RequestMapping("/announcementsTermsWrite")  // 이용약관 작성 버튼
	public String boardWrite(announcementsTermsDTO boardDTO, @RequestParam("login_email") String login_email) {
		log.info("@# 보드컨트롤러 noticeBoardWrite");
		log.info("@# 보드컨트롤러 noticeBoardDTO=>"+boardDTO);
		

		termsService.boardWrite(boardDTO);

		return "redirect:announcementsTerms";
	}
	
	
	// 이용약관 상세보기
	@RequestMapping("/announcementsTermsDetailView")  // content_view 사용하지만 글 눌렀을때 이쪽타고 '글 상세보기' 보여줌
	public String boardDetailView(@RequestParam HashMap<String, String> param, Model model, announcementsTermsDTO boardDTO, HttpServletRequest httpServletRequest) {
		log.info("@# 보드컨트롤러  noticeBoardDetailView");
		
		announcementsTermsDTO dto = termsService.boardDetailView(param);
		model.addAttribute("boardDetailView", dto);
		
		HttpSession session = httpServletRequest.getSession();
		session.getAttribute("login_email");
		log.info("@# session에서 가져온 로그인이메일 =>"+(String) session.getAttribute("login_email"));
		
		model.addAttribute("login_email",session.getAttribute("login_email"));
		
		return "announcementsTermsDetailView";
	}
	
	
	// 이용약관 삭제버튼
	@RequestMapping("/announcementsTermsDelete")
//	public String delete(@RequestParam HashMap<String, String> param) {
	public String boardDelete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
//		log.info("@# noticeBoardDelete");
//		log.info("@# param=>"+param);
//		log.info("@# board_no=>"+param.get("board_no"));
		
		termsService.boardDelete(param);
		
		return "redirect:announcementsTerms";
	}
	
	
	
}
















