package com.cmower.database.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.cmower.database.entity.Cities;

public interface CityMapper {

	@Select("select * from city")
	List<Cities> selectCities();

}
