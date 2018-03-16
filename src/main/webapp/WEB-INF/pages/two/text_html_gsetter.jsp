<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过text()和html()获取HTML元素内容</title>
<%@ include file="/resources/common/jslib.jsp"%>
</head>
<body>
	<div class="cmower">
		<div>声音驿站</div>
		<ul>
			<li>
				朗读者<strong>雅雅</strong>
			</li>
			<li>
				朗读者<strong>静静</strong>
			</li>
		</ul>
	</div>
	<hr>
	<div class="cmower1"></div>
	<div class="cmower2"></div>

<script type="text/javascript">
	$(function() {
		console.log("text()获取结果");
		console.log($(".cmower").text());
		console.log("html()获取结果");
		console.log($(".cmower").html());

		$(".cmower1").text("<p>《声音驿站》第一期：你不快乐的每一天都不是你的</p>");
		$(".cmower2").html("<p>《声音驿站》第二期：只要不快乐，你就没有生活过</p>");
	});
</script>
</body>
</html>
