package com.boot.Controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyAttachDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.CompanyListDTO;
import com.boot.DTO.CompanyPageDTO;
import com.boot.DTO.Criteria4;
import com.boot.Service.ComNoticeService;
import com.boot.Service.CompanyInfoService;
import com.boot.Service.CompanyListService;
import com.boot.Service.ScrapService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyListController {
	@Autowired
	private CompanyInfoService infoService;
	
	@Autowired
	private CompanyListService companyListService;
	
	@Autowired
	private ScrapService scrapService;

	@Autowired
	private ComNoticeService comNoticeService;

	
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
    	int total = companyListService.getTotalCount(cri);
    	model.addAttribute("comList", comList);
    	model.addAttribute("pageMaker", new CompanyPageDTO(total, cri));
    	
    	log.info("@# companyPage controller cri!!=>"+cri);
		
    	
    	//24.08.07 하진 : 관심 기업 설정을 위해 로직 추가
    	HttpSession session = request.getSession();
    	String user_email = (String) session.getAttribute("login_email");
    	log.info("로직을 잘 타고 있나요??" + user_email);
    	if(user_email != null) {
    	ArrayList<String> list = scrapService.getScrapList(user_email);
    	model.addAttribute("getScrapList", list);
    	}
    	
		return "comList";
	};
	
	
	@RequestMapping("/comDetail")
	public String comDetail(String com_email, Model model, HttpSession session) {//기업정보 상세
//	public String comDetail(String com_email, Model model) {//기업정보 상세
//		public String JobPost(int notice_num, Model model, @RequestParam HashMap<String, String> param) {//기업정보 상세
		log.info("comDetail");
		log.info("com_email!!!"+com_email);

		CompanyInfoDTO dto = infoService.companyInfo(com_email);
		model.addAttribute("company", dto);
		
		ArrayList<ComNoticeDTO> noticeList = comNoticeService.getNoticeLimit(com_email);
		model.addAttribute("noticeList", noticeList);//진행중인 공고를 조회 후 view로 가져감
		
		String user_email = (String) session.getAttribute("login_email");//세션에서 이메일 값을 얻음
		
		if(user_email != null) {//회원일 경우 쿼리를 날림
		String check = scrapService.getCheck(com_email, user_email);
		model.addAttribute("scrapEmail", check);
		
		ArrayList<Integer> list = scrapService.getScrapNoticeNum(user_email);
		model.addAttribute("scrapList", list);
		}
		
		return "/comDetail";
	}
	
//	이미지파일을 받아서 화면에 출력(byte 배열타입)
	@GetMapping("/comListDisplay")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName=>"+fileName);
		
//		업로드 파일경로+이름
		File file = new File("C:\\devv\\upload\\"+fileName);
		log.info("@# file=>"+file);
		
		ResponseEntity<byte[]> result=null;
		HttpHeaders headers=new HttpHeaders();
		
		try {
//			파일타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GetMapping(value = "/comFileList")
	public ResponseEntity<List<CompanyAttachDTO>> comFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# comFileList()");
		log.info("@# param=>"+param);
		log.info("@# param=>"+param.get("com_email"));
		
		return new ResponseEntity<>(companyListService.comFileList(param.get("com_email")), HttpStatus.OK);
	}
	
}
