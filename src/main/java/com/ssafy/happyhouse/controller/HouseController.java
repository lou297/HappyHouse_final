package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.dto.HouseScore;
import com.ssafy.happyhouse.dto.TradeHub;
import com.ssafy.happyhouse.service.HouseScoreService;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.service.TradeHubService;
import com.ssafy.happyhouse.util.PageNavigation;

@RequestMapping("/house")
@Controller
public class HouseController {
	
	@Autowired
	private HouseService houseService;
	@Autowired
	private TradeHubService tradeHubService;
	
	
	
	
	@GetMapping("/main")
	public String main(String group,  String contents, String dong, int pg, String spp, Model model) {
		
		HousePageBean bean = new HousePageBean();
		
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);//없으면 10개 보여주고 입력받은게 있으면 그만큼 보여줌
		
		switch(group) {
		case "all" :
			boolean[] allB = {true, true, true, true};
			bean.setSearchType(allB);
			break;
		case "apt" :
			boolean[] aptB = {true, false, true, false};
			bean.setSearchType(aptB);
			break;
		case "house" :
			boolean[] houseB = {false, true, false, true};
			bean.setSearchType(houseB);
			break;
		}
		
		if(contents != null) {
			bean.setAptname(contents);
			bean.setDong(contents);
			model.addAttribute("search", contents);
		}
		
		if(dong != null) {
			bean.setDong(dong);
		}
		
		
		try {
			List<HouseDeal> dealList =houseService.searchAll(pg, sizePerPage, bean);
			int count = houseService.getTotalCount(bean);
			
			PageNavigation pageNavigation = houseService.makePageNavigation(pg, sizePerPage, bean);
			model.addAttribute("total", count);
			
			model.addAttribute("dealList", dealList);
			model.addAttribute("group", group);
			model.addAttribute("navigation", pageNavigation);

		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "/error.jsp";
		}
		
		return "house/dealList";
	}
	
	
	@GetMapping("/detail")
	public String showHouseInfo(int no, Model model) {
		
		HouseDeal deal = null;
		try {
			deal = houseService.search(no);
			deal.setDong(deal.getDong().trim());
			
//			HouseInfo info = houseService.searchHouseInfo(deal.getDong(), deal.getAptName());
			
//			System.out.println(info.toString());
			
			model.addAttribute("deal", deal);
//			model.addAttribute("info", info);
			
		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "/error.jsp";
		}
		
		try {
			List<TradeHub> shops = tradeHubService.findShopByDongName(deal.getDong().trim());

			model.addAttribute("shops", shops);
		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "/error.jsp";
		}
		
		
		
		return "/house/houseInfo";
	}
	
	@GetMapping("/info")
	public @ResponseBody HouseInfo getHouseInfo(String dong, String aptname) {
		HouseInfo info = houseService.searchHouseInfo(dong, aptname);
		
		return info;
	}
}
