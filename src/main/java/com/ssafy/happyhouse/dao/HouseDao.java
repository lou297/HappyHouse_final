package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;

@Mapper
@Repository
public interface HouseDao {
	/**
	 * 아파트 거래 정보를 xml 파일에서 로딩하는 기능
	 */
	public void loadData();

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를 검색해서 반환.
	 * 
	 * @param sizePerPage
	 * @param currentPage
	 * @param bean        검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */

//	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, HousePageBean bean) throws SQLException;
	public List<HouseDeal> searchAll(HashMap<String,Object> map) throws SQLException;
	
	public List<HouseDeal> searchNoByDongAptName(HashMap<String,Object> map) throws SQLException;
	
	public int getTotalCount(HashMap<String,Object> map) throws SQLException;

	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환.
	 * 
	 * @param no 검색할 아파트 식별 번호
	 * @return 아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) throws SQLException;

	public int addHouseDeal(String dong, String aptName, int code, String dealAmount, int buildYear, int dealYear,
			int dealMonth, int dealDay, double area, int floor, String jibun, String type, String rentMoney)
			throws SQLException;

	// 동이름으로 찾기
	public List<HouseDeal> searchByDong(String dong) throws SQLException;

	// 건축연도로 찾기
	public List<HouseDeal> searchByBuildYear(int buildYear) throws SQLException;

	// 거래연도로 찾기
	public List<HouseDeal> searchByDealYear(int dealYear) throws SQLException;

	// 전용면적 범위로 찾기
	public List<HouseDeal> searchByAreaScope(Integer min, Integer max) throws SQLException;

	int getTotalCount(HousePageBean bean) throws SQLException;
}
