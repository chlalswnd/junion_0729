package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.CompanyListDTO;
import com.boot.DTO.CompanyPageDTO;
import com.boot.DTO.Criteria4;
import com.boot.Service.CompanyInfoService;
import com.boot.Service.CompanyListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyListController {
	@Autowired
	private CompanyInfoService infoService;
	
	@Autowired
	private CompanyListService companyListService;
	
	@RequestMapping("/comList")
//	public String comlist(HttpServletRequest request, Model model, Criteria4 cri) {
//	public String comlist(@RequestParam(name = "orderType", required = false, defaultValue = "recommendation") String orderType,
	public String comlist(@RequestParam(name = "orderType", required = false, defaultValue = "latest") String orderType,
			Criteria4 cri, Model model, HttpServletRequest request) {
		log.info("@# comList!!!!!!");
    	log.info("@# request=>"+request);
    	log.info("@# cri=>"+cri);
    	log.info("@# orderType=>"+orderType);
		
		model.addAttribute(orderType, orderType);
		
//		0725 10:40 민중
//		직군/직무 리스트
//    	ArrayList<String> jobList = infoService.getJobList();
//    	model.addAttribute("jobList",jobList);
    	
//    	기술/스택 리스트
    	ArrayList<String> stackList = companyListService.getStackList();
    	model.addAttribute("stackList",stackList);

//    	지역 리스트
    	ArrayList<String> locationList = companyListService.getLocationList();
    	model.addAttribute("locationList",locationList);
    	
//    	model.addAttribute("pageMaker", new PageDTO3(total, cri));
    	
//    	company 페이징
//    	ArrayList<CompanyInfoDAO> pageList = pageService.CompanyPageList(std);
//    	ArrayList<CompanyInfoDTO> comList = infoService.comList(cri);
//    	model.addAttribute("paging", new CompanyPageDTO(123, std));
    	
//    	ArrayList<CompanyInfoDTO> list = infoService.comList(orderType, cri);
//    	ArrayList<CompanyListDTO> list = companyListService.comList(orderType, cri);
//    	model.addAttribute("comList", list);
    	ArrayList<CompanyListDTO> comList = companyListService.comList(orderType, cri);
    	int total = companyListService.getTotalCount();
    	model.addAttribute("comList", comList);
    	model.addAttribute("pageMaker", new CompanyPageDTO(total, cri));
    	
    	log.info("@# companyPage controller cri!!=>"+cri);
		
		return "comList";
	};
	
	
	@RequestMapping("/comDetail")
	public String comDetail(String com_email, Model model) {//기업정보 상세
//		public String JobPost(int notice_num, Model model, @RequestParam HashMap<String, String> param) {//기업정보 상세
		log.info("comDetail");
		log.info("com_email!!!"+com_email);

		CompanyInfoDTO dto = infoService.companyInfo(com_email);
		model.addAttribute("company", dto);
		
		return "/comDetail";
	}
	
}
