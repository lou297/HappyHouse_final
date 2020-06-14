package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.ssafy.happyhouse.dto.HouseMember;

public interface HouseMemberService {
	// 회원가입
	public HouseMember insert(String userid, String userpwd, String username, String address, String email,Date joindate);
	
	// 로그인
	public HouseMember login(String userid, String userpwd) throws SQLException;
	
	// 회원 정보 조회
	public HouseMember search(String userid);
	
	// 전체 조회
	public List<HouseMember> searchAll();
	
	// 회원 벙보 수정
	public int update(String userid, String userpwd, String username, String address, String email, Date joindate);
	
	// 회원 정보 삭제
	public int delete(String userid);
	
	// 비밀번호 조회
	public String findPw(String userid, String username);
}
