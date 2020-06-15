package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseDao;
import com.ssafy.happyhouse.dao.HouseInfoDao;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.exception.HappyHouseException;
import com.ssafy.happyhouse.util.HouseSaxParser;
import com.ssafy.happyhouse.util.PageNavigation;


@Service
public class HouseServiceImpl implements HouseService{
	private static Map<String, HouseInfo> houseInfo;

	
	@Autowired
	private HouseDao houseDao;
	@Autowired
	private HouseInfoDao infoDao;

	
	public void init() {
		if(houseInfo == null) {
			HouseSaxParser hsp = new HouseSaxParser();
			houseInfo = hsp.getHouseInfo();
		}
	}
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, HousePageBean  bean){
		try {
			boolean[] types = bean.getSearchType();
			int cnt = 0;
			for(boolean t : types) {
				if(t) {
					cnt++;
				}
			}
			
			if(cnt==0) {
				throw new HappyHouseException("주택 타입은 반드시 한개 이상을 선택해주셔야 합니다.");
			}
			
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("aptname", bean.getAptname());
			map.put("dong", bean.getDong());
			map.put("searchType", bean.getSearchType());
			map.put("currentPage", (currentPage - 1) * sizePerPage);
			map.put("sizePerPage", sizePerPage);
//			return houseDao.searchAll((currentPage - 1) * sizePerPage, sizePerPage, bean);
			return houseDao.searchAll(map);
		} catch (SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
	
	@Override
	public int getTotalCount(HousePageBean bean) throws SQLException {
		// TODO Auto-generated method stub
		try {
			boolean[] types = bean.getSearchType();
			int cnt = 0;
			for(boolean t : types) {
				if(t) {
					cnt++;
				}
			}
			
			if(cnt==0) {
				throw new HappyHouseException("주택 타입은 반드시 한개 이상을 선택해주셔야 합니다.");
			}
			
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("aptname", bean.getAptname());
			map.put("dong", bean.getDong());
			map.put("searchType", bean.getSearchType());

			return houseDao.getTotalCount(map);
		} catch (SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
	
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) {
		try {
			HouseDeal deal = houseDao.search(no);
			
			if(deal == null) {
				throw new HappyHouseException(String.format("거래번호 %d번에 해당하는 주택거래 정보가 존재하지 않습니다.", no));
			}
			
			init();
			
			String key = deal.getDong().trim() + deal.getAptName().trim();
			
			HouseInfo info = houseInfo.get(key);
			
			if (info != null) {
				deal.setImg(info.getImg());
			} else {
				deal.setImg("다세대주택.jpg");
			}
			
			return deal;
		} catch (SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
	//구현한 부분
	@Override
	public void insertHouseInfo(String dong, String aptName, int code, int buildYear, String jibun, String lat,
			String lng, String img) {
		try {
			infoDao.insertHouseInfo(dong, aptName, code, buildYear, jibun, lat, lng, img);
		} catch (Exception e) {
			throw new HappyHouseException("주택 정보 입력 중 오류 발생");
		}
	}
	@Override
	public List<HouseInfo> searchAllHouseInfo() {
		try {
			return infoDao.searchAllHouseInfo();
		} catch (SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
	

	@Override
	public HouseDeal addHouseDeal(String dong, String aptName, int code, String dealAmount, int buildYear, int dealYear,
			int dealMonth, int dealDay, double area, int floor, String jibun, String type, String rentMoney) {
		try {
			int n = houseDao.addHouseDeal(dong, aptName, code, dealAmount, buildYear, dealYear, dealMonth, dealDay, area, floor, jibun, type, rentMoney);
			if(n ==1) {
				HouseDeal hd = new HouseDeal();
				hd.setDong(dong);
				hd.setAptName(aptName);
				hd.setCode(code);
				hd.setDealAmount(dealAmount);
				hd.setBuildYear(buildYear);
				hd.setDealYear(dealYear);
				hd.setDealMonth(dealMonth);
				hd.setDealDay(dealDay);
				hd.setArea(area);
				hd.setFloor(floor);
				hd.setJibun(jibun);
				hd.setType(type);
				hd.setRentMoney(rentMoney);
				
				return hd;
			}
		} catch(SQLException e) {
			throw new HappyHouseException("거래 정보 추가 중 오류 발생");
		}
		return null;
		
	}
	
	@Override
	public List<HouseDeal> searchByDong(String dong) {
		try {
			return houseDao.searchByDong(dong);
		} catch(SQLException e) {
			throw new HappyHouseException("동으로 검색 중 오류 발생");
		}
	}
	
	@Override
	public List<HouseDeal> searchByBuildYear(int buildYear) {
		try {
			return houseDao.searchByBuildYear(buildYear);
		} catch(SQLException e) {
			throw new HappyHouseException("건설연도로 검색 중 오류 발생");
		}
	}
	
	@Override
	public List<HouseDeal> searchByDealYear(int dealYear) {
		try {
			return houseDao.searchByDealYear(dealYear);
		} catch(SQLException e) {
			throw new HappyHouseException("검색연도로 검색 중 오류 발생");
		}
	}
	
	@Override
	public List<HouseDeal> searchByAreaScope(Integer min, Integer max) {
		try {
			return houseDao.searchByAreaScope(min, max);
		} catch(SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
	
	
	
	//
	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean) throws SQLException {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; //밑에 한번에 눌러서 갈 수 있는 페이지개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = houseDao.getTotalCount(bean); //총 게시글 수
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount-1)/sizePerPage+1; //전체 페이지 수 계산
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage<=naviSize; //true면 이전 버튼 못누름
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount-1)/naviSize*naviSize<currentPage; //true면 다음 버튼 못누름
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
	
	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, int totalCount) throws SQLException {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; //밑에 한번에 눌러서 갈 수 있는 페이지개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
//		int totalCount = houseDao.getTotalCount(bean); //총 게시글 수
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount-1)/sizePerPage+1; //전체 페이지 수 계산
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage<=naviSize; //true면 이전 버튼 못누름
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount-1)/naviSize*naviSize<currentPage; //true면 다음 버튼 못누름
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
	@Override
	public HouseInfo searchHouseInfo(String dong, String aptname) {
		// TODO Auto-generated method stub
		
		HouseInfo info = null;
		
		try {
			info = infoDao.searchHouseInfo(dong, aptname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return info;
	}

	
	
	
}




