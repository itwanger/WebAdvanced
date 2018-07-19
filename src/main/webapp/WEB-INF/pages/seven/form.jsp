<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>简单的Form表单</title>
</head>
<body>
	<form action="${ctx}/seven/hello" method="post">
		<input type='text' name='content' />
		<button type="submit">提交</button>
	</form>
</body>
</html>