package com.cmower.dal;

public interface BaseMapper<T extends DataEntity<T>, PK extends java.io.Serializable> {

	PK insert(T model);

	void delete(PK modelPK);

	PK updateSelective(T model);

	T load(PK modelPK);

}
