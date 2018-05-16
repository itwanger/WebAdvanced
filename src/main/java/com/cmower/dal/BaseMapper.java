package com.cmower.dal;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

public interface BaseMapper<T extends DataEntity<T>, PK extends java.io.Serializable> {

	PK insert(T model);

	PK delete(PK modelPK);

	PK updateSelective(T model);

	T load(PK modelPK);
	
	T loadOne(T param);

	List<T> getList(Page vo, RowBounds rowBounds);

	Integer countTotal(Page vo);
	
	List<T> selectList(T param);
}
