package com.ssafy.happyhouse.dto;

public class RecommendHouse implements Comparable<RecommendHouse> {
	private int    houseNo;
	/**법정 동명 */
	private String dong;
	/**아파트 이름 */
	private String aptName;
	
	private double recommendPoint;

	
	
	public RecommendHouse() {
		super();
	}

	public RecommendHouse(int houseNo, String dong, String aptName, double recommendPoint) {
		super();
		this.houseNo = houseNo;
		this.dong = dong;
		this.aptName = aptName;
		this.recommendPoint = recommendPoint;
	}

	public int getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(int houseNo) {
		this.houseNo = houseNo;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public double getRecommendPoint() {
		return recommendPoint;
	}

	public void setRecommendPoint(double recommendPoint) {
		this.recommendPoint = recommendPoint;
	}

	@Override
	public int compareTo(RecommendHouse o) {
		// TODO Auto-generated method stub
		
		if(this.getRecommendPoint() > o.getRecommendPoint())
			return 1;
		else if (this.getRecommendPoint() < o.getRecommendPoint()) {
			return -1;
		}
		
		return 0;
	}
	
	
}
