package com.ssafy.happyhouse.util;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.happyhouse.dto.TradeHub;
import com.ssafy.happyhouse.service.TradeHubService;
import com.ssafy.happyhouse.service.TradeHubServiceImpl;

public class KMPFilter {
	private List<TradeHub> list;
	private TradeHubService service;
	
	
	public KMPFilter() {
		super();
		 service = new TradeHubServiceImpl();
		try {
			this.list = service.loadAllShops();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public KMPFilter(List<TradeHub> list) {
		super();
		this.list = list;
	}




	public List<TradeHub> getFilteredList(String dong) {
		List<TradeHub> temp = new ArrayList<>();
		
		for(TradeHub shop : list) {
			if(KMP(shop.getDongName(), dong))
				temp.add(shop);
		}
		
		return temp;
		
	}
	
	private int[] getPi(String pattern) {
		int[] pi = new int[pattern.length()];
		
		int j = 0;
		for(int i = 1; i < pattern.length(); i++) {
			
			if(pattern.charAt(i) == pattern.charAt(j)) {
				pi[i] = ++j;
			} else {
				while( j > 0 && pattern.charAt(i) != pattern.charAt(j))
					j = pi[j-1];
			}
		}
		
		return pi;
	}
	
	private boolean KMP(String origin, String pattern) {
		int[] pi = getPi(pattern);
		
		int j = 0;
		for(int i = 0 ; i < origin.length(); i++) {
			while( j > 0 && origin.charAt(i) != pattern.charAt(j)) {
				j = pi[j-1];
			}
			
			if(origin.charAt(i) == pattern.charAt(j)) {
				if(j == pattern.length() -1) 
					return true;
				else 
					j++;
			}
			
		}
		
		return false;
	}
	
	
	
	
	
}
