<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>HTML5 Canvas——绘制红色矩形</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<canvas id="chartJS" width="200" height="100"></canvas>
	<script type="text/javascript">
		var chartJS = document.getElementById("chartJS");
		var cxt = chartJS.getContext("2d");
		cxt.fillStyle = "#FF0000";
		cxt.fillRect(0, 0, 200, 100);
	</script>
</body>
</html>
