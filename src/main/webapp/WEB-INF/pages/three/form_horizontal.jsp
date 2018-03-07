<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Bootstrap的水平排列表单</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
<div class="container">
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">引荐人</label>
			<div class="col-sm-10">
				<p class="form-control-static">沉默王二</p>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">邮箱</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" placeholder="邮箱">
				<span class="help-block">使用邮箱登陆可以及时收到新的资讯</span>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" placeholder="密码">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
					<label> <input type="checkbox"> 记住我
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">登陆</button>
			</div>
		</div>
	</form>
</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
