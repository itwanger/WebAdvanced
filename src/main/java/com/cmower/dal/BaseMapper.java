package com.cmower.dal;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.cmower.common.persistence.BaseConditionVO;

public interface BaseMapper<T extends DataEntity<T>, PK extends java.io.Serializable> {

	PK insert(T model);

	PK delete(PK modelPK);

	PK updateSelective(T model);

	T load(PK modelPK);
	
	T loadOne(T param);

	List<T> getList(BaseConditionVO vo, RowBounds rowBounds);

	Integer countTotal(BaseConditionVO vo);
	
	List<T> selectList(T param);
}
