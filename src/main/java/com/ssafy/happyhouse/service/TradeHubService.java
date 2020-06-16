package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.TradeHub;

public interface TradeHubService {
	public int getTotalCount(List<TradeHub> hub) throws SQLException;
	
	public List<TradeHub> findShopByDongName(String dongName) throws Exception;
	
	public List<TradeHub> findShopByCategory(String bigCategoryName) throws Exception;
	
	public List<String> showShopCategorys() throws Exception;
	
	public List<String> showShopDongNames() throws Exception;
	
	public List<TradeHub> loadAllShops() throws Exception;
}
