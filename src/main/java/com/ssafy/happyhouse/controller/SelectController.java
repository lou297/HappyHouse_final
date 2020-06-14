package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoCode;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.service.SelectService;

@RequestMapping("/select")
@RestController
public class SelectController {
	
	@Autowired
	private SelectService selectService;
	@Autowired
	private HouseService houseService;
	
	@GetMapping("/sido")
	public ArrayList<SidoCode> sido() {
		ArrayList<SidoCode> list = null;
		
		try {
			list = selectService.selectSido();
			return list;
		} catch (Exception e) {
			return null;
		} 
	}
	
	@GetMapping("/gugun")
	public  ArrayList<SidoCode> gugun(String sido) {
		ArrayList<SidoCode> list = null;
		
		try {
			list = selectService.selectGugun(sido.substring(0, 2));
			System.out.println(list.size());
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	
	@GetMapping("/dong")
	public  List<HouseInfo> dong(String gugun) {
		List<HouseInfo> list = null;
		
		try {
			list = selectService.selectDong(gugun.substring(0, 5));
			System.out.println(list.size());
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	
	@GetMapping("/apt")
	public  List<HouseDeal> apt(String dong) {
		List<HouseDeal> list = null;
		
		try {
			list = houseService.searchByDong(dong);
			System.out.println(list.size());
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	
}
