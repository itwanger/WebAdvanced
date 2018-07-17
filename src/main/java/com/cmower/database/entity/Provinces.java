package com.cmower.database.entity;

import com.cmower.dal.DataEntity;

@SuppressWarnings("serial")
public class Provinces extends DataEntity<Provinces> {
	private String proname;// 名称
	private String procode;// 编码

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getProcode() {
		return procode;
	}

	public void setProcode(String procode) {
		this.procode = procode;
	}

}
