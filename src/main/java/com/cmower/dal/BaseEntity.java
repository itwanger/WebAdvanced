package com.cmower.dal;

import java.util.HashMap;
import java.util.Map;

public class BaseEntity<T> {
	/**
	 * Attributes of this model
	 * 
	 */
	protected Map<String, Object> mo = new HashMap<String, Object>();

	@SuppressWarnings("unchecked")
	public T put(String key, Object value) {
		mo.put(key, value);
		return (T) this;
	}

	@SuppressWarnings("unchecked")
	public <M> M get(String attr) {
		return (M) (mo.get(attr));
	}

	public Map<String, Object> getMo() {
		return mo;
	}

	public void setMo(Map<String, Object> mo) {
		this.mo = mo;
	}

}
