<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Bootstrap的图片</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<img class="img-rounded" src="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4" style="width: 140px; height: 140px;">
			<img class="img-circle" src="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4" style="width: 140px; height: 140px;">
			<img class="img-thumbnail" src="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4" style="width: 140px; height: 140px;">
		</div>

		<img class="img-rounded img-responsive center-block" src="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4">
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
