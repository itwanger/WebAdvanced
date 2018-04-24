<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>switch的HTML扩展</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<h2 class="demo-title">案例</h2>
		<div class="demo-list clearfix">
			<div class="row">
				<input class="switch" type="checkbox" checked>
				<input class="switch" type="checkbox" data-on-text="开" checked>
				<input class="switch" type="checkbox" data-on-text="<i class='glyphicon glyphicon-ok'></i>" checked>
				<input class="switch" type="checkbox">
				<input class="switch" type="checkbox" data-off-text="关">
				<input class="switch" type="checkbox" data-off-text="<i class='glyphicon glyphicon-remove'></i>">
			</div>
		</div>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
