<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Geetest——更可靠的安全验证工具</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#">
				<b>极验</b>Geetest
			</a>
		</div>
		<div class="login-box-body">
			<p class="login-box-msg">更可靠的安全验证工具</p>

			<form id="geetestForm" class="bootstrap-validator" action="${ctx}/six/checkGeetest" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="username" data-bv-notempty data-bv-blank placeholder="账号">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="password" data-bv-notempty data-bv-blank placeholder="密码">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				<div class="form-group geetest" data-url="${ctx}/six/geetest">
					<p class="wait">正在加载验证码......</p>
				</div>

				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck" data-skin="square">
							<label>
								<input type="checkbox">
								记住我
							</label>
						</div>
					</div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
				</div>
			</form>

		</div>

		<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
