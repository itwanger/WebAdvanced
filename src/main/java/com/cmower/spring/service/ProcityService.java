package com.cmower.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmower.database.entity.Cities;
import com.cmower.database.entity.Provinces;
import com.cmower.database.mapper.CityMapper;
import com.cmower.database.mapper.ProvinceMapper;

@Service
public class ProcityService {
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private ProvinceMapper provinceMapper;

	public List<Cities> selectCities() {
		return this.cityMapper.selectCities();
	}

	public List<Provinces> selectProvinces() {
		return this.provinceMapper.selectProvinces();
	}

	public List<Cities> getCitiesByProvinceId(Long provinceId) {
		List<Cities> list = new ArrayList<Cities>();
		for (Cities city : selectCities()) {
			if (city.getProid().compareTo(provinceId) == 0) {
				list.add(city);
			}
		}
		return list;
	}

}
