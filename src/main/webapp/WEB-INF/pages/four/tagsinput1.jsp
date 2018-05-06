<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Tags Input的基本应用</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<input type="text" value="朱元璋,朱允炆,朱棣,朱高炽,朱瞻基" data-role="tagsinput" />

			<div class="blank10"></div>

			<select multiple data-role="tagsinput">
				<option value="朱元璋"></option>
				<option value="朱允炆"></option>
				<option value="朱棣"></option>
				<option value="朱高炽"></option>
				<option value="朱瞻基"></option>
			</select>

			<div class="blank10"></div>
			<input class="tagsinput" type="text" maxTags="3" maxChars="3" />

		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.js"></script>

	<script>
		$(function() {
			console.log($("input[data-role=tagsinput]").val()); // 朱元璋,朱允炆,朱棣,朱高炽,朱瞻基
			console.log($("input[data-role=tagsinput]").tagsinput("items")); // ["朱元璋", "朱允炆", "朱棣", "朱高炽", "朱瞻基"]

			console.log($("select[multiple][data-role=tagsinput]").val()); // ["朱元璋", "朱允炆", "朱棣", "朱高炽", "朱瞻基"]
			console.log($("select[multiple][data-role=tagsinput]").tagsinput("items")); // ["朱元璋", "朱允炆", "朱棣", "朱高炽", "朱瞻基"]
			
			

			$("input.tagsinput").each(function() {
				var $this = $(this), maxTags = $this.attr("maxTags"), maxChars = $this.attr("maxChars");
				$this.tagsinput({
					maxTags : maxTags,
					maxChars : maxChars,
				});
			});

		});
	</script>
</body>
</html>
