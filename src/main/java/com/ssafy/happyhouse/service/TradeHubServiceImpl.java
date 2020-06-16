package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.TradeHubDao;
import com.ssafy.happyhouse.dto.TradeHub;
import com.ssafy.happyhouse.exception.HappyHouseException;

@Service
public class TradeHubServiceImpl implements TradeHubService{
	
	@Autowired
	TradeHubDao tradeHubDao;

	
	@Override
	public int getTotalCount(List<TradeHub> hub) throws SQLException {
		if(hub.size()==0) {
			throw new HappyHouseException("해당상권 정보가 없습니다.");
		}
		return hub.size();
	}
	
	
	@Override
	public List<TradeHub> findShopByDongName(String dongName) throws Exception {
		if(dongName == null) {
			throw new Exception();
		}
		return tradeHubDao.findShopByDongName(dongName);
	}



	@Override
	public List<TradeHub> findShopByCategory(String bigCategoryName) throws Exception {
		if(bigCategoryName == null) {
			throw new Exception();
		}
		return tradeHubDao.findShopByCategory(bigCategoryName);
	}



	@Override
	public List<String> showShopCategorys() throws Exception {
		
		return tradeHubDao.showShopCategorys();
	}



	@Override
	public List<String> showShopDongNames() throws Exception {

		return tradeHubDao.showShopDongNames();
	}
	
	@Override
	public List<TradeHub> loadAllShops() throws Exception {
		// TODO Auto-generated method stub
		return tradeHubDao.loadAllShops();
	}

}
