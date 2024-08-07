package com.boot.Controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.Service.ScrapService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScrapController {	
	
	@Autowired
	private ScrapService scrapService;

	
	@RequestMapping("/uploadcomScrap")
	//public void comScrap(HashMap<String, String> param){//관심기업 스크랩
	public ResponseEntity<Boolean> uploadcomScrap(@RequestParam HashMap<String, String> param){//관심기업 스크랩
		log.info("uploadcomScrap controller!!!");
		log.info("uploadcomScrap controller param!!! "+param);
	
		
		boolean result = scrapService.uploadcomScrap(param);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}


	@RequestMapping("/scrapNotice")
	//public boolean scrapNotice(@RequestParam HashMap<String, String> param){
	public ResponseEntity<Boolean> scrapNotice(@RequestParam HashMap<String, String> param){// 관심 공고 스크랩
		log.info("scrapNotice!!!");
		log.info("scrapNotice param!!!"+param);
		
		boolean result = scrapService.checkScrapNotice(param);
		
//		return result;
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}



}
















