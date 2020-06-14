package com.ssafy.happyhouse.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.dto.QnA;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@Controller
@RequestMapping("/qnapage")
public class QnAPageController {
	
	@ApiOperation(value = "글번호에 해당하는 질문게시글의 정보를 반환한다.", response = QnA.class)    
	@GetMapping("/main")
	public String gotoMain() {
		 
//		return "redirect:/resources/index.html";
		return "qna/qnaMain";
	}
	
}
