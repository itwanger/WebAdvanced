package com.cmower.database.entity;

import com.cmower.dal.DataEntity;

public class UserRole extends DataEntity<UserRole> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1686554411714293877L;
	private Integer memberId;
	private Integer roleId;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
