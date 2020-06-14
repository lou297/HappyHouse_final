package com.ssafy.happyhouse.util;

import java.util.Map;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.ssafy.happyhouse.dto.HouseInfo;

/**
 * FoodNutritionSAXHandler와 FoodSAXHandler를 이용해서 식품 정보를 load하는 SAX Parser 프로 그램  
 *
 */
public class HouseSaxParser {
	private Map<String,HouseInfo> houseInfo;
	/**
	 * 아파트 거래 정보를 식별하기 위한 번호로 차후 DB에서는 primary key로 대체하지만 
	 * 현재 버전에서는 0번부터 순차 부여한다. 
	 */
	public static int no;
 	public HouseSaxParser() {
		loadData();
	}
 	
 	/**
 	 * HouseSAXHandler를 이용 파싱한 아파트 거래 내역을 추출한다. 
 	 */
	private void loadData() {

		SAXParserFactory factory = SAXParserFactory.newInstance();
		
		String infoFilePath = getClass().getResource("/").getPath() + "static/resources/res/AptInfo.xml";
		System.out.println(infoFilePath);
		try{
			SAXParser parser = factory.newSAXParser();
			HouseSAXHandler handler = new HouseSAXHandler();
			parser.parse(infoFilePath,handler);
			houseInfo = handler.getHouseInfo();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public Map<String, HouseInfo> getHouseInfo() {
		return houseInfo;
	}


	public void setHouseInfo(Map<String, HouseInfo> houseInfo) {
		this.houseInfo = houseInfo;
	}

}
