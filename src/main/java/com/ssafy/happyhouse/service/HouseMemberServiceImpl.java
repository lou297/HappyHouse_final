package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseMemberDao;
import com.ssafy.happyhouse.dto.HouseMember;


@Service
public class HouseMemberServiceImpl implements HouseMemberService {
	
	@Autowired
	private HouseMemberDao dao;
	

	@Override
	public HouseMember insert(String userid, String userpwd, String username, String address, String email, Date joindate) {
		HouseMember member = new HouseMember(userid, userpwd, username, address, email, joindate);
		
		try {
			int res = dao.insert(userid, userpwd, username, address, email, joindate);
			if(res > 0) return member;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public HouseMember search(String userid) {
		try {
			return dao.search(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<HouseMember> searchAll() {
		try {
			return dao.searchAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int update(String userid, String userpwd, String username, String address, String email, Date joindate) {
		try {
			System.out.println("housememberserviceimpl");
			return dao.update(userid, userpwd, username, address, email, joindate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	@Override
	public int delete(String userid) {
		try {
			return dao.delete(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public HouseMember login(String userid, String userpwd) throws SQLException {
		try {
			return dao.login(userid, userpwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String findPw(String userid, String username) {
		try {
			return dao.findPw(userid, username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
