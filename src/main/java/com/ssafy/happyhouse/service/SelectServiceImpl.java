package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.SelectDao;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoCode;

@Service
public class SelectServiceImpl implements SelectService{
	
	@Autowired
	private SelectDao dao;


	@Override
	public ArrayList<SidoCode> selectSido() throws Exception {
		ArrayList<SidoCode> list = dao.selectSido();
		return list;
	}

	@Override
	public ArrayList<SidoCode> selectGugun(String sido) throws Exception {
		ArrayList<SidoCode> list = dao.selectGugun(sido);
		return list;
	}

	@Override
	public ArrayList<HouseInfo> selectDong(String gugun) throws Exception {
		ArrayList<HouseInfo> list = dao.selectDong(gugun);
		return list;
	}

	@Override
	public ArrayList<HouseInfo> selectApt(String dong) throws Exception {
		ArrayList<HouseInfo> list = dao.selectApt(dong);
		return list;
	}
}
