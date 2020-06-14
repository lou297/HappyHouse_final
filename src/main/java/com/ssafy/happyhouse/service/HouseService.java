package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.util.PageNavigation;
public interface HouseService {
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param sizePerPage 
	 * @param currentPage 
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, HousePageBean  bean);
	
	public int getTotalCount(HousePageBean  bean) throws SQLException;
	
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no);
	
	//구현한 부분 코드
	//입력
	public void insertHouseInfo(String dong, String aptName, int code, int buildYear, String jibun, String lat, String lng, String img);
	//모든 houseInfo 조회
	public List<HouseInfo> searchAllHouseInfo();
	
	public HouseDeal addHouseDeal(String dong, String aptName, int code, String dealAmount, int buildYear, int dealYear, int dealMonth, int dealDay,
			double area, int floor, String jibun, String type, String rentMoney);
	
	public List<HouseDeal> searchByDong(String dong);

	public List<HouseDeal> searchByBuildYear(int buildYear);

	public List<HouseDeal> searchByDealYear(int dealYear);

	public List<HouseDeal> searchByAreaScope(Integer min, Integer max);
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, int totalCount) throws SQLException;

	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean) throws SQLException;
}
