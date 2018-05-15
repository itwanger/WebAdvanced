package com.cmower.spring.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmower.common.persistence.BaseConditionVO;
import com.cmower.database.entity.Resource;
import com.cmower.database.mapper.ResourceMapper;

@Service
public class ResourceService {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private RoleService roleService;
	@Autowired
	private ResourceMapper resourceMapper;

	/**
	 * 新增权限保存
	 */
	public void insert(Resource resource) {
		this.resourceMapper.insert(resource);
	}

	/**
	 * 编辑权限
	 */
	public void updateSelective(Resource resource) {
		this.resourceMapper.updateSelective(resource);
	}

	/**
	 * 删除菜单
	 */
	@Transactional
	public void delete(String[] ids) {
		for (String id : ids) {
			long resid = Long.parseLong(id);
			this.resourceMapper.delete(resid);
			this.roleService.deleteRoleResourceByResourceId(resid);
		}
	}

	public List<Resource> selectList(int type) {
		// 根据登陆用户获取对应权限
		Resource param = new Resource();
		param.setType(type);
		return this.resourceMapper.selectList(param);

	}

	@SuppressWarnings("rawtypes")
	public List getList(BaseConditionVO vo, RowBounds createRowBounds) {
		return this.resourceMapper.getList(vo, createRowBounds);
	}

	public long countTotal(BaseConditionVO vo) {
		return this.resourceMapper.countTotal(vo);
	}

	public Resource load(Long id) {
		return resourceMapper.load(id);
	}

}
