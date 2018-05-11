package com.cmower.spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.cmower.database.entity.Users;
import com.cmower.database.mapper.UserMapper;

public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	public void insert(Users users) {
		users.preInsert();
		this.userMapper.insert(users);
	}

	public long updateSelective(Users param) {
		if (param.getId() == null) {
			throw new RuntimeException("更新数据时ID未赋值");
		}

		param.preUpdate();
		return this.userMapper.updateSelective(param);
	}

	public Users load(long userid) {
		return this.userMapper.load(userid);
	}
}
