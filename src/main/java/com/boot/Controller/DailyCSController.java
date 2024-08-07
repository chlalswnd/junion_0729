package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.DTO.DailyCSDTO;
import com.boot.DTO.DailyCSPageDTO;
import com.boot.DTO.JaewonCriteria;
import com.boot.DTO.JoinManagementPageDTO;
import com.boot.DTO.dailyCSCriteria;
import com.boot.Service.DailyCSService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DailyCSController {

	@Autowired
	private DailyCSService dailyCSService;
	
	@PostMapping("/dailyCS")
	@ResponseBody
	public DailyCSDTO questionPop(@RequestParam Integer cs_num) { 
	    log.info("POST dailyCS====>");	    
	    
	    DailyCSDTO dto = dailyCSService.question(cs_num);
	    
	    log.info("POST dailyCS dto====>" + dto);
	    return dto;
	}

	
	@PostMapping("/modifyCheck")
	@ResponseBody
	public String modifyCheck(@RequestParam Integer cs_num, @RequestParam String user_email) { 
				
	    
	    log.info("modifyCheck cs_num====>"+cs_num);
	    log.info("modifyCheck cs_num====>"+user_email);
	    
	    dailyCSService.modifyCheck(cs_num, user_email);	    
	    dailyCSService.question(cs_num);
	    
	    return "redirect:dailyCS";
//	    return null;
	}

	@GetMapping("/dailyCS")
	public String dailyCSList(dailyCSCriteria cri3, Model model, HttpServletRequest request) 
	{	
		HttpSession session = request.getSession();		
		String session_email = (String)session.getAttribute("login_email");
		model.addAttribute("session_email",session_email);
		
		ArrayList<DailyCSDTO> list = dailyCSService.questionList(cri3);		
		model.addAttribute("list", list);		
	
		int total = dailyCSService.dailyCSGetTotalCount();
		model.addAttribute("pageMaker", new DailyCSPageDTO(total,cri3));
		
		return "dailyCS";
//		return null;
	}
	
	@PostMapping("/searchTab")
	public String searchTab(dailyCSCriteria cri3, Model model, @RequestParam("cs_type") String cs_type) 
	{			
//		ArrayList<DailyCSDTO> list = dailyCSService.searchTab(cs_type,cri3);	
		ArrayList<DailyCSDTO> list = dailyCSService.searchTab(cri3);	
		log.info("searchTab cs_type====>"+cs_type);
		model.addAttribute("list", list);		
		model.addAttribute("cs_type", cs_type);		
		
		int total = dailyCSService.dailyCSGetTotalCount();
		log.info("searchTab total====>"+total);
		
		model.addAttribute("pageMaker", new DailyCSPageDTO(total,cri3));
		
		return "dailyCS";
	}
	
	
	
	
	
	
	
	
	
	
	
}
