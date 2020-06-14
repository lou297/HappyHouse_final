package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.HouseScore;

@Mapper
@Repository
public interface HouseScoreDao {
	
	//평가 추가
	public int addHouseScore(HouseScore houseScore) throws SQLException;
	//평가 삭제
	public int removeHouseScore(int no) throws SQLException;

	//전체 평가 조회
	public List<HouseScore> searchHouseScores(HashMap<String,Object> map) throws SQLException;
	
	//특정 동 평가 조회
	public List<HouseScore> searchHouseScoresByDong(String dong) throws SQLException;
	
	//특정 house 평가 조회
	public List<HouseScore> searchHouseScoresByNo(int houseno) throws SQLException;
	
	//조건 검색 갯수
	public int getTotalCount(HashMap<String,Object> map) throws SQLException;
	
}
