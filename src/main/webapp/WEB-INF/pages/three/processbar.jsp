<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Bootstrap进度条</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<div class="progress">
				<div class="progress-bar" style="width: 60%;">
					<span class="sr-only">60%</span>
				</div>
			</div>
		</div>

		<div class="bs-example">
			<div class="progress">
				<div class="progress-bar" style="width: 60%;">60%</div>
			</div>
		</div>
		<div class="bs-example">
			<div class="progress">
				<div class="progress-bar progress-bar-striped" style="width: 85%">
					<span class="sr-only">85%</span>
				</div>
			</div>
		</div>
		<div class="bs-example">
<div class="progress">
	<div class="progress-bar progress-bar-striped active" style="width: 85%">
		<span class="sr-only">85%</span>
	</div>
</div>
		</div>
		
		<div class="bs-example">
<div class="progress progress-sm">
	<div class="progress-bar progress-bar-striped active" style="width: 85%">
		<span class="sr-only">85%</span>
	</div>
</div>
		</div>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
