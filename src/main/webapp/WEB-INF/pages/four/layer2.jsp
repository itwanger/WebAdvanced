<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>为Layer定制常用的全局函数</title>
</head>
<body>
	<%@ include file="/resources/common/jslib.jsp"%>
	<script type="text/javascript">
$(function() {
	// 			$.error("我错了，你打我好不好");
	// 			$.error("我错了，你打我好不好", function() {
	// 				console.log("error回调");
	// 			});
	// 			$.confirm("你确定要打我吗？");
	// 			$.confirm("你确定要打我吗？", function(){
	// 				console.log("confirm回调");
	// 			});
	// 			$.msg("我已成功挨揍一次");
	$.msg("我已成功挨揍一次", function() {
		console.log("msg回调");
	});
});
	</script>
</body>
</html>
