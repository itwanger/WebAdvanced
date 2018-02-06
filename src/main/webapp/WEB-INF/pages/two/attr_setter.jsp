<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过attr()设置HTML属性值</title>
</head>
<body>
	<img id="cmower1" src="${pageContext.request.contextPath}/resources/images/cmower160x160.jpg" alt="沉默王二">
	<img id="cmower2" src="${pageContext.request.contextPath}/resources/images/cmower160x160.jpg" alt="沉默王二">
	<img id="cmower" src="${pageContext.request.contextPath}/resources/images/cmower160x160.jpg" alt="沉默王二">
	<img id="cmower3" src="${pageContext.request.contextPath}/resources/images/cmower160x160.jpg" alt="沉默王二">
	<img id="cmower4" src="${pageContext.request.contextPath}/resources/images/cmower160x160.jpg" alt="沉默王二">

	<%@ include file="/resources/common/jslib.jsp"%>
	<script type="text/javascript">
		$(function() {
			// 改变alt属性值，传递当前属性名alt，以及一个新的属性值“我是沉默王二”
			$("#cmower1").attr("alt", "我是沉默王二");

			// 增加一个新的属性title
			$("#cmower2").attr("title", "沉默王二的头像");

			// 一次性设置多个属性值
			// 如果要同时改变alt属性值，并增加一个新的属性title，
			// 那么就需要传递一个键值对对象，
			// 键与值之间通过英文:隔开，键值对之间通过英文,隔开
			// 另外，此方式下的属性名可以不使用双引号包裹
			$("#cmower3").attr({
				"alt" : "我是沉默王二",
				title : "沉默王二的头像"
			});

			// 通过方法计算属性值
			// 当我们需要通过一些复杂的计算得出属性值时，此方式就显得尤为重要
			$("#cmower4").attr("title", function() {
				return $(this).attr("alt") + " - 的偶像是MJ";
			});
		});
	</script>
</body>
</html>
