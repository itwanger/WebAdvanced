package com.cmower.database.entity;

import com.cmower.dal.DataEntity;

@SuppressWarnings("serial")
public class Users extends DataEntity<Users> {
	private String username;
	private String password;

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
