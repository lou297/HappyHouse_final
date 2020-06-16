package com.ssafy.happyhouse.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/chat")
@RestController
public class ChatController {
	
	@PostMapping("/message")
	public void getMessage() {
		System.out.println("zzzz");
	}

	

}
