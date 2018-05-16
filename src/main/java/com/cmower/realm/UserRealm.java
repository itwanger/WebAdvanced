package com.cmower.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.cmower.database.entity.Resource;
import com.cmower.database.entity.Users;
import com.cmower.spring.service.ResourceService;
import com.cmower.spring.service.UserService;

public class UserRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;
	@Autowired
	private ResourceService resourceService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

		List<String> roles = new ArrayList<String>();
		List<String> permissions = new ArrayList<String>();

		Users user = userService.loadOne(username);
		if (user != null) {
			if (StringUtils.isNotEmpty(user.getRoleName())) {
				roles.add(user.getRoleName());

				List<Resource> resources = resourceService.selectList(null, user.getRoleId());
				for (Resource resource : resources) {
					permissions.add(resource.getPermission());
				}
			}
		}

		authorizationInfo.addRoles(roles);
		authorizationInfo.addStringPermissions(permissions);
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		Users user = userService.loadOne(username);

		if (user == null) {
			throw new UnknownAccountException("账号不存在");// 没找到帐号
		}

		return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
	}

}
