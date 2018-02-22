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

<p class="blessing">
  新春快乐, <span>沉默王二</span> <em>恭祝大家狗年旺旺旺。</em>.
</p>
<p class="blessing1">
  新春快乐, <span>沉默王二</span> <em>恭祝大家狗年旺旺旺。</em>.
</p>
<script type="text/javascript">
	$(function() {
		// 2.4.1 查找节点
		console.log($("div").filter(".star").text());// 输出 王力宏
		console.log($("div").find(".star").text());// 输出 周杰伦

		// 2.4.2 遍历节点
		$("li").each(function(index, element) {
			// element == this
			console.log("li "+ index +" 元素的className：" + this.className);
		});
		
		// 回调函数
		var _toString = function(index, element) {
			if (this.className) {
				return this.localName + "." + this.className;
			}
			return this.localName;
		};
		console.log("li 元素的className：" + $("li").map(_toString).get());// 不调用join()方法的时候，默认分隔符为英文的“,”
		
		console.log("ul.level-2的子元素个数 " + $("ul.level-2").children().length); // 输出 3
		
		console.log("li.item-a的父元素 " + $("li.item-a").parent().map(_toString).get());// ul.level-2
		console.log("li.item-a的祖先元素 " + $("li.item-a").parents().map(_toString).get().join("，")); // ul.level-2，li.item-ii，ul.level-1，body，html

		console.log("li.item-ii的后一个元素 " + $("li.item-ii").next().map(_toString).get());// li.item-iii
		console.log("li.item-ii的前一个元素 " + $("li.item-ii").prev().map(_toString).get());// li.item-i
		
		console.log("li.item-ii的同辈元素 " + $("li.item-ii").siblings().map(_toString).get().join("，"));// li.item-i，li.item-iii
		
		// 2.4.3 创建并插入节点
		var hello = $("<p>新年好</p>");
		$("body").append(hello);
		
		// 2.4.4 删除节点
		$(".blessing").empty();
		$(".blessing1").remove();
	});
</script>
</body>
</html>
