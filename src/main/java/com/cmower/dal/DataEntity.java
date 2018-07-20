package com.cmower.dal;

import java.io.Serializable;

@SuppressWarnings("serial")
public abstract class DataEntity<T> extends BaseEntity<T> implements Serializable {

	private Long id;
	protected Long create_date;
	protected Long update_date;
	protected Integer del_flag;

	public DataEntity(Long id) {
		super();
		this.id = id;
	}

	public DataEntity() {
	}

	public void preInsert() {
		setUpdate_date(System.currentTimeMillis());
		setCreate_date(getUpdate_date());
	}

	public void preUpdate() {
		setUpdate_date(System.currentTimeMillis());
	}

	public Long getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Long create_date) {
		this.create_date = create_date;
	}

	public Long getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Long update_date) {
		this.update_date = update_date;
	}

	public Integer getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(Integer del_flag) {
		this.del_flag = del_flag;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
