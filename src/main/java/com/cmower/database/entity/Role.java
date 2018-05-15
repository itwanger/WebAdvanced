package com.cmower.database.entity;

import com.cmower.dal.DataEntity;

public class Role extends DataEntity<Role> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3613696301162067500L;
	private String name;
	private String description;
	private String role_serial;

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRole_serial() {
		return role_serial;
	}

	public void setRole_serial(String role_serial) {
		this.role_serial = role_serial;
	}

}
