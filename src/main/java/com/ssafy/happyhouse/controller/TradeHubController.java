package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.dto.TradeHub;
import com.ssafy.happyhouse.service.TradeHubService;
import com.ssafy.happyhouse.util.KMPFilter;

@RequestMapping("/tradehub")
@Controller
public class TradeHubController {
	
	@Autowired
	private TradeHubService tradeHubService;
	
	@GetMapping("/category")
	public String findShopByCategory(String selected, Model model) {
		
		List<String> categorys = null;
		try {
			categorys = tradeHubService.showShopCategorys();
			
			model.addAttribute("categorys", categorys);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<TradeHub> shops;
		try {
			if(selected == null)
				shops = tradeHubService.findShopByCategory(categorys.get(0));
			else {
				shops = tradeHubService.findShopByCategory(selected);
				model.addAttribute("selected", selected);
			}
			
			model.addAttribute("shops", shops);
			
		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "/error.jsp";
		}
		
		return "/tradehub/tradeHubList";
	}
	
	@GetMapping("/dong")
	public String findShopByDongName(String selected, Model model) {
		List<String> dongNames = null;
		try {
			dongNames = tradeHubService.showShopDongNames();
			model.addAttribute("dongNames", dongNames);
			
		} catch(Exception e) {
			model.addAttribute("msg", "동 명 로드 실패");
			return "/error.jsp";
		}
		
		try {
			List<TradeHub> shops;
			KMPFilter filter = new KMPFilter(tradeHubService.loadAllShops());
			
			if(selected == null) {
				shops = filter.getFilteredList(dongNames.get(0));
			}
			else {
				shops = filter.getFilteredList(selected);
				model.addAttribute("selected", selected);
			}
			model.addAttribute("shops", shops);
			
		} catch(Exception e) {
			model.addAttribute("msg", "업종 정보 로드 실패");
			return "/error.jsp";
		}
		return "/tradehub/tradeHubList";
	}
}
