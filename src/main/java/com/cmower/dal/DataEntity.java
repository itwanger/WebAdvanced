package com.cmower.dal;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public abstract class DataEntity<T> implements Serializable {
	private static final long serialVersionUID = 2210598609745930327L;

	private Long id;
	protected Long create_date;
	protected Long update_date;
	protected Integer del_flag;

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

	/**
	 * Attributes of this model
	 * 
	 */
	private Map<String, Object> attrs = getAttrsMap(); 

	private Map<String, Object> getAttrsMap() {
		return new HashMap<String, Object>();
	}

	@SuppressWarnings("unchecked")
	public T put(String key, Object value) {
		attrs.put(key, value);
		return (T) this;
	}

	@SuppressWarnings("unchecked")
	public <M> M get(String attr) {
		return (M) (attrs.get(attr));
	}

	public Map<String, Object> getAttrs() {
		return attrs;
	}

	public void setAttrs(Map<String, Object> attrs) {
		this.attrs = attrs;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
