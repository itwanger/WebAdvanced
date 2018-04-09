<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Lazyload1的实现方案</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="bs-example">
		<c:forEach begin="1" end="100">
			<div class="row">
				<img class="lazyload" data-original="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4&<%=Math.random() %>"
					style="width: 140px; height: 140px;">
			</div>
		</c:forEach>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
