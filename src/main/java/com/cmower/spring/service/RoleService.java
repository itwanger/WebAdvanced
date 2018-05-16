package com.cmower.spring.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmower.common.exception.OrderException;
import com.cmower.dal.Page;
import com.cmower.database.entity.Role;
import com.cmower.database.entity.RoleResource;
import com.cmower.database.mapper.RoleMapper;

@Service
public class RoleService {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private RoleMapper roleMapper;

	@Transactional
	public void addRole(Role role, String resource_ids) {
		this.roleMapper.insert(role);

		if (resource_ids != null && !resource_ids.trim().equals("")) {
			String[] rIdList = resource_ids.split(",");
			for (String rId : rIdList) {
				RoleResource roleResource = new RoleResource();
				roleResource.setResource_id(Long.valueOf(rId));
				roleResource.setRole_id(role.getId());
				this.roleMapper.insertRoleResource(roleResource);
			}
		}
	}

	/**
	 * 编辑角色
	 */
	@Transactional
	public void editRole(Role role, String resource_ids) {
		this.roleMapper.updateSelective(role);

		this.roleMapper.deleteRoleResource(role.getId());

		if (StringUtils.isNotEmpty(resource_ids)) {
			String[] rIdList = resource_ids.split(",");
			for (String rId : rIdList) {
				RoleResource roleResource = new RoleResource();
				roleResource.setResource_id(Long.valueOf(rId));
				roleResource.setRole_id(role.getId());
				this.roleMapper.insertRoleResource(roleResource);
			}
		}
	}

	/**
	 * 删除角色信息
	 */
	@Transactional
	public void deleteRole(String idstr) {
		for (String id : idstr.split(",")) {
			long roleid = Long.parseLong(id);

			Role role = this.roleMapper.load(roleid);

			if (role.getName().equals("ROLE_1000")) {
				throw new OrderException("角色名为ROLE_1000的角色不可删除");
			}

			// 用户角色权限配置
			this.roleMapper.deleteRoleResource(role.getId());
			// 删除角色信息
			this.roleMapper.delete(role.getId());
		}
	}

	public Role loadOne(String name) {
		Role param = new Role();
		param.setName(name);
		return this.roleMapper.loadOne(param);
	}

	@SuppressWarnings("rawtypes")
	public List getList(Page vo, RowBounds createRowBounds) {
		return this.roleMapper.getList(vo, createRowBounds);
	}

	public int countTotal(Page vo) {
		return this.roleMapper.countTotal(vo);
	}

	public Role load(Long roleid) {
		return this.roleMapper.load(roleid);
	}

	public List<RoleResource> selectRoleResources(Integer roleid) {
		return this.roleMapper.selectRoleResources(roleid);
	}

	public void deleteRoleResourceByResourceId(long resid) {
		this.roleMapper.deleteRoleResourceByResourceId(resid);
	}

}
