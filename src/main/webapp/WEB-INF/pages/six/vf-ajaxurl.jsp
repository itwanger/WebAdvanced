<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Validform | 实时验证</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href=""><b>Web</b>Advance</a>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg">注册</p>

			<form id="vfAjaxurlForm" action="" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="账号" name="username" datatype="*" ajaxurl="${ctx}/six/check"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="密码"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="重复密码"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
					</div>
					<div class="col-offset-xs-8 col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="/resources/common/jslib.jsp"%>

</body>
</html>
