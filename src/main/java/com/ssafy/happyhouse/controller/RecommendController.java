package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.RecommendHouse;
import com.ssafy.happyhouse.dto.TradeHub;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.service.TradeHubService;

@RequestMapping("/recommend")
@Controller
public class RecommendController {
	
	@Autowired
	private HouseService houseService;
	
	@Autowired
	private TradeHubService tradeHubService;
	
	@GetMapping("/info")
	public String getRecommendList(@RequestParam String search, @RequestParam String category, Model model) throws Exception {
		
		List<HouseInfo> infoList = houseService.searchHouseInfoList(search);
		
		System.out.println(infoList.size());
		
		List<TradeHub> tradehubList = tradeHubService.findFilteredShops(search, category);
		System.out.println(tradehubList.size());
		PriorityQueue<RecommendHouse> recommends= new PriorityQueue<>();
		
		double max = 0;
		for(HouseInfo house : infoList) {
			double dist = 0;
			for(TradeHub tradehub : tradehubList) {
				dist += Math.abs(house.getLat() - tradehub.getLatitude()) + Math.abs(house.getLng() - tradehub.getLongitude());
			}
			
			max= Math.max(max, dist);
			RecommendHouse recommend = new RecommendHouse();
			
			recommend.setAptName(house.getAptName());
			recommend.setDong(house.getDong());
			recommend.setHouseNo(house.getNo());
			recommend.setRecommendPoint(dist);
			
			recommends.offer(recommend);
		}

		ArrayList<RecommendHouse> result = new ArrayList<>();

		
		for(int i = 0; i < 20; i++) {
			if(!recommends.isEmpty()) {
				RecommendHouse recom = recommends.poll();
				double point = recom.getRecommendPoint() / max * 100;
				
				point = (Math.round((100-point)*10)/10.0);
				if(point == 0)
					break;
				recom.setRecommendPoint(point);
				
				recom.setHouseNo(houseService.searchNoByDongAptName(recom.getDong(), recom.getAptName()).getNo());
				
				result.add(recom);
			}
		}
		
		System.out.println(result.size());
		model.addAttribute("cnt", tradehubList.size());
		model.addAttribute("recommends", result);
		model.addAttribute("category", category);
		model.addAttribute("search", search);
		
		return "/tradehubBaseSearch/tradeHubBaseSearch";
	}
	
}
