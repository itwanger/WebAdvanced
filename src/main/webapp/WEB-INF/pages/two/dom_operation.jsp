<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过jQuery方法操作DOM节点</title>
<%@ include file="/resources/common/jslib.jsp"%>
</head>
<body>
	<div class="main">
		<p class="star">周杰伦</p>
	</div>
	<div class="star">
		<p>王力宏</p>
	</div>

	<ul class="level-1">
		<li class="item-i">I</li>
		<li class="item-ii">II
			<ul class="level-2">
				<li class="item-a">A</li>
				<li class="item-b">B
					<ul class="level-3">
						<li class="item-1">1</li>
						<li class="item-2">2</li>
						<li class="item-3">3</li>
					</ul>
				</li>
				<li class="item-c">C</li>
			</ul>
		</li>
		<li class="item-iii">III</li>
	</ul>
<script type="text/javascript">
	$(function() {
		console.log($("div").filter(".star").text());// 输出 王力宏
		console.log($("div").find(".star").text());// 输出 周杰伦

		console.log("ul.level-2的子元素个数 " + $("ul.level-2").children().length); // 输出 3

		var _getClassName = function() {
			if (this.className) {
				return this.localName + "." + this.className;
			}
			return this.localName;
		};
		console.log("li.item-a的父元素 " + $("li.item-a").parent().map(_getClassName).get());// ul.level-2
		console.log("li.item-a的祖先元素 " + $("li.item-a").parents().map(_getClassName).get().join(", ")); // ul.level-2, li.item-ii, ul.level-1, body, html
	});
</script>
</body>
</html>
