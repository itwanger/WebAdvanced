<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax全局事件</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
<%@ include file="/resources/common/jslib.jsp"%>
<script type="text/javascript">
	$(function() {
		// 配置
		NProgress.configure({
			// 不显示转动的小圆圈
			showSpinner : false
		});

		// 页面绑定ajaxStart、ajaxStop方法
		$(document).ajaxStart(function() {
			// 启动
			NProgress.start();
		}).ajaxStop(function() {
			// 结束
			NProgress.done();
		});

		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/two/ajaxNprogress",
			success : function(text) {
				alert("Ajax 请求响应结果：" + text);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(textStatus);
			}
		});
	});
</script>
</body>
</html>
