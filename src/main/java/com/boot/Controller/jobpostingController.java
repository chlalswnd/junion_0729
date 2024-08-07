	package com.boot.Controller;
	
	import java.util.ArrayList;
	import java.util.HashMap;
	import java.util.List;
	
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpSession;
	
	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;
	import org.springframework.web.bind.annotation.ResponseBody;
	
	import com.boot.DTO.jobpostingDTO;
	import com.boot.Service.jobpostingService;
	
	import lombok.extern.slf4j.Slf4j;
	
	@Controller
	@Slf4j
	public class jobpostingController {
	
		
		@Autowired
		private jobpostingService jobpostingService;
		
		// 채용공고 리스트
		@RequestMapping("/jobpostingList")
		public String jobpostingList(Model model, HttpServletRequest request) //jobpostingList
		{
			log.info("@# jobpostingList");	
			
			// 세션에 이메일 담아서 쓰는 법
			HttpSession session = request.getSession();		
			String login_email = (String)session.getAttribute("login_email");  // @ 세션으로 이메일 값 받아와서 이메일에 맞는 공고만 출력
	//		String login_email = "a@junion.com";  // @ 이메일 없으므로 임시로 지정해줌
			log.info("@# login_email=>"+login_email);
			ArrayList<jobpostingDTO> jobpostingList = jobpostingService.jobpostingList(login_email);
	//		ArrayList<jobpostingDTO> jobpostingOnList = jobpostingService.jobpostingOnList(login_email);
	//		ArrayList<jobpostingDTO> jobpostingOffList = jobpostingService.jobpostingOffList(login_email);
			model.addAttribute("jobpostingList",jobpostingList);	
	//		model.addAttribute("jobpostingOnList",jobpostingOnList);	
	//		model.addAttribute("jobpostingOffList",jobpostingOffList);	
			
			
	//        String notice_num = (String) session.getAttribute("notice_num");
	        
	        jobpostingDTO totalCount = jobpostingService.jobpostingTotalCount(login_email);
	        model.addAttribute("totalCount", totalCount);
			log.info("@# login_email=>"+login_email);
			
			
	//		ArrayList<jobpostingDTO> jobpostingSupportCount = jobpostingService.jobpostingSupportCount(notice_num);
	//		model.addAttribute("jobpostingSupportCount",jobpostingSupportCount);
	//		log.info(notice_num);
			
	//        jobpostingDTO supportCount = jobpostingService.jobpostingSupportCount(notice_num);
	//        model.addAttribute("supportCount", supportCount);
	//		log.info("@# login_email=>"+notice_num);
			
		
			return "jobpostingList";
		}
		
		
	
	    // 채용공고 삭제
		@RequestMapping(value = "/jobpostingDelete", method = RequestMethod.POST)
		@ResponseBody
		public String jobpostingDelete(@RequestParam("notice_num") String notice_num) {
		    try {
		        jobpostingService.jobpostingDelete(notice_num);
		        return "success";
		    } catch (Exception e) {
		        e.printStackTrace();
		        return "error";
		    }
		}
	    
	
	    // =============================  LIST 끝 ==========================
	
	
	    
	
		// 채용공고 지원자 리스트
		@RequestMapping("/jobpostingSupport")
		public String jobpostingSupport(
		    Model model,
		    HttpServletRequest httpServletRequest,
		    @RequestParam String notice_num,
		    @RequestParam(required = false) String submitStatus,
		    @RequestParam(required = false) String submitCheck) 
		{
		    log.info("@# jobpostingSupport");

		    // 필터를 적용하여 지원자 목록 가져오기
		    ArrayList<jobpostingDTO> jobpostingSupport = jobpostingService.jobpostingSupportFiltered(notice_num, submitStatus, submitCheck);
		    model.addAttribute("jobpostingSupport", jobpostingSupport);

		    HttpSession session = httpServletRequest.getSession();
		    String login_email = (String) session.getAttribute("login_email");
		    model.addAttribute("login_email", login_email);

		    // submitStatus를 모델에 전달
		    model.addAttribute("submitStatus", submitStatus);

		    return "jobpostingSupport";
		}

		
		
		// 열람, 미열람
		@PostMapping("/updateSubmitCheck")
		public ResponseEntity<String> updateSubmitCheck(@RequestParam("resume_num") int resumeNum,
		                                                @RequestParam("notice_num") int noticeNum,
		                                                @RequestParam("status") String status) {
		    try {
		        // submit_tb 테이블의 submit_check 필드를 '열람'으로 업데이트
		    	jobpostingService.updateSubmitCheck(resumeNum, noticeNum, status);
		        return ResponseEntity.ok("상태 업데이트 성공");
		    } catch (Exception e) {
		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 실패");
		    }
		}
		
		
		// 업데이트 합격,불합격,보류
		@PostMapping("/updateStatus")
		public ResponseEntity<String> updateStatus(@RequestParam("resume_num") int resumeNum,
				@RequestParam("notice_num") int noticeNum,
				@RequestParam("updateStatus") String updateStatus) {
			try {
				// submit_tb 테이블의 submit_check 필드를 '열람'으로 업데이트
				jobpostingService.updateStatus(resumeNum, noticeNum, updateStatus);
				return ResponseEntity.ok("상태 업데이트 성공");
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 실패");
			}
		}
		
		
	    
	    
	    
//	    // 인재풀 리스트 (개인)
//	    @RequestMapping("/jobpostingIndividualSupport")
//	    public String jobpostingIndividualSupport(Model model, HttpServletRequest request) 
//	    {
//	    	log.info("@# jobpostingIndividualSupport");	
//	    	
//	    	// 세션에 이메일 담아서 쓰는 법
//	    	HttpSession session = request.getSession();		
//	//		String login_email = (String)session.getAttribute("login_email");
//	    	String notice_num = (String)session.getAttribute("notice_num"); 
//	    	String login_email = "a@junion.com";  // @ 이메일 없으므로 임시로 지정해줌  
//	    	log.info("@# notice_num=>"+notice_num);
//	    	ArrayList<jobpostingDTO> jobpostingIndividualSupport = jobpostingService.jobpostingSupport(notice_num); 
//	    	model.addAttribute("jobpostingIndividualSupport",jobpostingIndividualSupport);	
//	    	
//	    	
//	
//	    	return "jobpostingIndividualSupport";
//	    }
	    // =============================  SUPPORT 끝  ==========================
	    
	    
	    // 채용공고 지원자 포지션제안 Insert
	    @RequestMapping("/jobpostingOffer")
	    public String jobpostingOffer(jobpostingDTO jobpostingDTO) 
	    {
	
	    	jobpostingService.jobpostingOffer(jobpostingDTO);
	    	
	  
	    	return "redirect:jobpostingSupport";
	    }
	    // =============================  Offer 끝  ==========================
	
	    
	}
