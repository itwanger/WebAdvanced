<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Star Rating的基本应用</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-star-rating/4.0.3/css/star-rating.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<input class="rating" value="5">
			<div class="blank10"></div>
			<input class="star-rating" value="5">
			<div class="blank10"></div>
			<input class="star-rating" value="1" data-min="1" data-max="5" data-step="0.1">
			<div class="blank10"></div>
			<input class="star-rating" value="1" data-show-clear="false">
			<div class="blank10"></div>
			<input class="star-rating" value="1" data-show-caption="false">
			<div class="blank10"></div>
			<input class="star-rating" data-size="xs">
			<div class="blank10"></div>
			<input class="star-rating" data-size="sm">
			<div class="blank10"></div>
			<input class="star-rating" data-size="md">
			<div class="blank10"></div>
			<input class="star-rating" data-size="lg">
			<div class="blank10"></div>
			<input class="star-rating" data-size="xl">
			<div class="blank10"></div>
			<input class="star-rating" value="2" data-min="0" data-max="8" data-step="2" data-stars="8">
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-star-rating/4.0.3/js/star-rating.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-star-rating/4.0.3/js/locales/zh.js"></script>

	<script>
		$(function() {
			$('input.star-rating').each(function() {
				var $this = $(this), displayOnly = $this.is("[displayOnly]");
				$this.rating({
					language : "zh",
					displayOnly : displayOnly,
				});
			});

		});
	</script>
</body>
</html>
