package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseScoreDao;
import com.ssafy.happyhouse.dto.HouseMember;
import com.ssafy.happyhouse.dto.HouseScore;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseScoreServiceImpl implements HouseScoreService{

	@Autowired
	HouseScoreDao dao;
	
	@Override
	public boolean addHouseScore(HouseScore houseScore) throws Exception {

		int n = dao.addHouseScore(houseScore);
		
		if(n > 0)
			return true;
		return false;
	}

	@Override
	public boolean removeHouseScore(int no) throws Exception {

		int n = dao.removeHouseScore(no);
		
		if(n > 0)
			return true;
		
		return false;
	}


	@Override
	public List<HouseScore> searchHouseScores(int currentPage, int sizePerPage, String contents, String houseno,
			String order) throws Exception {
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		if(houseno != null) 
			map.put("houseno", Integer.parseInt(houseno));
		
		if(contents != null)
			map.put("contents", contents);
		
		map.put("order", order);
		
		map.put("currentPage", (currentPage - 1) * sizePerPage);
		map.put("sizePerPage", sizePerPage);
		
		return dao.searchHouseScores(map);
		
	}
	


	@Override
	public List<HouseScore> searchHouseScoresByNo(int houseno) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchHouseScoresByNo(houseno);
	}

	@Override
	public List<HouseScore> searchHouseScoresByDong(String dong) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchHouseScoresByDong(dong);
	}

	@Override
	public int getTotalCount(String contents, String houseno, String order) throws Exception {

		HashMap<String,Object> map = new HashMap<String, Object>();
		
		if(houseno != null) 
			map.put("houseno", Integer.parseInt(houseno));
		
		if(contents != null)
			map.put("contents", contents);
		
		map.put("order", order);
		
		return dao.getTotalCount(map);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String contents, String houseno,
			String order) throws SQLException {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; //밑에 한번에 눌러서 갈 수 있는 페이지개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		
		////////////////////////////////////////////////////
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		if(houseno != null) 
			map.put("houseno", Integer.parseInt(houseno));
		
		if(contents != null)
			map.put("contents", contents);
		
		map.put("order", order);
		
		//////////////////////////////////////////////////////
		
		
		int totalCount = dao.getTotalCount(map); //총 게시글 수
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

	
}
