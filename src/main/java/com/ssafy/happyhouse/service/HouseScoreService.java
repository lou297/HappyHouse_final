package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.dto.HouseScore;
import com.ssafy.happyhouse.util.PageNavigation;

public interface HouseScoreService {
	public boolean addHouseScore(HouseScore houseScore) throws Exception;
	
	public boolean removeHouseScore(int no) throws Exception;
	
	//score list를 위한 service
	public List<HouseScore> searchHouseScores(int currentPage, int sizePerPage, String contents, String houseno, String order) throws Exception;
	
	//특정 house에 대한 평점
	public List<HouseScore> searchHouseScoresByNo(int houseno) throws Exception;
	
	//특정 dong에 대한 평점
	public List<HouseScore> searchHouseScoresByDong(String dong) throws Exception;
	
	public int getTotalCount(String contents, String houseno, String order) throws Exception;
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String contents, String houseno, String order) throws SQLException;
}
