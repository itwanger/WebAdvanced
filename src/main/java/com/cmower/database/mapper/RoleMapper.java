package com.cmower.database.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.cmower.dal.BaseMapper;
import com.cmower.database.entity.Role;
import com.cmower.database.entity.RoleResource;

public interface RoleMapper extends BaseMapper<Role, Long> {
	int insertRoleResource(RoleResource roleResource);
	
	List<RoleResource> selectRoleResources(@Param(value = "roleid") long roleid);

	@Delete("delete from role_resource where resource_id = #{resource_id};")
	void deleteRoleResourceByResourceId(long resource_id);
	
	@Delete("delete from role_resource where role_id = #{roleid};")
	int deleteRoleResource(@Param(value = "roleid") long roleid);
}