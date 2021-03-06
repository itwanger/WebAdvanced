<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap的栅格系统的列偏移</title>
<%@ include file="/resources/common/csslib.jsp"%>
<style type="text/css">
.row {
	margin-bottom: 15px;
}

.row [class^=col-] {
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #eee;
	background-color: rgba(86, 61, 124, .15);
	border: 1px solid #ddd;
	border: 1px solid rgba(86, 61, 124, .2);
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4">.col-md-4</div>
			<div class="col-md-4 col-md-offset-4">.col-md-4 .col-md-offset-4</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-md-offset-1">.col-md-3 .col-md-offset-1</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
		</div>
	</div>

	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
