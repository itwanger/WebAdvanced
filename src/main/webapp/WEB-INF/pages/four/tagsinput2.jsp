<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Tags Input的HTML扩展</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<input class="tagsinput" type="text" maxTags="3" maxChars="3" value="朱元璋,朱允炆" />
		</div>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
