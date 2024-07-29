package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.DTO.DailyCSDTO;
import com.boot.Service.DailyCSService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DailyCSController {

	@Autowired
	private DailyCSService dailyCSService;
	
	@GetMapping("/dailyCS")
	public String dailyCSList(Model model, HttpServletRequest request) 
	{	
		ArrayList<DailyCSDTO> list = dailyCSService.questionList();
		model.addAttribute("list", list);		

		return "dailyCS";
	}
	
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
	public String modifyCheck(@RequestParam Integer cs_num, HttpServletRequest request) { 
		
		HttpSession session = request.getSession();		
		String user_email = (String)session.getAttribute("login_email");
	    log.info("modifyCheck====>");
	    
	    log.info("modifyCheck cs_num====>"+cs_num);
	    log.info("modifyCheck cs_num====>"+user_email);
	    
	    dailyCSService.modifyCheck(cs_num, user_email);	    
	    
	    return "redirect:dailyCS";
	}
	
	
	
	
	
	
	
	
	
	
	
}
