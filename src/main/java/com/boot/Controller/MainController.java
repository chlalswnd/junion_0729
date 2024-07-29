package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DAO.CompanyInfoDAO;
import com.boot.DAO.CompanyListDAO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.CompanyListDTO;
import com.boot.DTO.Criteria4;
import com.boot.DTO.CompanyPageDTO;
import com.boot.Service.CompanyInfo;
import com.boot.Service.CompanyListService;
import com.boot.Service.CompanyPageService;
import com.boot.Service.MainService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/main")
	public String main(Model model) {
		log.info("main!!!!!!");
//		String user_email ="tls123";
//		int user_type = 1;

//		HttpSession session = request.getSession();
//		LoginDTO dto = (LoginDTO) session.getAttribute("user_email");
//		return "login_ok";
		
		ArrayList<ComNoticeDTO> mainNotice = service.mainNotice();
		model.addAttribute("mainNotice", mainNotice);
		
		ArrayList<ComNoticeDTO> mainNewCareer = service.mainNewCareer();
		model.addAttribute("mainNewCareer", mainNewCareer);
		
		ArrayList<ComNoticeDTO> mainCareerhit = service.mainCareerhit();
		model.addAttribute("mainCareerhit", mainCareerhit);
		
		ArrayList<ComNoticeDTO> mainTodayhit = service.mainTodayhit();
		model.addAttribute("mainTodayhit", mainTodayhit);
		
		return "main";
	};
	
}
