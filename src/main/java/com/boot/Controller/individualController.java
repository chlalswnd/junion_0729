package com.boot.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.ComScrapDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.Criteria2;
import com.boot.DTO.JoinDTO;
import com.boot.DTO.NoticeScrapDTO;
import com.boot.DTO.OfferInfoDTO;
import com.boot.DTO.PageDTO;
import com.boot.DTO.ResumeUploadDTO;
import com.boot.DTO.UserDTO;
import com.boot.DTO.UserImageUploadDTO;
import com.boot.DTO.UserJobDTO;
import com.boot.DTO.UserStackDTO;
import com.boot.Service.IndividualService;
import com.boot.Service.JoinService;
import com.boot.Service.PageService;
import com.boot.Service.UserImageUploadService;
import com.boot.Service.noticeBoardUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class individualController {
	
	@Autowired
	private IndividualService service;
	
	@Autowired
	private JoinService joinService;
	
	@Autowired
	private PageService pageService;
	
	@Autowired
	private UserImageUploadService uploadService;
		
	
	@RequestMapping("/individualMain")//개인 마이페이지 메인으로
	public String individualMain(Model model) {
		log.info("@# individualMain");		
		
		return "individualMain";
	}
	
	@RequestMapping("/individualJobOffer")//받은 제안 목록으로
	public String individualJobOffer(HttpServletRequest request, Model model, Criteria2 cri2){
		log.info("@# individualJobOffer");	
		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# individualJobOffer  user_email=>"+user_email);	
		
		log.info("@# cri=>"+cri2);
		cri2.setUser_email(user_email);
//		cri2.setOrderBy(orderBy);
//		cri2.setKeyword(keyword);
		log.info("@# setUser_email한 다음 cri=>"+cri2);
		
		ArrayList<OfferInfoDTO> list = new ArrayList<>();
	    list = pageService.offerListWithPaging(cri2);
				
		log.info("@# individualJobOffer noticelistWithPaging=>"+list);		
		model.addAttribute("offerList", list);
		
		int total = pageService.offerListTotalCount(cri2);
		log.info("@# individualJobOffer total=>"+total);
//		model.addAttribute("total",total);
					
		model.addAttribute("pageMaker", new PageDTO(total,cri2));	
		
		
		
		return "individualJobOffer";
	}
		
	
	@RequestMapping("/rejectOffer")//제안 거절하기
//	public String rejectOffer(HashMap<String, String> param, HttpServletRequest request) {
	public String rejectOffer(@RequestParam("offer_no") int offer_no, HttpServletRequest request) {
		log.info("@# rejectOffer");		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		
		OfferInfoDTO dto = new OfferInfoDTO();
//		int offer_no=Integer.parseInt(param.get("offer_no"));
                	
		pageService.rejectOffer(user_email, offer_no);
		
		return "redirect:/individualJobOffer";
	}
	
	
	@RequestMapping("/offerDelete")// 받은제안 삭제
	public String offerDelete(HashMap<String, String> param, HttpServletRequest request) {
	
		log.info("@# offerDelete");		
//		HttpSession session = request.getSession();
//		String user_email = (String)session.getAttribute("login_email");
		
		String [] arrStr = request.getParameterValues("arrStr");//offer_no배열
        int size = arrStr.length;
        for(int i=0; i<size; i++) {
        	      	
        	service.offerDelete(Integer.parseInt(arrStr[i]));
        }
        
	
		return "redirect:/individualrecentNotice";
	}
	
	
	@RequestMapping("/individualrecentNotice")//최근 본 공고 목록보기
	public String individualrecentNotice(HttpServletRequest request, Model model, Criteria2 cri2) {
		log.info("@# individualrecentNotice");		
		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# recentNotice user_email=>"+user_email);		
		
		log.info("@# cri=>"+cri2);
		cri2.setUser_email(user_email);
		log.info("@# setUser_email한 다음 cri=>"+cri2);
		
		ArrayList<ComNoticeDTO> list = new ArrayList<>();
	    list = pageService.recentnoticelistWithPaging(cri2);
	    
	    log.info("@# individualNoticeScrap noticelistWithPaging=>"+list);		
		model.addAttribute("noticeList", list);
		
		int total = pageService.getRecentNoticeTotalCount(cri2);
		log.info("@# individualNoticeScrap total=>"+total);
//		model.addAttribute("total",total);
					
		model.addAttribute("pageMaker", new PageDTO(total,cri2));	
		
		return "individualrecentNotice";
	}
	
	
	
	@RequestMapping("/recentNoticeDelete")//최근본 공고 삭제
	public String recentNoticeDelete(HashMap<String, String> param, HttpServletRequest request) {
	
		log.info("@# recentNoticeDelete");		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		
		String [] arrStr = request.getParameterValues("arrStr");//notice_num배열
        int size = arrStr.length;
        NoticeScrapDTO dto = new NoticeScrapDTO();
        log.info("@# arrStr notice_num배열====>" + Arrays.toString(arrStr));
        for(int i=0; i<size; i++) {
        	dto.setNotice_num(Integer.parseInt(arrStr[i]));//배열값이 string으로 넘어오기땨뮨에
        	dto.setUser_email(user_email);
        	
        	log.info("@# notice_num,  user_email넣은 dto====>" + dto);
        	
        	service.noticeScrapDelete(dto);
        }
		
		return "redirect:/individualrecentNotice";
	}
	
	
	
	@RequestMapping("/individualNoticeScrap") //스크랩 공고 목록
	public String individualNoticeScrap(HttpServletRequest request, Model model, Criteria2 cri2) {
		log.info("@# individualNoticeScrap");	
		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		log.info("@# individualNoticeScrap  user_email=>"+user_email);	
		
		
		log.info("@# cri=>"+cri2);
		cri2.setUser_email(user_email);
		
		log.info("@# setUser_email한 다음 cri=>"+cri2);
		
		ArrayList<ComNoticeDTO> list = new ArrayList<>();
	    list = pageService.noticelistWithPaging(cri2);
				
		log.info("@# individualNoticeScrap noticelistWithPaging=>"+list);		
		model.addAttribute("noticeList", list);
		
		int total = pageService.getNoticeTotalCount(cri2);
		log.info("@# individualNoticeScrap total=>"+total);
					
		model.addAttribute("pageMaker", new PageDTO(total,cri2));			
		
		return "individualNoticeScrap";
	}
	
	


	@RequestMapping("/noticeScrapDelete")//스크랩 공고 삭제
	public String comScrapDelete(HashMap<String, String> param, HttpServletRequest request) {
	
		log.info("@# noticeScrapDelete");		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		
		String [] arrStr = request.getParameterValues("arrStr");//notice_num배열
        int size = arrStr.length;
        NoticeScrapDTO dto = new NoticeScrapDTO();
        log.info("@# arrStr notice_num배열====>" + Arrays.toString(arrStr));
        for(int i=0; i<size; i++) {
        	dto.setNotice_num(Integer.parseInt(arrStr[i]));//배열값이 string으로 넘어오기땨뮨에
        	dto.setUser_email(user_email);
        	
        	log.info("@# notice_num,  user_email넣은 dto====>" + dto);
        	
        	service.noticeScrapDelete(dto);
        }
		
		return "redirect:/individualNoticeScrap";
	}
	
	
	
	
	
	@RequestMapping("/interComlist")//관심기업 목록조회
	public String individualInterComlist(HttpServletRequest request, Criteria2 cri, @RequestParam(value = "keyword", required = false) String keyword, Model model) {
		log.info("@# individualInterComlist");		
		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
	
		ArrayList<CompanyInfoDTO> list = pageService.comlistWithPaging(cri,request);		
		int total = pageService.getComTotalCount(user_email, keyword);
		model.addAttribute("comList", list);
//		model.addAttribute("total",total);	
		model.addAttribute("pageMaker", new PageDTO(total, cri));	
		
		return "interComlist";
	}
	
	@RequestMapping("/comScrapDelete")//관심기업 삭제
//	@ResponseBody
//	public String comScrapDelete(@RequestParam("arrStr[]") String[] arrStr, HashMap<String, String> param, HttpServletRequest request,RedirectAttributes rttr) 
	public String comScrapDelete(HashMap<String, String> param, HttpServletRequest request, RedirectAttributes rttr) 
//	public String comScrapDelete(HashMap<String, String> param, HttpServletRequest request) 
	{
		log.info("@# comScrapDelete");		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		
		String[] arrStr = request.getParameterValues("arrStr");
        int size = arrStr.length;
        ComScrapDTO dto = new ComScrapDTO();
        log.info("@# arrStr====>" + Arrays.toString(arrStr));
        log.info("@# arrStr====>" + Arrays.toString(arrStr));
        for(int i=0; i<size; i++) {
        	dto.setCom_email(arrStr[i]);
        	dto.setUser_email(user_email);
        	
        	service.comScrapDelete(dto);
        }

		return "redirect:/interComlist";
	}
	
	
	@RequestMapping("/userInfo")//회원정보수정 메뉴 > 회원정보 확인
	public String individualUserInfo(HttpServletRequest request, Model model) {
	
		log.info("@# individualUserInfo");
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		
		UserDTO dto = service.getUserInfo(user_email);
		log.info("@# individualUserInfo dto=>"+dto);
		
		
		dto.setUserAttachList(uploadService.getUserImageList(user_email));
		log.info("@# individualUserInfo jobdto=>"+uploadService.getUserImageList(user_email));
		
		
		dto.setJobInfo(service.getUserJob(user_email));
		log.info("@# individualUserInfo jobdto=>"+service.getUserJob(user_email));
		
		dto.setStackInfo(service.getUserStack(user_email));
		log.info("@# individualUserInfo jobdto=>"+service.getUserStack(user_email));
		
		
		model.addAttribute("userInfo", dto);
		
//		UserDTO dto = service.getUserInfo(user_email);
//		log.info("@# individualUserInfo dto=>"+dto);
//		model.addAttribute("userInfo", dto);
//		
//		List<UserJobDTO> jobdtos = service.getUserJob(user_email);
//		log.info("@# individualUserInfo jobdto=>"+jobdtos);
//		model.addAttribute("jobInfo", jobdtos);
//		
//		List<UserStackDTO> stackdtos = service.getUserStack(user_email);
//		log.info("@# individualUserInfo stackdto=>"+stackdtos);
//		model.addAttribute("stackInfo", stackdtos);
		
		
		return "individualUserInfo";
	}
	@RequestMapping("/modifyPage")//회원정보수정 페이지
	public String individualModifyInfo(HttpServletRequest request, Model model) {
		
		log.info("@# individualModifyInfo");
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("login_email");
		
		UserDTO dto = service.getUserInfo(user_email);
		log.info("@# individualModifyInfo dto=>"+dto);
		
		
		
		model.addAttribute("userInfo", dto);
		
//		List<UserJobDTO> jobdtos = service.getUserJob(user_email);
//		// UserJobDTO의 job 필드의 값들을 가져와 ,로 구분된 문자열로 반환
//	    String jobStr = jobdtos.stream()
//					    		.map(UserJobDTO::getJob_name)
//				                .collect(Collectors.joining(","));
//	    log.info("@# individualModifyInfo jobStr => "+jobStr);
//		model.addAttribute("user_job", jobStr);
//		
//		List<UserStackDTO> stackdtos = service.getUserStack(user_email);
//		// 리스트를 쉼표로 구분된 문자열로 변환 > 쿼리를 통해 저장하려면 JSON형식이나 문자열로 반환해서 보내줘야 함
//		 String stackStr = stackdtos.stream()
//	                .map(UserStackDTO::getStack_name)
//	                .collect(Collectors.joining(","));
//	    log.info("@# individualModifyInfo stackStr => "+stackStr);
//		model.addAttribute("user_stack", stackStr);
		
		return "individualUserInfoModify";
	}
	
	
	

	@RequestMapping("/userInfoModifyPop")
	public String userInfoModifyPop(@RequestParam HashMap<String, String> param, Model model) 
	{
		log.info("@# userInfoModifyPop 희망직무");	
		
		
		List<JoinDTO> job = joinService.job();		
		model.addAttribute("job_name", job);
		
		List<JoinDTO> job2 = joinService.job2();		
		model.addAttribute("job_name2", job2);
		
		List<JoinDTO> job3 = joinService.job3();		
		model.addAttribute("job_name3", job3);
		
		
		
		return "userInfoModifyPop";
	}
	
	@RequestMapping("/userInfoModifyPop2")
	public String userInfoModifyPop2(@RequestParam HashMap<String, String> param, Model model) 
	{
		log.info("@# userInfoModifyPop2 주요기술");	
		
		List<JoinDTO> stack =  joinService.stack();		
		model.addAttribute("stack_name", stack);
		
		List<JoinDTO> stack2 = joinService.stack2();		
		model.addAttribute("stack_name2", stack2);
		
		List<JoinDTO> stack3 = joinService.stack3();				
		model.addAttribute("stack_name3", stack3);
		
		
		return "userInfoModifyPop2";
	}
	
	
	
	
	@RequestMapping("/modifyInfo")//회원정보수정하기
//	public String individualUserInfoModify(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model){ 
	public String individualUserInfoModify(@ModelAttribute UserDTO dto,HttpServletRequest request, Model model){ //파일업로드 추가하면서 변경
	
		log.info("@# individualUserInfoModify");	
//		log.info("@# individualUserInfoModify param =>" +param);	
		log.info("@# individualUserInfoModify UserDTO =>" +dto);	

//		String input_pw = param.get("input_pw");
//        String session_pw = param.get("session_pw");
		
		HttpSession session = request.getSession();
		String session_pw = (String)session.getAttribute("login_pw");
		String user_email = (String)session.getAttribute("login_email");
		String input_pw =dto.getUser_pw();
        
		log.info("@# individualUserInfoModify session_pw =>"+input_pw);//세션 pw화인
		log.info("@# individualUserInfoModify input_pw =>"+session_pw);//사용자가 입력한 pw화인
		
		
		if (input_pw.equals(session_pw)) {//입력한 비번이 세션의 비번과 같으면
			
			service.modify(dto); //회원정보 update	
			UserDTO newDTO = service.getUserInfo(user_email);	
			
			if (dto.getUserAttachList() != null) {//파일있으면
				dto.getUserAttachList().forEach(attach ->{
					List<UserImageUploadDTO> list = uploadService.getUserImageList(user_email);
					for (int i = 0; i < list.size(); i++) {
						uploadService.deleteUserImage(list.get(i).getFileNo());//수정전 데이터 삭제
					}
					log.info("@# 사용자 사진 업로드 Impl insertUserImage 호출");
					uploadService.insertUserImage(attach);
				});
			}
			if (dto.getStackInfo() != null) {//파일있으면
				service.deleteStack(user_email);//수정전 데이터 삭제
				dto.getStackInfo().forEach(attach ->{
					log.info("@# 사용자 사진 업로드 Impl insertUserImage 호출");
					service.insertStack(attach);
				});
			}
			
			if (dto.getJobInfo() != null) {//파일있으면
				service.deleteJob(user_email);//수정전 데이터 삭제
				dto.getJobInfo().forEach(attach ->{
					log.info("@# 사용자 사진 업로드 Impl insertUserImage 호출");
					service.insertJob(attach);
				});
			}
			
			
			log.info("@# individualUserInfoModify newDTO=>"+newDTO);
			model.addAttribute("userInfo", newDTO);//업데이트 한 새 정보를 다시 모델에 담아서 넘겨줌
			
//			String user_email = param.get("user_email");
//			log.info("@# individualUserInfoModify user_email==>" + param.get("user_email"));
//			log.info("@# individualUserInfoModify user_stack==>" + param.get("user_stack"));
//			log.info("@# individualUserInfoModify user_job==>" + param.get("user_job"));
//			
//			service.deleteJob(user_email);//수정전 데이터 삭제
//			UserJobDTO jobDto = new UserJobDTO();
//			String arr [] = param.get("user_job").split(",");
//			for(int i = 0; i<arr.length; i++) 
//			{
//				jobDto.setJob_name(arr[i]);
//				jobDto.setUser_email(user_email);
//				service.insertJob(jobDto); 
//			}
//			
//			service.deleteStack(user_email);//수정전 데이터 삭제
//			UserStackDTO dto2 = new UserStackDTO();
//			String arr2 [] = param.get("user_stack").split(",");
//			for(int i = 0; i<arr2.length; i++) 
//			{
//				dto2.setUser_email(user_email);
//				dto2.setStack_name(arr2[i]);
//				service.insertStack(dto2); 
//			}	
			
			
			return "individualUserInfo";
		}else {//입력한 비번이 세션의 비번과 다르면 다시 회원정보 수정페이지로
			log.info("@# 실패 ㅠㅠ");
			
			return "redirect:individualUserInfo";
		}
	}
		
//	@RequestMapping("/insertJobStack")
//	public String insertJobStack(@RequestParam String user_email, @RequestParam String user_stack, @RequestParam String user_job, 
//							Model model, HttpServletRequest request) 
//	{		
//		log.info("@# insertJobStack로 넘어옴");		
//		log.info("@# insertJobStack user_email==>" + user_email);
//		log.info("@# insertJobStack user_stack==>" + user_stack);
//		log.info("@# insertJobStack user_job==>" + user_job);
//		
//		String arr [] = user_job.split(",");
//		for(int i = 0; i<arr.length; i++) 
//		{
//			service.insertJob(user_email, arr[i]); 
//		}
//		
//		String arr2 [] = user_stack.split(",");
//		for(int i = 0; i<arr2.length; i++) 
//		{
//			service.insertStack(user_email, arr2[i]); 
//		}		     
//		
//		return "redirect:login";
//	}
	
	
	
	
	
	
}
