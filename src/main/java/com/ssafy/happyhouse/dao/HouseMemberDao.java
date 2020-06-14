package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.HouseMember;

@Mapper
@Repository
public interface HouseMemberDao {
	// 회원 가입
	public int insert(String userid, String userpwd, String username, String address, String email,Date joindate) throws SQLException;

	// 로그인
	public HouseMember login(@Param("userid")String userid,@Param("userpwd") String userpwd) throws SQLException;

	// 회원 정보 조회
	public HouseMember search(String userid) throws SQLException;

	public List<HouseMember> searchAll() throws SQLException;

	// 회원 정보 수정
	public int update(String userid, String userpwd, String username, String address, String email, Date joindate) throws SQLException;

	// 회원 정보 삭제
	public int delete(String userid) throws SQLException;

	// 비밀번호 조회
	public String findPw(String userid, String username) throws SQLException;
}
