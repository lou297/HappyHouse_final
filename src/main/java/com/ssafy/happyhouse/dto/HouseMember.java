package com.ssafy.happyhouse.dto;

import java.util.Date;

/**
 * @author stitc
 *
 */

public class HouseMember {
	private String userid; // PK
	private String userpwd;
	private String username;
	private String address;
	private String email;
	private Date joindate;

	public HouseMember() {}

	public String getUserid() {
		return userid;
	}

	public HouseMember(String userid, String userpwd, String username, String address, String email, Date joindate) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.address = address;
		this.email = email;
		this.joindate = joindate;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "HouseMember [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", address="
				+ address + ", email=" + email + ", joindate=" + joindate + "]";
	}
	
}
