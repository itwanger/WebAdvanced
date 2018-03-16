<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过data()存储、获取与元素关联的值</title>
<%@ include file="/resources/common/jslib.jsp"%>
</head>
<body>
	HTML5 data-* Attributes
	<div id="cmower" data-name="马伟青" data-favorite-coach="穆里尼奥" data-favoriteTeam="曼联"></div>
	<hr>
	data（key，value）
	<div id="cmower1"></div>

	<script type="text/javascript">
		$(function() {
			console.log("id " + $("#cmower").attr("id"));
			console.log('$("#cmower").data()');
			console.log($("#cmower").data());
			console.log("data('favorite-coach') " + $("#cmower").data("favorite-coach"));
			console.log("data('favoriteCoach') " + $("#cmower").data("favoriteCoach"));
			console.log("data('favoriteTeam') " + $("#cmower").data("favoriteTeam"));
			console.log("attr('data-favoriteTeam') " + $("#cmower").attr("data-favoriteTeam"));
			console.log("data('favoriteteam') " + $("#cmower").data("favoriteteam"));
			console.log("data('favorite-team') " + $("#cmower").data("favorite-team"));

			$("#cmower1").data("name", "马伟青");
			$("#cmower1").data("favorite", {
				coach : "穆里尼奥",
				team : "曼联",
				star : [ "C罗", "梅西" ]
			});
			console.log($("#cmower1").attr("id"));
			console.log($("#cmower1").data("name"));
			console.log($("#cmower1").data("favorite"));
			console.log($("#cmower1").data());

			// 删除name关联的数据
			// $("#cmower1").removeData("name");
			// 删除所有
			// $("#cmower1").removeData();

		});
	</script>
</body>
</html>
