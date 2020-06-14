package com.ssafy.happyhouse.dto;

import java.util.Date;

public class HouseScore {
	private int no;
	private String userId;
	private Date writeDate;
	private int houseNo;
	private String dong;
	private String aptName;
	private int transportationConvenience;
	private int soundProof;
	private int convenientFacilities;
	private int lighting;
	private double scoreAvg;
	private String comment;
	
	
	public HouseScore() {
		
	}


	public HouseScore(int no, String userId, Date writeDate, int houseNo, String dong, String aptName,
			int transportationConvenience, int soundProof, int convenientFacilities, int lighting, double scoreAvg,
			String comment) {
		super();
		this.no = no;
		this.userId = userId;
		this.writeDate = writeDate;
		this.houseNo = houseNo;
		this.dong = dong;
		this.aptName = aptName;
		this.transportationConvenience = transportationConvenience;
		this.soundProof = soundProof;
		this.convenientFacilities = convenientFacilities;
		this.lighting = lighting;
		this.scoreAvg = scoreAvg;
		this.comment = comment;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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


	public int getTransportationConvenience() {
		return transportationConvenience;
	}


	public void setTransportationConvenience(int transportationConvenience) {
		this.transportationConvenience = transportationConvenience;
	}


	public int getSoundProof() {
		return soundProof;
	}


	public void setSoundProof(int soundProof) {
		this.soundProof = soundProof;
	}


	public int getConvenientFacilities() {
		return convenientFacilities;
	}


	public void setConvenientFacilities(int convenientFacilities) {
		this.convenientFacilities = convenientFacilities;
	}


	public int getLighting() {
		return lighting;
	}


	public void setLighting(int lighting) {
		this.lighting = lighting;
	}


	public double getScoreAvg() {
		return scoreAvg;
	}


	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	@Override
	public String toString() {
		return "HouseScore [no=" + no + ", userId=" + userId + ", writeDate=" + writeDate + ", houseNo=" + houseNo
				+ ", dong=" + dong + ", aptName=" + aptName + ", transportationConvenience=" + transportationConvenience
				+ ", soundProof=" + soundProof + ", convenientFacilities=" + convenientFacilities + ", lighting="
				+ lighting + ", scoreAvg=" + scoreAvg + ", comment=" + comment + "]";
	}

	
	
	
	
}
