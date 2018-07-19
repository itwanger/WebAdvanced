<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Web全栈开发进阶之路 | 登录</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#">
				<b>Web</b>全栈开发进阶之路
			</a>
		</div>
		<div class="login-box-body">
			<p class="login-box-msg">登录系统，开启崭新旅程</p>

			<form id="loginForm" action="${ctx}/seven/checkLogin" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="username" data-bv-notempty data-bv-blank placeholder="账号">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="password" data-bv-notempty data-bv-blank placeholder="密码">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				<div class="row kaptcha">
					<div class="col-xs-8">
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="kaptchaCode" data-bv-notempty data-bv-blank placeholder="验证码">
							<span class="glyphicon glyphicon-screenshot form-control-feedback"></span>
						</div>
					</div>
					<div class="col-xs-4">
						<img class="img-responsive" src="${ctx}/seven/kaptcha" />
					</div>
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

			<div class="social-auth-links text-center">
				<p>- OR -</p>
				<a href="#" class="btn btn-block btn-social btn-microsoft btn-flat">
					<i class="fa fa-qq"></i> 使用QQ登录
				</a>
			</div>

			<a href="#">找回密码</a>
			<a href="#" class="pull-right">注册账号</a>
		</div>
	</div>

	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
