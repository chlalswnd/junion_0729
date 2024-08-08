package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.Criteria3;
import com.boot.DTO.OfferInfoDTO;
import com.boot.DTO.PageDTO2;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.UserDTO;
import com.boot.DTO.jobpostingIndividualDTO;
import com.boot.Service.jobpostingIndividualService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class jobpostingIndividualController {

	@Autowired
	private jobpostingIndividualService jobpostingIndividualService;
	
    // 인재풀 리스트
	/*
    @RequestMapping("/jobpostingIndividualSupport")
    public String jobpostingIndividualSupport(Model model, HttpServletRequest request) 
    {
    	log.info("@# jobpostingIndividualSupport");
    	log.info("@# request=>"+request);
    	
    	// 세션에 이메일 담아서 쓰는 법
    	HttpSession session = request.getSession();		
		String login_email = (String)session.getAttribute("login_email");
		char login_usertype = (char)session.getAttribute("login_usertype");
    	String notice_num = (String)session.getAttribute("notice_num"); 
    	log.info("@# login_email=>"+login_email);
    	log.info("@# login_usertype_str=>"+login_usertype);
//    	log.info("@# notice_num=>"+notice_num);
    	
//    	model.addAttribute("login_email",login_email);
    	model.addAttribute("login_usertype",login_usertype);
    	
    	ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport = jobpostingIndividualService.jobpostingIndividualSupport(null, notice_num);  // 전체로 공개하기때문에 이메일값 null
    	model.addAttribute("jobpostingIndividualSupport",jobpostingIndividualSupport);
    	
    	ArrayList<String> jobList = jobpostingIndividualService.getJobList();
    	model.addAttribute("jobList",jobList);

    	ArrayList<String> locationList = jobpostingIndividualService.getLocationList();
    	model.addAttribute("locationList",locationList);

    	return "jobpostingIndividualSupport";
    }
    */
    
    
    // 인재풀 리스트
    @RequestMapping("/jobpostingIndividualSupport")
    public String jobpostingIndividualSupport(@RequestParam(name = "orderType", required = false, defaultValue = "recommendation") String orderType,
    										  Criteria3 cri, Model model, HttpServletRequest request)
    {
    	//@@@@@@@@@@@@@ dao단에서 cri에 @Parm 거는걸로 해결됨 @@@@@@@@@@@@@
    	
//	public String jobpostingIndividualSupport(
//			Criteria3 cri, Model model, HttpServletRequest request)
//	{
    	log.info("@# jobpostingIndividualSupport");
    	log.info("@# request=>"+request);
    	log.info("@# cri=>"+cri);
    	log.info("@# orderType=>"+orderType);
    	
    	// 세션에 유저 정보 담아옴
    	HttpSession session = request.getSession();		
    	log.info("@# session=>"+session);
    	
    	if ((String)session.getAttribute("login_email") == null) {
    		return "redirect:login";
		} else {
			String login_email = (String)session.getAttribute("login_email");
			char login_usertype = (char)session.getAttribute("login_usertype");

			cri.setLogin_email(login_email);
	    	cri.setLogin_usertype(login_usertype);
	    	
	    	log.info("@# login_email=>"+login_email);
	    	log.info("@# login_usertype=>"+login_usertype);
	    	log.info("@# cri.login_usertype=>"+cri.getLogin_usertype());
	    	
	    	model.addAttribute("login_email",login_email);
	    	model.addAttribute("login_usertype",login_usertype);
	    	model.addAttribute("orderType",orderType);// 화면단에서 orderType 확인하기 위함
	    	
	    	
	    	// 직군/직무 리스트
	    	ArrayList<String> jobList = jobpostingIndividualService.getJobList();
	    	model.addAttribute("jobList", jobList);
	    	
	    	// 기술스택 리스트
	    	ArrayList<String> stackList = jobpostingIndividualService.getStackList();
	    	model.addAttribute("stackList", stackList);
	    	
	    	// 지역 리스트
	    	ArrayList<String> locationList = jobpostingIndividualService.getLocationList();
	    	model.addAttribute("locationList", locationList);
	    	
	    	// 제안하기 정보
	    	ArrayList<OfferInfoDTO> offerInfo = jobpostingIndividualService.getOfferInfo(login_email);
	    	model.addAttribute("offerInfo", offerInfo);
	    	
	    	ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport = jobpostingIndividualService.jobpostingIndividualSupport(orderType, cri);
//	    	ArrayList<jobpostingIndividualDTO> jobpostingIndividualSupport = jobpostingIndividualService.jobpostingIndividualSupport(cri);
	    	
	    	for (int i = 0; i < jobpostingIndividualSupport.size(); i++) {
	    		int resumeNum = jobpostingIndividualSupport.get(i).getResume_num();
	    		int check_offer = jobpostingIndividualService.checkOffer(login_email, resumeNum);
				jobpostingIndividualSupport.get(i).setCheck_offer(check_offer);
			}
	    	
	    	// @@@@@@@@@@@@@@@@@ 페이징 total 사이즈 잘못들어오는거 cri 파라미터로 xml에 where조건 달아서 수정 @@@@@@@@@@@@@@@@@@@@@@@@@@
//	    	int total = jobpostingIndividualService.getTotalCount();
	    	int total = jobpostingIndividualService.getTotalCount(cri);
//	    	int total = jobpostingIndividualSupport.size();
	    	log.info("@# total=>"+total);
	    	model.addAttribute("jobpostingIndividualSupport",jobpostingIndividualSupport);
	    	model.addAttribute("pageMaker", new PageDTO2(total, cri));
	
	    	return "jobpostingIndividualSupport";
		}
    }
    
    @RequestMapping("/sendOffer")
//    public String sendOffer(@RequestParam String userEmail, @RequestParam String offerInfo) {
//    public String sendOffer(@RequestParam Param param) {
//    public String sendOffer(String userEmail, OfferInfoDTO offerInfo) {
//		log.info("userEmail=>"+userEmail);
//		log.info("param=>"+param);
    public String sendOffer(@ModelAttribute OfferInfoDTO offerInfoDTO) {
    	
    	log.info("offerInfoDTO=>"+offerInfoDTO);
    	
    	jobpostingIndividualService.insertOffer(offerInfoDTO);
    	
    	return "redirect:jobpostingIndividualSupport";
    }
    
    
    // =============================  인재풀 끝  ==========================
    
    
    
    
    @RequestMapping("/resumeInfo2")
	public String resumeInfo2(@RequestParam int resumeNum, Model model, HttpServletRequest request) 
	{
		log.info("@# resume/resumeInfo");	
//		HttpSession session = request.getSession();		
//		String login_email = (String)session.getAttribute("login_email");
		
		ResumeDTO dto = jobpostingIndividualService.resumeInfo(resumeNum);
		UserDTO dtos = jobpostingIndividualService.userInfo(dto.getUser_email());
		log.info("@# UserDTO dtos==========>"+dtos);
		
		String user_name =  dtos.getUser_name();
		String user_gender = dtos.getUser_gender();
		String user_tel = dtos.getUser_tel();
		String user_location = dtos.getUser_location();
		String user_location2 = dtos.getUser_location2();
		String user_birthdate = dtos.getUser_birthdate();
		
		dto.setResume_age(user_birthdate);				
		
		model.addAttribute("resumeInfo", dto);
		model.addAttribute("user_gender", user_gender);
		model.addAttribute("user_tel", user_tel);
		model.addAttribute("user_location", user_location);
		model.addAttribute("user_location2", user_location2);
		model.addAttribute("user_name", user_name);
		
		log.info("@# dto==========>"+dto);	
		
		
		String link = dto.getResume_portfolio_url();
		log.info("@# link===========>"+link);
        model.addAttribute("links", link);
        
		
		
		return "resumeInfo2";
	}
    
    // =============================  이력서 열람 끝  ==========================
}
