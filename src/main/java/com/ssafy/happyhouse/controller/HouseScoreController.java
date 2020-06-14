package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseMember;
import com.ssafy.happyhouse.dto.HouseScore;
import com.ssafy.happyhouse.service.HouseScoreService;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.service.HouseServiceImpl;
import com.ssafy.happyhouse.util.PageNavigation;

@RequestMapping("/score")
@Controller
public class HouseScoreController {

	@Autowired
	HouseScoreService service;
	@Autowired
	private HouseService houseService;
	
	//특정 house에 대한 정보
	@GetMapping("/main")
	public String getHouseScores(String contents, String houseno, String order, int pg, String spp, Model model) {
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);
		
		try {
			
			int total = service.getTotalCount(contents, houseno, order);
			List<HouseScore> scores = service.searchHouseScores(pg, sizePerPage, contents, houseno, order);
			PageNavigation navigation = service.makePageNavigation(pg, sizePerPage, contents, houseno, order);
			
			if(contents != null) {
				model.addAttribute("contents", contents);
			}
			
			model.addAttribute("order", order);
			model.addAttribute("total", total);
			model.addAttribute("scores", scores);
			model.addAttribute("navigation", navigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "evaluation/evaluationList";
	}
	
	@GetMapping("/evaluation")
	public String evaluate(String no, Model model) {
		
		model.addAttribute("houseno",no);
		return "evaluation/evaluationForm";
	}
	
	@PostMapping("/evaluationForm")
	public String evaluationForm(HouseScore houseScore,HttpSession session, Model model) throws Exception {
		
		HouseMember houseMember = (HouseMember) session.getAttribute("userinfo");
		houseScore.setUserId(houseMember.getUserid()); // 아이디
		
		HouseDeal housedeal = houseService.search(houseScore.getHouseNo());// 아파트정보
		houseScore.setAptName(housedeal.getAptName());
		houseScore.setDong(housedeal.getDong());
		System.out.println(houseScore.toString());
		service.addHouseScore(houseScore);
		
		return "redirect:/score/main?pg=1&order=DATE";
	}
	
	@GetMapping("/house")
	public @ResponseBody List<HouseScore> getHouseScoresByNo(int houseno) {
		
		List<HouseScore> list = null;
		
		try {
			list = service.searchHouseScoresByNo(houseno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@GetMapping("/dong")
	public @ResponseBody List<HouseScore> getHouseScoresByDong(String dong) {
		
		List<HouseScore> list = null;
		
		try {
			list = service.searchHouseScoresByDong(dong);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
