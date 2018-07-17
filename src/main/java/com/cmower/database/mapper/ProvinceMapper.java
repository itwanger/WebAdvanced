package com.cmower.database.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.cmower.database.entity.Provinces;

public interface ProvinceMapper {

	@Select("select * from province")
	List<Provinces> selectProvinces();

}
