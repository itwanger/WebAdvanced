package com.cmower.database.entity;

import com.cmower.dal.DataEntity;

@SuppressWarnings("serial")
public class Cities extends DataEntity<Cities> {
	private Long proid;// 省份ID
	private String cname;// 名称
	private String code;// 编码

	public Long getProid() {
		return proid;
	}

	public void setProid(Long proid) {
		this.proid = proid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
