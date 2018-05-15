package com.cmower.database.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.cmower.dal.BaseMapper;
import com.cmower.database.entity.UserRole;

public interface UserRoleMapper extends BaseMapper<UserRole, Integer> {

	/**
	 * 通过当前用户角色数量
	 */
	int countByRoleids(@Param(value = "ids") String ids);

	@Delete("delete from user_role where member_id=#{user_id}")
	void deleteByUserId(int user_id);

}