package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.TradeHub;


@Mapper
@Repository
public interface TradeHubDao {
	public List<TradeHub> findShopByDongName(String dongName) throws SQLException;

	public List<TradeHub> findShopByCategory(String bigCategoryName) throws SQLException;

	public List<String> showShopCategorys() throws SQLException;

	public List<String> showShopDongNames() throws SQLException;

	public List<TradeHub> loadAllShops() throws SQLException;
}
