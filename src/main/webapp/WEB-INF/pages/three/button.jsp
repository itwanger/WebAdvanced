<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Bootstrap的按钮</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<button type="button" class="btn btn-default">默认</button>
			<button type="button" class="btn btn-primary">首选项</button>
			<button type="button" class="btn btn-success">成功</button>
			<button type="button" class="btn btn-info">一般信息</button>
			<button type="button" class="btn btn-warning">警告</button>
			<button type="button" class="btn btn-danger">危险</button>
			<button type="button" class="btn btn-link">链接</button>
		</div>

		<div class="bs-example">
			<button type="button" class="btn btn-default">默认</button>
			<button type="button" class="btn btn-warning btn-lg">超大</button>
			<button type="button" class="btn btn-primary btn-sm">较小</button>
			<button type="button" class="btn btn-danger btn-xs">超小</button>
		</div>
		<div class="bs-example">
			<button type="button" class="btn btn-info btn-lg btn-block">嗨，我很宽吧？</button>
		</div>
		<div class="bs-example">
			<a class="btn btn-primary" href="#" role="button">链接</a>
			<input class="btn btn-success" type="submit" value="提交">
		</div>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
