package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.HouseInfo;

@Mapper
@Repository
public interface HouseInfoDao {

	/** HouseInfo DB에 새로운 데이터를 입력. */
	public int insertHouseInfo(String dong, String aptName, int code, int buildYear, String jibun, String lat,
			String lng, String img);

	/** HouseInfo DB에 위도 경도 입력하기 위해서 등록된 모든 집의 동과 지번을 추출한다. */
	public List<HouseInfo> searchAllHouseInfo() throws SQLException;
}
